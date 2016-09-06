//
//  IndexPageScene.swift
//  OnePresent
//
//  Created by Maxym on 7/20/16.
//  Copyright © 2016 sjinnovation. All rights reserved.
//

import UIKit
import SpriteKit

class IndexPageScene: OnePresentPagesScene {

    
    override func didMove(to view: SKView) {
        SKTAudio.sharedInstance().playSoundEffect("Fairy Bling")
        if !SKTAudio.sharedInstance().backgroundMusicPlayer!.isPlaying {
            SKTAudio.sharedInstance().playBackgroundMusic("Title Page Song")
        }
        let userdefaults = UserDefaults.standard
        
        for  i in 1...7 {
            if let number = self.childNode(withName: "number\(i)"), userdefaults.bool(forKey: "number\(i)") {
                let glowLayer = SKSpriteNode(imageNamed: "presentNumberGlowing")
                glowLayer.position = number.position
                glowLayer.zPosition = 2
                addChild(glowLayer)
            }
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>?, with event: UIEvent?) {
        for touch in touches!  {
            let location = touch.location(in: self)
            for present in nodes(at: location) {
                if let name = present.name, let day = BookDays(rawValue:name) {
                    SKTAudio.sharedInstance().pauseBackgroundMusic()
                    var scene:OnePresentPagesScene
                    switch day {
                    case .dayOne:
                        scene = DayOneScene(size: self.view!.bounds.size)
                    case .dayTwo:
                        scene = DayTwoScene(size: self.view!.bounds.size)
                    case .dayThree:
                        scene = DayThreeScene(size: self.view!.bounds.size)
                    case .dayFour:
                        scene = DayFourScene(size: self.view!.bounds.size)
                    case .dayFive:
                        scene = DayFiveScene(size: self.view!.bounds.size)
                    case .daySix:
                        scene = DaySixScene(size: self.view!.bounds.size)
                    case .daySeven:
                        scene = DaySevenScene(size: self.view!.bounds.size)
                    }
                    scene.index = 0
                    SKTAudio.sharedInstance().playSoundEffect("openPresent")
                    run(SKAction.screenRotateWithNode(present, angle: 1, oscillations: 1, duration: 1))
                    present.run(SKAction.jumpToHeight(50, duration: 1, originalPosition: present.position)) {
                        self.goToScene(scene, transition: .curlUp)
                    }
                }
            }
        }
    }
    
}
