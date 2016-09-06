//
//  PolkaDotGame.swift
//  OnePresent
//
//  Created by Maxym on 5/9/16.
//  Copyright © 2016 sjinnovation. All rights reserved.
//

import UIKit
import SpriteKit

@available(iOS 9.0, *)
class PolkaDotGame: SKScene {

    var dotArray  = [SKSpriteNode]()
    var counter = 0
    var cameraNode:SKCameraNode!

    override func didMove(to view: SKView) {

        let cameraNode = SKCameraNode()
        cameraNode.position = CGPoint(x: size.width/2, y: size.height/2)
        self.addChild(cameraNode)
        self.camera = cameraNode
        let panGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
        createNewDot()
    }
    
    func createNewDot() {
        let side = Int.random(1, max: 4)
        let dot = initDot(side)
        spawnDotOnLocation(dot: dot, side: side)
    }
    
    func initDot(_ side:Int) -> SKSpriteNode {
        let name:String!
        if side == 1 || side == 2{
            name = "bigDot"
        } else {
            name = "smallDot"
        }
        let dot = SKSpriteNode(imageNamed: name)
        dot.name = name
        dot.zPosition = 2
        return dot
    }
    
    func spawnDotOnLocation(dot:SKSpriteNode, side:Int) {
        let sideSprite = childNode(withName: "side\(side)")!
        dot.position = CGPoint(x:Int.random(Int(sideSprite.frame.origin.x + dot.frame.size.width/2), max: Int(sideSprite.frame.origin.x + sideSprite.frame.size.width - dot.frame.size.width/2)), y:Int.random(Int(sideSprite.frame.origin.y + dot.frame.size.height/2), max: Int(sideSprite.frame.origin.y + sideSprite.frame.size.height - dot.frame.size.height/2)))
        if dotArray.count == 0 {
            dotArray.append(dot)
            self.addChild(dot)
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
                self.addChild(dot)
            }
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>?, with event: UIEvent?) {
        super.touchesBegan(touches!, with: event)
        for touch in touches!  {
            let location = touch.location(in: self)
            
            for dot in dotArray {
                if dot.contains(location) {
                    if dot.name  != "checked" {
                        dot.run(SKAction.setTexture(SKTexture(imageNamed: dot.name! + "Pressed")))
                        dot.name = "checked"
                        SKTAudio.sharedInstance().playSoundEffect("Duck Squeak short")
                        counter += 1
                        if counter == 15 {
                            SKTAudio.sharedInstance().playSoundEffect("gameVictory")
                            self.run(SKAction.afterDelay(4, runBlock: {
                                if let scene = GetPresent(fileNamed:"DayOneGetPresent") {
                                    scene.day = .dayOne
                                    let transition = SKTransition.moveIn(with: .right, duration: 0.3)
                                    self.view?.presentScene(scene, transition: transition)
                                }
                            }))
                        } else {
                            createNewDot()
                        }
                    }
                } else {
//                    self.camera?.run(SKAction.move(to: location, duration: 0.1))
                }
            }
        }
    }
    

    func handlePan(pinchGesture:UIPinchGestureRecognizer) {
        let scale:CGFloat!
        if pinchGesture.velocity >= 0 {
            scale = 1
        } else {
            scale = 0.5
        }
        let zoomInAction = SKAction.scale(to: scale, duration: 0.5)
        self.camera?.run(zoomInAction)
    }
    
}