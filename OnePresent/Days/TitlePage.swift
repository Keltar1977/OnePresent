//
//  TitlePages.swift
//  OnePresent
//
//  Created by Maxym on 8/12/16.
//  Copyright © 2016 sjinnovation. All rights reserved.
//

import UIKit
import SpriteKit

class TitlePage: SKScene {
    var snowfall:SKEmitterNode! = nil
    var btnRight:SKNode! = nil
    var isLaunch = false
    
    override func didMove(to view: SKView) {
        setupPage()
        if isLaunch {
            SKTAudio.sharedInstance().playNarration("titlePageNarration")
        }
        SKTAudio.sharedInstance().playBackgroundMusic("Title Page Song")
    }     
    
    func setupPage() {
        snowfall = startSnowfall(emitterNode: snowfall)
        if let node = childNode(withName: "rightCane") {
            btnRight = node
        }
        if let dancingPresent = childNode(withName: "dancingPresent") {
            let rotateRight = SKAction.rotate(byAngle: 0.2, duration: 0.2)
            let rotateLeft = SKAction.rotate(byAngle: -0.4, duration: 0.2)
            dancingPresent.run(SKAction.repeatForever(SKAction.sequence([rotateRight,rotateLeft,rotateRight])))
        }

    }
    
    override func touchesBegan(_ touches: Set<UITouch>?, with event: UIEvent?) {
        for touch in touches!  {
            let location = touch.location(in: self)
            if (btnRight != nil), btnRight.contains(location) {
                if let scene = IndexPageScene(fileNamed:"IndexPageScene") {
                    scene.isLaunch = isLaunch
                    scene.scaleMode = .fill
                    SKTAudio.sharedInstance().playSoundEffect("pageFlip")
                    let transition = SKTransition.moveIn(with: .right, duration: 1)
                    self.view?.presentScene(scene, transition: transition)
                }

            }
        }
    }
    
    override func willMove(from view: SKView) {
        SKTAudio.sharedInstance().pauseNarration()
    }

}
