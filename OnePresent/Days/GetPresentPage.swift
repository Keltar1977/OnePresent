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
    var wrappCounter = 1
    var day:BookDays!
    
    override func didMove(to view: SKView) {
        SKTAudio.sharedInstance().pauseBackgroundMusic()
        btnLeft = childNode(withName: "leftCane")
        btnRight = childNode(withName: "rightCane")
        SKTAudio.sharedInstance().playNarration("wrappingPaperNarration")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard wrappCounter > 3 else {
            if let node = childNode(withName: "presentText") {
                node.zPosition = -1
            }
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
                ref.move(to: location)
                return
            }
            handlePresentTouch(location: location)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if  day == .dayFive, wrappCounter >= 4 {
                drawOnScene(touch: touch)
            }
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
                    case .santa:
                        if let steam = childNode(withName: "steam") {
                            santaTouched(steam: steam)
                            break
                        }
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
            
            
            if wrappCounter == 4 {
//                present.run(SKAction.setTexture(SKTexture(imageNamed:"wrappingBackground")))
                present.run(SKAction.afterDelay(2, runBlock: {
                    present.zPosition = 0
                    SKTAudio.sharedInstance().playNarration(self.day.rawValue + "Present")
                }))
            }
            present.run(SKAction.setTexture(SKTexture(imageNamed:imageName + "\(wrappCounter)")))
            SKTAudio.sharedInstance().playSoundEffect("paper grab \(wrappCounter - 1)")
        }
    }
    
    private func rightCaneTouched() {
        if day == BookDays.daySeven, let nextPage = BookEnding(fileNamed: "OnePresentPagesScene") {
            nextPage.bookChapter = BookChapter(day: .daySeven, pageNumbers: 3)
            nextPage.bookChapter.pageIndex = 1
            goToScene(nextPage, transition: .curlUp)
        } else if let nextPage = ComeBackPage(fileNamed: day.rawValue + "ComeBack") {
            nextPage.day = day
            goToScene(nextPage, transition: .curlUp)
        }
    }
    
    private func leftCaneTouched() {
        if let nextPage = HiddenPictures(fileNamed:day.rawValue + "HiddenPictures") {
            nextPage.day = day
            goToScene(nextPage,transition: .curlUp)
        }
    }
    
    private func yoyoTouched(yoyo:SKNode) {
        yoyo.name = "yoyoToched"
        yoyo.run(SKAction.animate(with: [SKTexture(image: #imageLiteral(resourceName: "yoyoTouchedImage"))], timePerFrame: 1, resize: true, restore: true)) {
            SKTAudio.sharedInstance().playSoundEffect("yoyoUp")
            yoyo.name = "yoyo"
            yoyo.run(SKAction.moveTo(y: yoyo.position.y + yoyo.frame.size.height/1.3, duration: 0))
        }
        SKTAudio.sharedInstance().playSoundEffect("yoyoDown")
        yoyo.run(SKAction.moveTo(y: yoyo.position.y - yoyo.frame.size.height/1.3, duration: 0))
    }
    
    private func santaTouched(steam:SKNode) {
        SKTAudio.sharedInstance().playSoundEffect("cupSound")
        run(SKAction.afterDelay(1, runBlock: {
            steam.zPosition = 2
        }))
    }
    
    private func bellTouched(bell:SKNode) {
        SKTAudio.sharedInstance().playSoundEffect("bellTouched")
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
        line.strokeColor = UIColor(red: 25/255, green: 208/255, blue: 247/255, alpha: 1)
        line.name = "line"
        line.zPosition = 2.5
        self.addChild(line)
    }
    
    private func lollipopTouched(lollipop:SKNode) {
        SKTAudio.sharedInstance().playSoundEffect("lollipopSound")
        clickNumber = (clickNumber + 1) % 3
        print((clickNumber + 1) % 3)
        lollipop.run(SKAction.setTexture(SKTexture(imageNamed: "lollipop\(clickNumber)")))
    }
    
}
