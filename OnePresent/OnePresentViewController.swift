//
//  GameViewController.swift
//  OnePresent
//
//  Created by Maxym on 5/9/16.
//  Copyright (c) 2016 sjinnovation. All rights reserved.
//

import UIKit
import SpriteKit


class OnePresentViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        if let scene = TitlePage(fileNamed: "TitlePage") {
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .fill
            scene.isLaunch = true
            skView.presentScene(scene)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }


    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            let skView = self.view as! SKView
            if let scene = skView.scene as? ComeBackPage {
                scene.snowfall = scene.startSnowfall(emitterNode: scene.snowfall)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    
}
