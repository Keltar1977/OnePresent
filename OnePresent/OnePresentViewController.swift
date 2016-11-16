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
 
    @IBOutlet weak var skView: SKView!
    @IBOutlet weak var homeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(getController), name: NSNotification.Name(rawValue: "getController"), object: nil)
        presentTitle()
    }
    
    @IBAction func presentTitle() {
        let userdefaults = UserDefaults.standard
        if !userdefaults.bool(forKey: "DayOneNumber") {
            userdefaults.set(true, forKey: "DayOneNumber")
        }
        if let scene = TitlePage(fileNamed: "TitlePage") {
            skView.showsFPS = false
            skView.showsNodeCount = false
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .fill
            scene.isLaunch = true
            skView.presentScene(scene)
        }
    }
    
    func getController() {
        (skView.scene as! TitlePage).vc = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }


    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            if let scene = skView.scene as? ComeBackPage, scene.day != .daySeven {
                scene.snowfall = scene.startSnowfall(emitterNode: scene.snowfall)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    
}
