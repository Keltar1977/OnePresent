//
//  BookEnding.swift
//  OnePresent
//
//  Created by Maxym on 9/12/16.
//  Copyright © 2016 sjinnovation. All rights reserved.
//

import UIKit
import SpriteKit

class BookEnding: OnePresentPagesScene {

    override func didMove(to view: SKView) {
        if let pageContent = childNode(withName: "pageContent") {
            let texture = SKTexture(imageNamed: "BookEnding \(bookChapter.pageIndex)")
            pageContent.run(SKAction.setTexture(texture))
        }
        run(SKAction.afterDelay(1, runBlock: {
            if self.bookChapter.pageIndex < 3 {
                SKTAudio.sharedInstance().playNarration("BookEndingNarration\(self.bookChapter.pageIndex)")
            } else if self.bookChapter.pageIndex == 3 {
                SKTAudio.sharedInstance().playBackgroundMusic("Title Page Song")
                SKTAudio.sharedInstance().playNarration("BookEndingNarration3")
                self.run(SKAction.afterDelay(3, runBlock: {
                    SKTAudio.sharedInstance().playNarration("BookEndingNarration4")
                }))
            }
        }))
        setUpFooter()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>?, with event: UIEvent?) {
        for touch in touches!  {
            let location = touch.location(in: self)
            if bookChapter.pageIndex == 1,
                btnLeft.contains(location),
                let nextScene = GetPresentPage(fileNamed:"DaySevenGetPresent")
            {
                nextScene.day = .daySeven
                goToScene(nextScene,transition: .curlUp, fromIndexPage: false)
            } else if bookChapter.pageIndex == bookChapter.pageNumbers,
                let nextScene = ComeBackPage(fileNamed:"DaySevenComeBack")
            {
                nextScene.day = .daySeven
                goToScene(nextScene,transition: .curlUp, fromIndexPage: false)
            } else if btnLeft.contains(location) || btnRight.contains(location){
                if let nextScene = BookEnding(fileNamed: "OnePresentPagesScene") {
                    candyCaneTouched(nextScene:nextScene, location: location)
                }
            }
        }
    }
    
    override func willMove(from view: SKView) {
        SKTAudio.sharedInstance().pauseNarration()
    }
}
