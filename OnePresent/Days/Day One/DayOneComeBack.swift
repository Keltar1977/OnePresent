//
//  DayOneComeBack.swift
//  OnePresent
//
//  Created by Maxym on 8/18/16.
//  Copyright © 2016 sjinnovation. All rights reserved.
//

import UIKit
import SpriteKit

class DayOneComeBack: OnePresentPagesScene {

    
    
    override func didMove(to view: SKView) {
        let userdefaults = UserDefaults.standard
        userdefaults.set(true, forKey: "number1")
        btnLeft = childNode(withName: "leftCane") as! SKSpriteNode
        btnRight = childNode(withName: "rightCane") as! SKSpriteNode
        isComeBackPage = true
   
    }
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>?, with event: UIEvent?) {
        for touch in touches!  {
            let location = touch.location(in: self)
            if let paint = childNode(withName: "paint") {
                guard !paint.contains(location) else {
                    if let nextPage = DrawingPage(fileNamed:"DrawingPage") {
                        nextPage.prevPage = self
                        nextPage.index = 1
                        goToScene(nextPage, transition: .curlUp)
                    }
                    return
                }
            }
            giveHighFive(location: location)
            if btnRight.contains(location) {
                nextScene = TitlePage(size: view!.bounds.size)
            } else if btnLeft.contains(location) {
//                nextScene = GetPresent(fileNamed: "DayOneGetPresent")
            }
            super.touchesBegan(touches, with: event)
        }
    }
}
