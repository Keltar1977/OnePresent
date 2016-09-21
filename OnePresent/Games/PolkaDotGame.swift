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
    var background:SKNode!

    override func didMove(to view: SKView) {
        if let node = childNode(withName: "background") {
            background = node
        }
        if let node = childNode(withName: "DayOnePresentImage") {
            node.run(SKAction.fadeOut(withDuration: 3)) {
                SKTAudio.sharedInstance().playBackgroundMusic("polkadotBackground")
                node.zPosition = -2
                self.createNewDot()
            }
        }
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
        for touch in touches!  {
            let location = touch.location(in: background)
            for dot in dotArray {
                if dot.contains(location) {
                    if dot.name  != "checked" {
                        dot.run(SKAction.setTexture(SKTexture(imageNamed: dot.name! + "Pressed")))
                        dot.name = "checked"
                        SKTAudio.sharedInstance().playSoundEffect("Duck Squeak short")
                        counter += 1
                        if counter == 15 {
                            SKTAudio.sharedInstance().playSoundEffect("gameVictory")
                            if let scene = GetPresentPage(fileNamed:"DayOneGetPresent"),
                                let explosion = childNode(withName: "explosion") {
                                scene.day = .dayOne
                                self.explosionAnimation(explosion: explosion, scene:scene)
                            }
                        } else {
                            if let background = childNode(withName: "background") {
                                background.xScale = -background.xScale
                            }
                            createNewDot()
                        }
                    } else {
                        clearAllDots()
                    }
                    return
                }
            }
            clearAllDots()
        }
    }
    
    func clearAllDots() {
        dotArray.removeAll()
        background.enumerateChildNodes(withName: "checked", using: {node, stop in
            node.removeFromParent()
        })
        background.enumerateChildNodes(withName: "bigDot", using: {node, stop in
            node.removeFromParent()
        })
        background.enumerateChildNodes(withName: "smallDot", using: {node, stop in
            node.removeFromParent()
        })
        counter = 0
        createNewDot()
    }
    
    override func willMove(from view: SKView) {
        SKTAudio.sharedInstance().pauseBackgroundMusic()
    }
    
}
