//
//  DownloadPage.swift
//  OnePresent
//
//  Created by Maxym on 9/20/16.
//  Copyright © 2016 sjinnovation. All rights reserved.
//

import UIKit
import SpriteKit

class DownloadPage: SKScene {
    
    var prevPage:SKScene! = nil
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            if let leftCane = childNode(withName: "leftCane"), leftCane.contains(location) {
                if (prevPage != nil) {
                    goToScene(prevPage, transition: .curlDown)
                }
            }
        }
    }
}
