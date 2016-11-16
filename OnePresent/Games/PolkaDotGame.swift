//
//  PolkaDotGame.swift
//  OnePresent
//
//  Created by Maxym on 5/9/16.
//  Copyright © 2016 sjinnovation. All rights reserved.
//

import UIKit
import SpriteKit

class PolkaDotGame: SKScene {

    var dotArray  = [SKSpriteNode]()
    var counter = 0
    var round = 0
    var background:SKNode!

    override func didMove(to view: SKView) {
        if let node = childNode(withName: "background") {
            background = node
        }
        if let node = childNode(withName: "DayOnePresentImage") {
            node.run(SKAction.fadeOut(withDuration: 3)) {
                SKTAudio.sharedInstance().playNarration("polkaDotHint")
                SKTAudio.sharedInstance().playBackgroundMusic("polkadotBackground")
                node.zPosition = -2
                self.creatDots()
            }
        }
    }
    
    func creatDots() {
        for _ in 0...4 {
            createNewDot()
        }
        for dot in dotArray {
            if dot.name != "completed" {
                dot.run(SKAction.fadeOut(withDuration: 10))
            }
        }
        self.run(SKAction.afterDelay(10, runBlock: {
            SKTAudio.sharedInstance().playNarration("polkaDotError")
            for dot in self.dotArray {
                if dot.name != "completed" {
                    dot.name = "failed"
                    dot.removeFromParent()
                }
            }
            self.clearAllDots()
        }), withKey: "resetAction")
    }
    
    func createNewDot() {
        let side = Int.random(1, max: 4)
        let dotSize = Int.random(1, max: 2)
        let dot = initDot(dotSize)
        spawnDotOnLocation(dot: dot, side: side)
    }
    
    func initDot(_ dotSize:Int) -> SKSpriteNode {
        let name:String!
        if dotSize == 1 {
            name = "bigDot"
        } else {
            name = "smallDot"
        }
        let dot = SKSpriteNode(imageNamed: name)
        dot.name = name
        dot.zPosition = 3
        return dot
    }
    
    func spawnDotOnLocation(dot:SKSpriteNode, side:Int) {
        if let sideSprite = background.childNode(withName: "side\(side)") {
            dot.position = CGPoint(x:Int.random(Int(sideSprite.frame.origin.x + dot.frame.size.width/2), max: Int(sideSprite.frame.origin.x + sideSprite.frame.size.width - dot.frame.size.width/2)), y:Int.random(Int(sideSprite.frame.origin.y + dot.frame.size.height/2), max: Int(sideSprite.frame.origin.y + sideSprite.frame.size.height - dot.frame.size.height/2)))
            if dotArray.count == 0 {
                dotArray.append(dot)
                background.addChild(dot)
            } else {
                var inFrame = false
                for oldDot in dotArray {
                    if dot.frame.intersects(oldDot.frame) {
                        inFrame = true
                    }
                }
                if inFrame {
                    createNewDot()
                } else {
                    dotArray.append(dot)
                    background.addChild(dot)
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>?, with event: UIEvent?) {
        super.touchesBegan(touches!, with: event)
        if let touch = touches?.first  {
            let location = touch.location(in: background)
            for dot in dotArray {
                if dot.contains(location) {
                    if dot.name  != "checked" {
                        dot.run(SKAction.setTexture(SKTexture(imageNamed: dot.name! + "Pressed")))
                        dot.name = "checked"
                        SKTAudio.sharedInstance().playSoundEffect("Duck Squeak short")
                        counter += 1
                        if counter == 5 {
                            round += 1
                            if round == 3 {
                                SKTAudio.sharedInstance().playSoundEffect("gameVictory")
                                if let scene = GetPresentPage(fileNamed:"DayOneGetPresent"),
                                    let explosion = childNode(withName: "explosion") {
                                    scene.day = .dayOne
                                    self.explosionAnimation(explosion: explosion, scene:scene)
                                }
                            } else {
                                self.removeAction(forKey: "resetAction")
                                for dot in self.dotArray {
                                    dot.name = "completed"
                                    dot.run(SKAction.fadeIn(withDuration: 0.5)) {
                                        dot.removeAllActions()
                                    }
                                }
                                clearAllDots()

                            }
                        } else {
                        }
                    }
                }
            }
        }
    }
    
    func clearAllDots() {
        dotArray = dotArray.filter() {$0.name != "failed"}
        counter = 0
        creatDots()
    }
    
    override func willMove(from view: SKView) {
        SKTAudio.sharedInstance().pauseBackgroundMusic()
    }
    
}
