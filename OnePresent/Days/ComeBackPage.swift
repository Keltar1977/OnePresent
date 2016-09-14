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
    
    var btnLeft:SKNode!
    var btnRight:SKNode!
    var day:BookDays!
    var snowfall:SKEmitterNode! = nil
    
    
    override func didMove(to view: SKView) {
        let userdefaults = UserDefaults.standard
        userdefaults.set(true, forKey: day.rawValue + "Number")
        SKTAudio.sharedInstance().playNarration(day.rawValue + "NarrationComeBack")
        btnLeft = childNode(withName: "leftCane")
        btnRight = childNode(withName: "rightCane")
        if day != .daySeven {
            SKTAudio.sharedInstance().playBackgroundMusic("windBlow")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>?, with event: UIEvent?) {
        for touch in touches!  {
            let location = touch.location(in: self)
            if let paint = childNode(withName: "paint") {
                guard !paint.contains(location) else {
                    if let nextPage = DrawingPage(fileNamed:"DrawingPage") {
                        nextPage.prevPage = self
                        nextPage.day = day
                        goToScene(nextPage, transition: .curlUp, fromIndexPage: false)
                    }
                    return
                }
            }
            giveHighFive(location: location)
            if btnRight.contains(location) {
                if let nextPage = TitlePage(fileNamed: "TitlePage") {
                    goToScene(nextPage, transition: .curlUp, fromIndexPage: false)
                }
                
            } else if btnLeft.contains(location) {
                if day == BookDays.daySeven, let nextPage = BookEnding(fileNamed: "OnePresentPagesScene") {
                    nextPage.bookChapter = BookChapter(day: .daySeven, pageNumbers: 3)
                    nextPage.bookChapter.pageIndex = 3
                    goToScene(nextPage, transition: .curlUp, fromIndexPage: false)
                } else if let nextPage = GetPresentPage(fileNamed: day.rawValue + "GetPresent") {
                    nextPage.day = day
                    goToScene(nextPage, transition: .curlUp, fromIndexPage: false)
                }
            }
        }
    }
    
    func giveHighFive(location:CGPoint) {
        if let hand = childNode(withName: "hand"), hand.contains(location) {
            SKTAudio.sharedInstance().playSoundEffect("snowman high 5")
            hand.name = "touchedHand"
            hand.run(SKAction.actionWithEffect(SKTRotateEffect(node: hand,
                                                               duration: 0.25,
                                                               startAngle: 0,
                                                               endAngle: -1.5)))
            hand.run(SKAction.moveTo(y: hand.position.y - 140, duration: 0.25))
            hand.run(SKAction.moveTo(x: hand.position.x + 20, duration: 0.125))
        }
    }
    
    override func willMove(from view: SKView) {
        SKTAudio.sharedInstance().pauseBackgroundMusic()
    }
    
    
}
