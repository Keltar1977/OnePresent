//
//  dayOneScene.swift
//  OnePresent
//
//  Created by Maxym on 7/20/16.
//  Copyright © 2016 sjinnovation. All rights reserved.
//

import UIKit
import SpriteKit

class DayOneScene: OnePresentPagesScene {
    
    override func didMove(to view: SKView) {
        let pageContent = SKSpriteNode(imageNamed: "DayOnePage \(index)")
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
        if index == 4 {
            nextScene = HiddenPictures(fileNamed:"DayOneHiddenPictures")!
        } else {
            nextScene = DayOneScene(size: self.view!.bounds.size)
        }
        super.touchesBegan(touches, with: event)
    }
    

}
