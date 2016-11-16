//
//  ComeBackPage.swift
//  OnePresent
//
//  Created by Maxym on 9/6/16.
//  Copyright © 2016 sjinnovation. All rights reserved.
//

import UIKit
import SpriteKit

class ComeBackPage: SKScene {
    
    var btnLeft = SKNode()
    var btnRight = SKNode()
    var day:BookDays!
    var snowfall:SKEmitterNode! = nil
    
    
    override func didMove(to view: SKView) {
        let userdefaults = UserDefaults.standard
        userdefaults.set(true, forKey: day.nextDay().rawValue + "Number")
        if let node = childNode(withName: "leftCane") {
            btnLeft = node
        }
        if let node = childNode(withName: "rightCane") {
            btnRight = node
        }
        if day != .daySeven {
            SKTAudio.sharedInstance().playBackgroundMusic("windBlow")
        } else {
            if let promoCode = childNode(withName: "promoCode") {
                promoCode.run(SKAction.fadeOut(withDuration: 0.1))
            }
            SKTAudio.sharedInstance().daySeven = true
            snowfall = startSnowfall(emitterNode: snowfall)
            if !SKTAudio.sharedInstance().backgroundMusicPlayer!.isPlaying {
                SKTAudio.sharedInstance().playBackgroundMusic("endingSong")
            }
        }
        if let finalPresent = childNode(withName: "finalPresent") {
            run(SKAction.afterDelay(25.0, runBlock: {
                finalPresent.run(SKAction.repeatForever(SKAction.jumpToHeight(20,
                                                                              duration: 1,
                                                                              originalPosition: finalPresent.position)))
            }))
        }
        run(SKAction.afterDelay(1, runBlock: {
            SKTAudio.sharedInstance().playNarration(self.day.rawValue + "NarrationComeBack")
        }))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first  {
            let location = touch.location(in: self)
            if let paint = childNode(withName: "paint"), paint.contains(location) {
                if let nextPage = DrawingPage(fileNamed:"DrawingPage") {
                    nextPage.prevPage = self
                    nextPage.day = day
                    goToScene(nextPage, transition: .curlUp)
                    return
                }
            }
            if let finalPresent = childNode(withName: "finalPresent"), finalPresent.contains(location) {
                if let nextPage = DownloadPage(fileNamed:"DownloadPage") {
                    nextPage.prevPage = self
                    goToScene(nextPage, transition: .curlUp)
                    return
                }
            }
            giveHighFive(location: location)
            if btnRight.contains(location) {
                if let nextPage = TitlePage(fileNamed: "TitlePage") {
                    goToScene(nextPage, transition: .curlUp)
                }
                
            } else if btnLeft.contains(location) {
                if day == BookDays.daySeven, let nextPage = BookEnding(fileNamed: "OnePresentPagesScene") {
                    nextPage.bookChapter = BookChapter(day: .daySeven, pageNumbers: 3)
                    nextPage.bookChapter.pageIndex = 3
                    goToScene(nextPage, transition: .curlUp)
                } else if let nextPage = GetPresentPage(fileNamed: day.rawValue + "GetPresent") {
                    nextPage.day = day
                    goToScene(nextPage, transition: .curlUp)
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first  {
            let location = touch.location(in: self)
            if let promoCode = childNode(withName: "promoCode"), promoCode.contains(location) {
                promoCode.zPosition = 2
                promoCode.run(SKAction.fadeIn(withDuration: 10))
            }
        }
    }
    
    func giveHighFive(location:CGPoint) {
        if let hand = childNode(withName: "hand"), hand.contains(location) {
            SKTAudio.sharedInstance().playSoundEffect("snowman high 5")
            SKTAudio.sharedInstance().soundEffectPlayer?.volume = 5.0
            hand.name = "touchedHand"
            let originalPosition = hand.position
            hand.run(SKAction.actionWithEffect(SKTRotateEffect(node: hand,
                                                               duration: 0.25,
                                                               startAngle: 0,
                                                               endAngle: -1.5))) {
                hand.run(SKAction.actionWithEffect(SKTRotateEffect(node: hand,
                                                                   duration: 0.25,
                                                                   startAngle: -1.5,
                                                                   endAngle: 0))) {
                                                                    hand.name = "hand"
                                                                }
                hand.run(SKAction.move(to: originalPosition, duration: 0.3))
                
            }
            hand.run(SKAction.moveTo(y: hand.position.y - 140, duration: 0.25))
            hand.run(SKAction.moveTo(x: hand.position.x + 20, duration: 0.125))
        }
    }
    
    override func willMove(from view: SKView) {
        SKTAudio.sharedInstance().daySeven = false
        if day != .daySeven {
            SKTAudio.sharedInstance().pauseBackgroundMusic()
        }
        SKTAudio.sharedInstance().pauseNarration()
    }
}
