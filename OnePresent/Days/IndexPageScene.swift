//
//  IndexPageScene.swift
//  OnePresent
//
//  Created by Maxym on 7/20/16.
//  Copyright © 2016 sjinnovation. All rights reserved.
//

import UIKit
import SpriteKit

class IndexPageScene: SKScene {

    var isLaunch = false
    
    override func didMove(to view: SKView) {
        SKTAudio.sharedInstance().playSoundEffect("Fairy Bling")
        if !SKTAudio.sharedInstance().backgroundMusicPlayer!.isPlaying {
            SKTAudio.sharedInstance().playBackgroundMusic("Title Page Song")
        }
        let userdefaults = UserDefaults.standard
        if  let hint = childNode(withName: "indexPageHint"), isLaunch {
            hint.zPosition = 3
            run(SKAction.afterDelay(0.5, runBlock: { 
                SKTAudio.sharedInstance().playNarration("indexPageNarration")
            }))
            hint.run(SKAction.fadeOut(withDuration: 4.0))
        }
        for  day in BookDays.allValues {
            if userdefaults.bool(forKey: day.rawValue + "Number") {
                if let glowLayer = childNode(withName: day.rawValue + "Glow") {
                   glowLayer.zPosition = 3
                }
            }
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>?, with event: UIEvent?) {
        for touch in touches!  {
            let location = touch.location(in: self)
            for present in nodes(at: location) {
                if let name = present.name, let day = BookDays(rawValue:name) {
                    let pageNumbers:Int
                    switch day {
                    case .dayOne:
                        pageNumbers = 4
                    default:
                        pageNumbers = 2
                    }
                    let userdefaults = UserDefaults.standard
                    if let scene = OnePresentPagesScene(fileNamed: "OnePresentPagesScene"), userdefaults.bool(forKey: day.rawValue + "Number") {
                        SKTAudio.sharedInstance().pauseBackgroundMusic()
                        let bookChapter = BookChapter(day: day, pageNumbers: pageNumbers)
                        scene.bookChapter = bookChapter
                        SKTAudio.sharedInstance().playSoundEffect("openPresent")
                        run(SKAction.screenRotateWithNode(present, angle: 1, oscillations: 1, duration: 1))
                        present.run(SKAction.jumpToHeight(50, duration: 1, originalPosition: present.position)) {
                            self.simpleTransition(scene, startGame: false, direction: .right)
                        }
                    }
                }
            }
        }
    }
    
}
