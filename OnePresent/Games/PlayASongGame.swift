//
//  PlayASongGame.swift
//  OnePresent
//
//  Created by Maxym on 5/10/16.
//  Copyright © 2016 sjinnovation. All rights reserved.
//

import UIKit
import SpriteKit

class PlayASongGame: SKScene {

    let colorArray = [UIColor.red, UIColor.orange, UIColor.blue, UIColor.brown,UIColor.darkGray, UIColor.yellow, UIColor.cyan]
    var nodeArray = [SKSpriteNode]()
    let pattern = [[2,3,2,0,2,3,2,0,6,6,4,5,5,2],[2,0,1,2,2,2,3,4,5,5,0,1,2,2,2,3,2,1,1],[2,0,1,2,5,4,5,6,5,4,3,2]]
    var counter = 0
    var sequence = 0
    var titleNode:SKSpriteNode!
    override func didMove(to view: SKView) {

        for i in 0..<7 {
            let node = self.childNode(withName: "key\(i)") as! SKSpriteNode
            nodeArray.append(node)

        }
        
        setTitle()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>?, with event: UIEvent?) {
        super.touchesBegan(touches!, with: event)
        
        for touch in touches!  {
            let location = touch.location(in: self)
            
            for node in nodeArray {
                if node.contains(location) {
                    SKTAudio.sharedInstance().playSoundEffect("Piano " + node.name!)
                    node.run(SKAction.animate(with: [SKTexture(imageNamed:node.name! + "Pressed"),SKTexture(imageNamed: node.name! + "Normal")], timePerFrame: 0.5))
                    if node.name == "key\(pattern[sequence][counter])" {
                        counter += 1
                    } else {
                        counter = 0
                    }
                    
                    if counter == pattern[sequence].count {
                        counter = 0
                        sequence += 1
                        if sequence <= 2 {
                          setTitle()
                        } else {
                            let endpoint = childNode(withName: "endpoint")!
                            let snowman = childNode(withName: "snowman")!
                            SKTAudio.sharedInstance().playSoundEffect("snowmanSound")
                            snowman.run(SKAction.move(to: endpoint.position, duration: 2)) {
                                SKTAudio.sharedInstance().playSoundEffect("gameVictory")
                                self.run(SKAction.afterDelay(4, runBlock: {
                                    if let scene = GetPresentPage(fileNamed:"DayTwoGetPresent") {
                                        scene.day = .dayTwo
                                        let transition = SKTransition.moveIn(with: .right, duration: 0.3)
                                        self.view?.presentScene(scene, transition: transition)
                                    }
                                }))
                            }
                        }
                        

                    }
                }
            }
        }
    }
    
    
    func setTitle() {
        if (titleNode != nil) {
            titleNode.removeFromParent()
        }
        let center = self.childNode(withName: "SequenceTitle")
        titleNode = SKSpriteNode(imageNamed: "sequence\(sequence)")
        titleNode.position = center!.position
        titleNode.name = "titleNode";
        titleNode.zPosition = 100;
        self.addChild(titleNode)
    }
}
