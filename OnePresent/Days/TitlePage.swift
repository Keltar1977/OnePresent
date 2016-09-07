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
    var btnRight = SKSpriteNode(imageNamed: "candyCaneRight")
    final let dancingPresent = SKSpriteNode(imageNamed: "dancingPresent")
    
    override func didMove(to view: SKView) {
        let pageContent = SKSpriteNode(imageNamed: "titlePage")
        pageContent.size = view.frame.size
        pageContent.position = view.center
        pageContent.zPosition = 0
        addChild(pageContent)
        setupPage()
        SKTAudio.sharedInstance().playBackgroundMusic("Title Page Song")
    }
    
    func setupPage() {
        btnRight.position = CGPoint(x: self.size.width - 70, y: self.size.height/2)
        btnRight.zPosition = 3
        addChild(btnRight)
        snowfall = startSnowfall(emitterNode: snowfall)
        dancingPresent.name = "dancingPresent"
        dancingPresent.size = CGSize(width: 0.3 * self.size.height, height: 0.3 * self.size.height)
        dancingPresent.position = CGPoint(x:(3 * self.size.width)/4 ,y:(3 * self.size.height)/4)
        dancingPresent.zPosition = 1
        let rotateRight = SKAction.rotate(byAngle: 0.2, duration: 0.2)
        let rotateLeft = SKAction.rotate(byAngle: -0.4, duration: 0.2)
        dancingPresent.run(SKAction.repeatForever(SKAction.sequence([rotateRight,rotateLeft,rotateRight])))
        addChild(dancingPresent)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>?, with event: UIEvent?) {
        for touch in touches!  {
            let location = touch.location(in: self)
            if btnRight.contains(location) {
                goToScene(IndexPageScene(fileNamed:"IndexPageScene")!,transition: .curlUp, fromIndexPage: false)
            }
        }
    }

}
