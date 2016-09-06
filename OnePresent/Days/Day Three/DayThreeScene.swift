//
//  DayThreeScene.swift
//  OnePresent
//
//  Created by Maxym on 8/15/16.
//  Copyright © 2016 sjinnovation. All rights reserved.
//

import UIKit
import SpriteKit

class DayThreeScene: OnePresentPagesScene {

    override func didMove(to view: SKView) {
        let pageContent = SKSpriteNode(imageNamed: "DayThreePage \(index)")
        pageContent.size = view.frame.size
        pageContent.position = view.center
        pageContent.zPosition = 0
        addChild(pageContent)
        if index == 0 {
            fromIndexPage = true
        }
        setUpFooter()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>?, with event: UIEvent?) {
        if index == 2 {
            nextScene = HiddenPictures(fileNamed:"DayThreeHiddenPictures")!
        } else {
            nextScene = DayThreeScene(size: self.view!.bounds.size)
        }
        super.touchesBegan(touches, with: event)
    }
}