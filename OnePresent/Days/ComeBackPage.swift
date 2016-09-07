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
        userdefaults.set(true, forKey: "number1")
        btnLeft = childNode(withName: "leftCane")
        btnRight = childNode(withName: "rightCane")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>?, with event: UIEvent?) {
        for touch in touches!  {
            let location = touch.location(in: self)
            if let paint = childNode(withName: "paint") {
                guard !paint.contains(location) else {
                    if let nextPage = DrawingPage(fileNamed:"DrawingPage") {
//                        nextPage.prevPage = self
//                        nextPage.index = 1
//                        goToScene(nextPage, transition: .curlUp)
                    }
                    return
                }
            }
            giveHighFive(location: location)
            if btnRight.contains(location) {
//                nextScene = TitlePage(size: view!.bounds.size)
            } else if btnLeft.contains(location) {
                //                nextScene = GetPresent(fileNamed: "DayOneGetPresent")
            }
        }
    }
    
    func giveHighFive(location:CGPoint) {
        if let hand = childNode(withName: "hand"), hand.contains(location) {
            hand.name = "touchedHand"
            hand.run(SKAction.actionWithEffect(SKTRotateEffect(node: hand,
                                                               duration: 0.25,
                                                               startAngle: 0,
                                                               endAngle: -1.5)))
            hand.run(SKAction.moveTo(y: hand.position.y - 140, duration: 0.25))
            hand.run(SKAction.moveTo(x: hand.position.x + 20, duration: 0.125))
        }
    }
}
