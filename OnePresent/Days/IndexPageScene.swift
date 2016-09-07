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
                    let pageNumbers:Int
                    switch day {
                    case .dayOne:
                        pageNumbers = 4
                    case .daySeven:
                        pageNumbers = 5
                    default:
                        pageNumbers = 2
                    }
                    let scene = OnePresentPagesScene(size: self.view!.bounds.size)
                    let bookChapter = BookChapter(day: day, pageNumbers: pageNumbers)
                    scene.bookChapter = bookChapter
                    SKTAudio.sharedInstance().playSoundEffect("openPresent")
                    run(SKAction.screenRotateWithNode(present, angle: 1, oscillations: 1, duration: 1))
                    present.run(SKAction.jumpToHeight(50, duration: 1, originalPosition: present.position)) {
                        SKTAudio.sharedInstance().playSoundEffect("pageFlip")
                        self.goToScene(scene, transition: .curlUp, fromIndexPage: self.bookChapter.fromIndexPage)
                    }
                }
            }
        }
    }
    
}
