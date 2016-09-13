//
//  DrawingPage.swift
//  OnePresent
//
//  Created by Maxym on 8/31/16.
//  Copyright © 2016 sjinnovation. All rights reserved.
//

import UIKit
import SpriteKit

class DrawingPage: OnePresentPagesScene {

    var day:BookDays!
    var ref = CGMutablePath()
    var line = SKShapeNode()
    var prevPage:SKScene! = nil
    var color = UIColor.green
    let colors = ["green":UIColor(red: 128/255, green: 197/255, blue: 104/255, alpha: 1),
                  "red":UIColor(red: 255/255, green: 52/255, blue: 66/255, alpha: 1),
                  "blue":UIColor(red: 130/255, green: 185/255, blue: 224/255, alpha: 1),
                  "orange":UIColor(red: 245/255, green: 170/255, blue: 59/255, alpha: 1),
                  "yellow":UIColor(red: 255/255, green: 238/255, blue: 29/255, alpha: 1),
                  "purple":UIColor(red: 122/255, green: 128/255, blue: 202/255, alpha: 1),
                  "gray":UIColor(red: 172/255, green: 181/255, blue: 192/255, alpha: 1),
                  "darkGreen":UIColor(red: 54/255, green: 86/255, blue: 63/255, alpha: 1),
                  "brown":UIColor(red: 144/255, green: 110/255, blue: 71/255, alpha: 1),
                  "white":UIColor.white]
    
    override func didMove(to view: SKView) {
        let pageContent = SKSpriteNode(imageNamed: "Draw" + day.rawValue)
        pageContent.zPosition = 0
        addChild(pageContent)
        btnLeft = childNode(withName: "leftCane") as! SKSpriteNode
        btnRight = childNode(withName: "rightCane") as! SKSpriteNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>?, with event: UIEvent?) {
        for touch in touches!  {
            let location = touch.location(in: self)

            for (key,value) in colors {
                if let colorSample = childNode(withName: key), colorSample.contains(location) {
                    color = value
                    line.name = "finishedLine"
                    ref = CGMutablePath()
                    line = SKShapeNode()
                    return
                }
            }
            if let startOver = childNode(withName: "startOver"), startOver.contains(location) {
                startOverAction()
                return
            }
            if let camera = childNode(withName: "camera"), camera.contains(location) {
                screenCapture()
                return
            }
            if btnRight.contains(location) {
                if let nextPage = TitlePage(fileNamed: "TitlePage") {
                    goToScene(nextPage, transition: .curlUp, fromIndexPage: false)
                }
            } else if btnLeft.contains(location) {
                if (prevPage != nil) {
                    goToScene(prevPage, transition: .curlUp, fromIndexPage: false)
                }
            } else {
                ref.move(to: location)
            }
        }
    }
    
    func startOverAction() {
        enumerateChildNodes(withName: "line", using: {node, stop in
            node.removeFromParent()
        })
        enumerateChildNodes(withName: "finishedLine", using: {node, stop in
            node.removeFromParent()
        })
        ref = CGMutablePath()
        line = SKShapeNode()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if  let touch = touches.first {
            enumerateChildNodes(withName: "line", using: {node, stop in
                node.removeFromParent()
            })
            let locationInScene = touch.location(in:self)
            
            ref.addLine(to: locationInScene)
            line.path = ref
            line.lineWidth = 5
            line.strokeColor = color
            line.name = "line"
            line.zPosition = 2
            self.addChild(line)
            
        }
    }
    
    func screenCapture() {
        let alertController = UIAlertController(title: "", message: "Save image to your photos?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
            self.setAll(hidden: true)
            self.run(SKAction.afterDelay(1, runBlock: {
                UIGraphicsBeginImageContextWithOptions(self.view!.bounds.size, false, 1.0);
                self.view?.drawHierarchy(in: self.view!.bounds, afterScreenUpdates: true)
                let viewImage = UIGraphicsGetImageFromCurrentImageContext();
                UIImageWriteToSavedPhotosAlbum(viewImage!, self, nil, nil)
                UIGraphicsEndImageContext();
                self.setAll(hidden: false)
            }))
        }))
    self.view?.window?.rootViewController?.present(alertController, animated: true, completion: nil)

        
    }
    
    func setAll(hidden:Bool) {
        for (key,_) in colors {
            if let colorSample = childNode(withName: key) {
                colorSample.isHidden = hidden
            }
        }
        if let palette = childNode(withName: "palette") {
            palette.isHidden = hidden
        }
        if let startOver = childNode(withName: "startOver") {
            startOver.isHidden = hidden
        }
        if let camera = childNode(withName: "camera") {
            camera.isHidden = hidden
        }
        btnLeft.isHidden = hidden
        btnRight.isHidden = hidden
    }
}
