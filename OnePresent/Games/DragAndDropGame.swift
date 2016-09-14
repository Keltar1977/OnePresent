//
//  DragAndDropGame.swift
//  OnePresent
//
//  Created by Maxym on 5/10/16.
//  Copyright © 2016 sjinnovation. All rights reserved.
//

import UIKit
import SpriteKit

class DragAndDropGame: SKScene {

    private var touchingHat = false
    private var touchPoint: CGPoint?
    var activeNode = SKSpriteNode()
    var nodeArray = [SKSpriteNode]()
    var cupPath:UIBezierPath! = nil
    var counter = 0
    var goal = Int.random(1, max: 10)
    var countDown = SKSpriteNode()
    let pattern = [0,1,2,3,4,5,6]
    var repeatCounter = 0

    
    
    override func didMove(to view: SKView) {
        if let node = childNode(withName: "DaySixPresentImage") {
            node.run(SKAction.fadeOut(withDuration: 3)) {
                node.zPosition = -2
            }
        }
        let pointA = self.childNode(withName: "pointA")
        let pointB = self.childNode(withName: "pointB")
        let pointC = self.childNode(withName: "pointC")
        let pointD = self.childNode(withName: "pointD")
        SKTAudio.sharedInstance().playBackgroundMusic("cocoaGameBackground")
        cupPath = UIBezierPath()
        cupPath.move(to: pointA!.position)
        cupPath.addQuadCurve(to: pointC!.position, controlPoint: pointB!.position)
        cupPath.addQuadCurve(to: pointA!.position, controlPoint: pointD!.position)
        cupPath.close()
        let cupCenter = self.childNode(withName: "cupCenter")
        countDown = SKSpriteNode(imageNamed: "number\(goal)")
        countDown.position = cupCenter!.position
        countDown.zPosition = 2
        self.addChild(countDown)
        let count = 12
        for i in 0 ..< count {

            let k = i%6 + 1
            let node = SKSpriteNode(imageNamed: "marshmellow\(k)")
            node.name = "\(i)"
            setNodeAction(node, i: i, count: count)
            node.physicsBody = SKPhysicsBody(circleOfRadius:max(node.size.width / 2.0, node.size.height / 2.0))
            node.physicsBody!.restitution = 0.5
            node.physicsBody!.isDynamic = false;
            node.zPosition = 2
            self.addChild(node)
            nodeArray.append(node)
        }
        
        
    }
    
    func setNodeAction(_ node:SKSpriteNode, i:Int, count:Int) {

        let circlePath = UIBezierPath(arcCenter: CGPoint(x: size.width/2, y: size.height/2), radius: size.height * 0.44, startAngle: 2 * CGFloat(M_PI)/CGFloat(count) * CGFloat(i), endAngle:2 * CGFloat(M_PI)/CGFloat(count)  * CGFloat(i) + 2 * CGFloat(M_PI), clockwise: true)
        let movePath = SKAction.follow(circlePath.cgPath, asOffset: false, orientToPath: false, speed: 50)
        node.run(SKAction.repeatForever(movePath))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>?, with event: UIEvent?) {
        super.touchesBegan(touches!, with: event)
        
        for touch in touches! {
            let location = touch.location(in: self)
            for node in nodeArray {
                
                if node.contains(location) {
                    activeNode = node
                }
            }
            activeNode.removeAllActions()
            activeNode.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
            activeNode.physicsBody?.angularVelocity = 0
            activeNode.physicsBody?.affectedByGravity = false
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>?, with event: UIEvent?) {
        if let touch = touches!.first {
            activeNode.position = touch.location(in: self)
//            activeNode.runAction(SKAction.moveTo(touch.locationInNode(self), duration: 0))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>?, with event: UIEvent?) {

        if activeNode.frame.intersects(cupPath.bounds) {
            SKTAudio.sharedInstance().playSoundEffect("marshmallow plunk \(Int.random(1, max: 3))")
        } else {
            putNodeBack(0)
        }
        activeNode = SKSpriteNode()
        checkPill()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if activeNode.frame.intersects(cupPath.bounds) {
            
        } else {
            putNodeBack(0)
        }
        activeNode = SKSpriteNode()
        checkPill()
    }
    
    func checkPill() {
        counter = 0
        for node in nodeArray {
            if node.frame.intersects(cupPath.bounds){
                counter += 1
            }
        }
        if goal == counter {
            repeatCounter += 1
            if repeatCounter == 3 {
                SKTAudio.sharedInstance().playSoundEffect("gameVictory")
                    if let scene = GetPresentPage(fileNamed: "DaySixGetPresent"),
                        let explosion = childNode(withName: "explosion"){
                        scene.day = .daySix
                        self.explosionAnimation(explosion: explosion, scene: scene)
                    }
            } else {
                run(SKAction.afterDelay(0.5, runBlock: {
                    SKTAudio.sharedInstance().playSoundEffect("bellJingle")
                    self.resetGame()
                }))
            }
        }
    }
    
    
    func resetGame() {
        countDown.removeFromParent()
        goal = Int.random(1, max: 10)
        let cupCenter = self.childNode(withName: "cupCenter")
        countDown = SKSpriteNode(imageNamed: "number\(goal)")
        countDown.position = cupCenter!.position
        countDown.zPosition = 2
        self.addChild(countDown)
        (nodeArray as NSArray).enumerateObjects({ node, index, stop in
            self.setNodeAction(node as! SKSpriteNode, i: index, count: self.nodeArray.count)
        })
    }
    
    func putNodeBack(_ iteration:CGFloat) {

        activeNode.removeAllActions()
        let count = nodeArray.count
        let circlePath = UIBezierPath(arcCenter: view!.center, radius: 300, startAngle: 2 * CGFloat(M_PI)/CGFloat(count) * iteration, endAngle:2 * CGFloat(M_PI)/CGFloat(count)  * iteration + 2 * CGFloat(M_PI), clockwise: true)
        activeNode.position = circlePath.currentPoint
        let movePath = SKAction.follow(circlePath.cgPath, asOffset: false, orientToPath: false, speed: 50)
        activeNode.run(SKAction.repeatForever(movePath))
        var inFrame = false
        for node in nodeArray {
            if activeNode.frame.intersects(node.frame) && activeNode.name != node.name && iteration < 25 {
                inFrame = true
            }
        }
        if inFrame {
            putNodeBack(iteration + 1)
        }
    }
    
    override func willMove(from view: SKView) {
        SKTAudio.sharedInstance().pauseBackgroundMusic()
    }

}
