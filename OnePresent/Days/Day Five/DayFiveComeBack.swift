//
//  DayTwoComeBack.swift
//  OnePresent
//
//  Created by Maxym on 8/19/16.
//  Copyright © 2016 sjinnovation. All rights reserved.
//

import UIKit
import SpriteKit

class DayFiveComeBack: OnePresentPagesScene {

    override func didMove(to view: SKView) {
        let userdefaults = UserDefaults.standard
        userdefaults.set(true, forKey: "number5")
        btnLeft = childNode(withName: "leftCane") as! SKSpriteNode
        btnRight = childNode(withName: "rightCane") as! SKSpriteNode
        isComeBackPage = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>?, with event: UIEvent?) {
        for touch in touches!  {
            let location = touch.location(in: self)
            if let paint = childNode(withName: "paint") {
                guard !paint.contains(location) else {
                    if let nextPage = DrawingPage(fileNamed:"DrawingPage") {
                        nextPage.prevPage = self
                        nextPage.index = 5
                        goToScene(nextPage, transition: .curlUp)
                    }
                    return
                }
            }
            giveHighFive(location: location)
            if btnRight.contains(location) {
                nextScene = TitlePage(size: view!.bounds.size)
            } else if btnLeft.contains(location) {
//                nextScene = GetPresent(fileNamed: "DayFiveGetPresent")
                
            }
            super.touchesBegan(touches, with: event)
        }
    }
}
