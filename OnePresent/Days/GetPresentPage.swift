//
//  GetPresent.swift
//  OnePresent
//
//  Created by Maxym on 9/5/16.
//  Copyright © 2016 sjinnovation. All rights reserved.
//

import UIKit
import SpriteKit

class GetPresentPage: SKScene {
    var btnLeft:SKNode!
    var btnRight:SKNode!
    var originalPosition:CGPoint!
    var ref = CGMutablePath()
    var clickNumber = 0
    var wrappCounter = 0
    var day:BookDays!
    
    override func didMove(to view: SKView) {
        btnLeft = childNode(withName: "leftCane")
        btnRight = childNode(withName: "rightCane")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard wrappCounter >= 3 else {
            wrappPaper(imageName: day.rawValue + "WrappingPaper")
            return
        }
        for touch in touches  {
            let location = touch.location(in: self)
            if btnLeft.contains(location) {
                leftCaneTouched()
                return
            } else if btnRight.contains(location) {
                rightCaneTouched()
                return
            }
            guard day != .dayFive else {
                return
            }
            handlePresentTouch(location: location)
        }
    }
    
    func handlePresentTouch(location:CGPoint) {
        let presents = nodes(at: location)
        for present in presents {
            if let name = present.name {
                if let presentType = PresentsType(rawValue:name) {
                    switch presentType {
                    case .yoyo:
                        yoyoTouched(yoyo: present)
                        break
                    case .steam:
                        steamTouched(steam: present)
                        break
                    case .bell:
                        bellTouched(bell: present)
                        break
                    case .glow:
                        glowingGlovesTouched(glow: present)
                        break
                    case .lollipop:
                        lollipopTouched(lollipop: present)
                        break
                    }
                }
                
            }
            
        }
    }
    
    private func wrappPaper(imageName:String) {
        wrappCounter += 1
        if let present = childNode(withName: "present") as? SKSpriteNode {
            present.run(SKAction.setTexture(SKTexture(imageNamed:imageName + "\(wrappCounter + 1)")))
            present.run(SKAction.afterDelay(3, runBlock: {
                present.zPosition = CGFloat(self.wrappCounter % 3) * CGFloat(4)
            }))
            SKTAudio.sharedInstance().playSoundEffect("paper grab \(wrappCounter)")
        }
    }
    
    private func rightCaneTouched() {
        if let nextPage = ComeBackPage(fileNamed: day.rawValue + "ComeBack") {
            goToScene(nextPage, transition: .curlUp, fromIndexPage:false)
        }
    }
    
    private func leftCaneTouched() {
        // PrevScene
    }
    
    private func yoyoTouched(yoyo:SKNode) {
        let glow = childNode(withName: "glowYoyo")!
        yoyo.name = "yoyoToched"
        yoyo.run(SKAction.animate(with: [SKTexture(image: #imageLiteral(resourceName: "yoyoTouchedImage"))], timePerFrame: 1, resize: true, restore: true)) {
            SKTAudio.sharedInstance().playSoundEffect("yoyoUp")
            yoyo.name = "yoyo"
            yoyo.run(SKAction.moveTo(y: yoyo.position.y + yoyo.frame.size.height/1.3, duration: 0))
            glow.run(SKAction.moveTo(y: glow.position.y + yoyo.frame.size.height * 1.54, duration: 0))
        }
        SKTAudio.sharedInstance().playSoundEffect("yoyoDown")
        yoyo.run(SKAction.moveTo(y: yoyo.position.y - yoyo.frame.size.height/1.3, duration: 0))
        glow.run(SKAction.moveTo(y: glow.position.y - yoyo.frame.size.height * 1.5, duration: 0))
    }
    
    private func steamTouched(steam:SKNode) {
        SKTAudio.sharedInstance().playSoundEffect("cupSound")
        run(SKAction.afterDelay(1, runBlock: {
            steam.zPosition = 2
        }))
    }
    
    private func bellTouched(bell:SKNode) {
        run(SKAction.screenRotateWithNode(bell, angle: 2, oscillations: -2, duration: 2))
    }
    
    private func glowingGlovesTouched(glow:SKNode) {
        let snowball = childNode(withName: "snowball")!
        originalPosition = snowball.position
        glow.name = "moving"
        SKTAudio.sharedInstance().playSoundEffect("snowballSound")
        let path = UIBezierPath()
        path.move(to: snowball.position)
        path.addQuadCurve(to: childNode(withName: "destination")!.position, controlPoint: childNode(withName: "controlPoint")!.position)
        let movePath = SKAction.follow(path.cgPath, asOffset: false, orientToPath: true, speed: 800)
        snowball.run(movePath) {
            glow.name = "glow"
            snowball.position = self.originalPosition
        }
    }
    
    private func drawOnScene(touch:UITouch) {
        enumerateChildNodes(withName: "line", using: {node, stop in
            node.removeFromParent()
        })
        let locationInScene = touch.location(in:self)
        let line = SKShapeNode()
        ref.addLine(to: locationInScene)
        line.path = ref
        line.lineWidth = 20
        line.strokeColor = UIColor.blue
        line.name = "line"
        line.zPosition = 2.5
        self.addChild(line)
    }
    
    private func lollipopTouched(lollipop:SKNode) {
        SKTAudio.sharedInstance().playSoundEffect("lollipopSound")
        clickNumber = (clickNumber + 1) % 4
        lollipop.run(SKAction.setTexture(SKTexture(imageNamed: "lollipop\(clickNumber)")))
    }
    
}
