//
//  SimonGame.swift
//  OnePresent
//
//  Created by Maxym on 5/16/16.
//  Copyright © 2016 sjinnovation. All rights reserved.
//

import UIKit
import SpriteKit

class SimonGame: SKScene {
    
    

    var sequance = [Int]()
    var nodeArray = [SKNode]()
    var lengthOfSequance = 0
    var counter = 0
    var updating = false
    override func didMove(to view: SKView) {
        if let node = childNode(withName: "DayFivePresentImage") {
            run(SKAction.afterDelay(2, runBlock: {
                node.zPosition = -2
            }))
        }
        nodeArray = [childNode(withName: "blue")!,childNode(withName: "yellow")!,childNode(withName: "green")!,childNode(withName: "purple")!]
        updateSequance()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>?, with event: UIEvent?) {
        if !updating {
            super.touchesBegan(touches!, with: event)
            for touch in touches!  {
                let location = touch.location(in: self)
                var hasMatch = false

                for node in nodeArray {
                    if node.contains(location) {
                        self.run(self.playNode(node))
                        if node.name == resolveColors(sequance[counter]) {
                            hasMatch = true
                        }
                    }
                }

                
                if hasMatch && counter != lengthOfSequance - 1 {
                    counter += 1
                } else if hasMatch && counter == lengthOfSequance - 1 {
                    updating = true
                    counter = 0
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
                        self.updateSequance()
                    })
                } else if !hasMatch {
                    sequance.removeAll()
                    counter = 0
                    lengthOfSequance = 0
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
                        self.updateSequance()
                    })
                }
            }
        }
    }


    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.isUserInteractionEnabled = true
    }
    
    func playNode(_ node:SKNode) -> SKAction {
        node.zPosition = 0
        let changeToGlow = SKAction.setTexture(SKTexture(imageNamed:node.name! + "Glow"))
        let changeToNormal = SKAction.setTexture(SKTexture(imageNamed:node.name! + "Normal"))
        let soundAction = SKAction.playSoundFileNamed("Chime " + node.name!, waitForCompletion: false)
        let wait = SKAction.wait(forDuration: 0.5)
        return SKAction.run {
            node.run(SKAction.sequence([changeToGlow,soundAction,wait,changeToNormal]))
        }
        
    }

    
    func updateSequance() {
        lengthOfSequance += 1
        guard lengthOfSequance != 6 else {
            SKTAudio.sharedInstance().playSoundEffect("gameVictory")
            self.run(SKAction.afterDelay(4, runBlock: {
                if let scene = GetPresentPage(fileNamed: "DayFiveGetPresent") {
                    scene.day = .dayFive
                    self.goToScene(scene, transition: .curlUp, fromIndexPage: false)
                }
            }))
            return
        }
        generateSequance()
        playSequance()
        updating = false
        
    }
    
    func playSequance() {
        var actionArray = [SKAction]()
        actionArray.append(SKAction.wait(forDuration: 1.0))
        for i in 0..<sequance.count {
            for node in nodeArray {
                if node.name == resolveColors(sequance[i]) {
                    actionArray.append(playNode(node))
                    actionArray.append(SKAction.wait(forDuration: 0.5))
                }
            }
        }
        self.run(SKAction.sequence(actionArray)) {
            self.isUserInteractionEnabled = true
        }
        
    }
    
    func resolveColors(_ colorId:Int) -> String {
        switch colorId {
        case 0:
            return "blue"
        case 1:
            return "green"
        case 2:
            return "yellow"
        case 3:
            return "purple"
        default:
            return ""
        }
    }
    
    func generateSequance() {
        sequance.append(Int.random(0, max: 3))
    }
    
}

