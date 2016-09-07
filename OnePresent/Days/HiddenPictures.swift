//
//  HiddenPictures.swift
//  OnePresent
//
//  Created by Maxym on 9/5/16.
//  Copyright © 2016 sjinnovation. All rights reserved.
//

import UIKit
import SpriteKit

class HiddenPictures: OnePresentPagesScene {
    var pictureNumber = 1

    
    override func didMove(to view: SKView) {
        for i in 1...3 {
            if let hint = childNode(withName: "hint\(i)") {
                if pictureNumber == i {
                    hint.isHidden = false
                } else {
                    hint.isHidden = true
                    hint.run(SKAction.fadeOut(withDuration: 2))
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>?, with event: UIEvent?) {
        for touch in touches!  {
            let location = touch.location(in: self)
            handleHiddenObjectTouch(at: location)
        }
    }
    
    func handleHiddenObjectTouch(at location:CGPoint) {
        let nodes = self.nodes(at: location)
        for node in nodes {
            if let name = node.name {
                if let hiddenObject = HiddenObjects(rawValue:name) {
                    switch hiddenObject {
                    case .pearl:
                        pearlTouched(pearl: node)
                        break
                    case .bug:
                        bugTouched(bug: node)
                        break
                    case .fish:
                        fishTouched(fish: node)
                        break
                    case .key:
                        keyTouched(key: node)
                        break
                    case .candle:
                        candleTouched(candle: node)
                        break
                    case .frog:
                        frogTouched(frog: node)
                        break
                    case .goat:
                        goatTouched(goat: node)
                        break
                    case .flower:
                        flowerTouched(flower: node)
                        break
                    case .mail:
                        mailTouched(mail: node)
                        break
                    case .sock:
                        sockTouched(sock: node)
                        break
                    case .heart:
                        heartTouched(heart: node)
                        break
                    case .wings:
                        wingsTouched(wings: node)
                        break
                    case .jacket:
                        jacketTouched(jacket: node)
                        break
                    case .hat:
                        hatTouched(hat: node)
                        break
                    case .glue:
                        glueTouched(glue: node)
                        break
                    case .star:
                        starTouched(star: node)
                        break
                    case .glasses:
                        glassesTouched(glasses: node)
                        break
                    case .flake:
                        flakeTouched(flake: node)
                        break
                    case .cane:
                        caneTouched(cane: node)
                        break
                    case .spoon:
                        spoonTouched(spoon: node)
                        break
                    case .sled:
                        sledTouched(sled: node)
                        break
                    }
                }
            }
        }
    }
    
    private func pearlTouched(pearl:SKNode) {
        guard pictureNumber == 1 else {
            return
        }
        SKTAudio.sharedInstance().playSoundEffect("pearlPressed")
        run(SKAction.screenRotateWithNode(pearl, angle: 1, oscillations: 10, duration: 4)) {
            self.pictureNumber = 2
            self.setHint()
        }
        pearl.run(SKAction.setTexture(SKTexture(image: #imageLiteral(resourceName: "pearlTouchedImage"))))
    }
    
    private func bugTouched(bug:SKNode) {
        guard pictureNumber == 2 else {
            return
        }
        SKTAudio.sharedInstance().playSoundEffect("bugPressed")
        let path = UIBezierPath()
        let start = childNode(withName: "graph1")!
        path.move(to: start.position)
        bug.zPosition = 100
        for i in 2...44 {
            let graph = childNode(withName: "graph\(i)")!
            path.addLine(to: graph.position)
        }
        let movePath = SKAction.follow(path.cgPath, asOffset: false, orientToPath: true, speed: 400)
        bug.run(movePath) {
            self.pictureNumber = 3
            self.setHint()
            bug.removeFromParent()
        }
    }
    
    private func fishTouched(fish:SKNode) {
        guard pictureNumber == 3 else {
            return
        }
        fish.run(SKAction.jumpToHeight(100, duration: 2, originalPosition: fish.position))
        SKAction.repeat(SKAction.afterDelay(0, runBlock: {
            SKTAudio.sharedInstance().playSoundEffect("fishPressed")
        }), count: 4)
        run(SKAction.actionWithEffect(SKTRotateEffect(node: fish, duration: 2, startAngle: 0, endAngle: 13.0))) {
            if let polkaGame = PolkaDotGame(fileNamed:"PolkaDotGame") {
                SKTAudio.sharedInstance().playSoundEffect("hiddenPictureFinish")
                self.run(SKAction.afterDelay(1, runBlock: {
                    self.startGame(polkaGame)
                }))
                
            }
        }
    }
    
    private func keyTouched(key:SKNode) {
        guard pictureNumber == 1 else {
            return
        }
        SKTAudio.sharedInstance().playSoundEffect("keySound")
        run(SKAction.screenRotateWithNode(key, angle: 1, oscillations: 10, duration: 2)) {
            self.pictureNumber = 2
            self.setHint()
            key.run(SKAction.fadeOut(withDuration: 1))
        }
        key.run(SKAction.setTexture(SKTexture(image: #imageLiteral(resourceName: "keyTouchedImage"))))
    }
    
    private func candleTouched(candle:SKNode) {
        guard pictureNumber == 2 else {
            return
        }
        SKTAudio.sharedInstance().playSoundEffect("candleSound")
        candle.run(SKAction.animate(with: [SKTexture(image: #imageLiteral(resourceName: "candleTouchedImage")),
                                           SKTexture(image: #imageLiteral(resourceName: "candleImage"))], timePerFrame: 1)) {
                                            self.pictureNumber = 3
                                            self.setHint()
        }
        run(SKAction.afterDelay(1, runBlock: {
            SKTAudio.sharedInstance().playSoundEffect("candleSound")
        }))
    }
    
    private func frogTouched(frog:SKNode) {
        guard pictureNumber == 3 else {
            return
        }
        SKTAudio.sharedInstance().playSoundEffect("frogSound")
        frog.run(SKAction.jumpToHeight(60, duration: 0.5, originalPosition: frog.position)) {
            if let playSong = PlayASongGame(fileNamed:"PlayASongGame") {
                SKTAudio.sharedInstance().playSoundEffect("hiddenPictureFinish")
                self.run(SKAction.afterDelay(1, runBlock: {
                    self.startGame(playSong)
                }))
            }
        }
    }
    
    private func goatTouched(goat:SKNode) {
        guard pictureNumber == 1 else {
            return
        }
        SKTAudio.sharedInstance().playSoundEffect("goatSound")
        run(SKAction.screenRotateWithNode(goat, angle: 1, oscillations: 5, duration: 4)) {
            self.pictureNumber = 2
            self.setHint()
        }
    }
    
    private func flowerTouched(flower:SKNode) {
        guard pictureNumber == 2 else {
            return
        }
        SKTAudio.sharedInstance().playSoundEffect("flowerSound")
        flower.run(SKAction.animate(with: [SKTexture(image:#imageLiteral(resourceName: "flowerTouchedImage"))],
                                    timePerFrame: 1,
                                    resize: true,
                                    restore: false)) {
                                        self.pictureNumber = 3
                                        self.setHint()
        }
        
        if let position = childNode(withName: "bublePoint") {
            let bubbles = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "bubblesImage")))
            bubbles.position = position.position
            bubbles.zPosition = 1
            bubbles.run(SKAction.fadeIn(withDuration: 2))
            addChild(bubbles)
        }
    }
    private func mailTouched(mail:SKNode) {
        guard pictureNumber == 3 else {
            return
        }
        SKTAudio.sharedInstance().playSoundEffect("mailSound")
        mail.run(SKAction.move(to: CGPoint(x:mail.position.x,y:mail.position.y + 5), duration: 0.2))
        mail.run(SKAction.animate(with: [SKTexture(image:#imageLiteral(resourceName: "mailImage")),
                                         SKTexture(image:#imageLiteral(resourceName: "mailTouchedImage"))],
                                  timePerFrame: 0.1,
                                  resize: true,
                                  restore: false))
        run(SKAction.afterDelay(1, runBlock: {
            SKTAudio.sharedInstance().playSoundEffect("hiddenPictureFinish")
            self.run(SKAction.afterDelay(1, runBlock: {
                self.startGame(CardGame(size: self.view!.bounds.size))
            }))
        }))
    }
    
    private func sockTouched(sock:SKNode) {
        guard pictureNumber == 1 else {
            return
        }
        SKTAudio.sharedInstance().playSoundEffect("clockSound")
        sock.run(SKAction.setTexture(SKTexture(image: #imageLiteral(resourceName: "sockTouchedImage"))))
        run(SKAction.screenRotateWithNode(sock, angle: 1, oscillations: 10, duration: 2)) {
            self.pictureNumber = 2
            self.setHint()
        }
    }
    
    private func heartTouched(heart:SKNode) {
        guard pictureNumber == 2 else {
            return
        }
        SKTAudio.sharedInstance().playSoundEffect("heartSound")
        run(SKAction.screenZoomWithNode(heart, amount: CGPoint(x: 5, y: 5), oscillations: 2, duration: 2)) {
            self.pictureNumber = 3
            self.setHint()
        }
    }
    
    private func wingsTouched(wings:SKNode) {
        guard pictureNumber == 3 else {
            return
        }
        SKTAudio.sharedInstance().playSoundEffect("wingsSound")
        wings.run(SKAction.setTexture(SKTexture(image: #imageLiteral(resourceName: "wingsTouchedImage"))))
        run(SKAction.afterDelay(2, runBlock: {
            SKTAudio.sharedInstance().playSoundEffect("hiddenPictureFinish")
            self.run(SKAction.afterDelay(1, runBlock: {
                self.startGame(JigsawPuzzle(size: self.view!.bounds.size))
            }))
        }))
    }
    
    private func jacketTouched(jacket:SKNode) {
        guard pictureNumber == 1 else {
            return
        }
        SKTAudio.sharedInstance().playSoundEffect("jacketSound")
        jacket.run(SKAction.setTexture(SKTexture(image: #imageLiteral(resourceName: "jacketTouchedImage"))))
        run(SKAction.afterDelay(1, runBlock: {
            self.pictureNumber = 2
            self.setHint()
        }))
    }
    
    private func hatTouched(hat:SKNode) {
        guard pictureNumber == 2 else {
            return
        }
        SKTAudio.sharedInstance().playSoundEffect("hatSound")
        run(SKAction.actionWithEffect(SKTRotateEffect(node: hat, duration: 1, startAngle: 0, endAngle: -3)))
        hat.run(SKAction.moveTo(x: hat.position.x + 30, duration: 1)) {
            self.run(SKAction.actionWithEffect(SKTRotateEffect(node: hat, duration: 1, startAngle: -3, endAngle: 0)))
            hat.run(SKAction.moveTo(x: hat.position.x - 30, duration: 1)) {
                self.pictureNumber = 3
                self.setHint()
            }
        }
    }
    
    private func glueTouched(glue:SKNode) {
        guard pictureNumber == 3 else {
            return
        }
        SKTAudio.sharedInstance().playSoundEffect("glueSound")
        glue.run(SKAction.jumpToHeight(30, duration: 2, originalPosition: glue.position)) {
            if let simonGame = SimonGame(fileNamed:"SimonGame") {
                SKTAudio.sharedInstance().playSoundEffect("hiddenPictureFinish")
                self.run(SKAction.afterDelay(1, runBlock: {
                    self.startGame(simonGame)
                }))
            }
        }
    }
    
    private func starTouched(star:SKNode) {
        guard pictureNumber == 1 else {
            return
        }
        SKTAudio.sharedInstance().playSoundEffect("starSound")
        star.run(SKAction.setTexture(SKTexture(image: #imageLiteral(resourceName: "starTouchedImage"))))
        run(SKAction.afterDelay(1, runBlock: {
            self.pictureNumber = 2
            self.setHint()
        }))
    }
    
    private func glassesTouched(glasses:SKNode) {
        guard pictureNumber == 2 else {
            return
        }
        SKTAudio.sharedInstance().playSoundEffect("glassesSound")
        glasses.run(SKAction.setTexture(SKTexture(image: #imageLiteral(resourceName: "glassesTouchedImage"))))
        run(SKAction.afterDelay(1, runBlock: {
            self.pictureNumber = 3
            self.setHint()
        }))
    }
    
    private func flakeTouched(flake:SKNode) {
        guard pictureNumber == 3 else {
            return
        }
        SKTAudio.sharedInstance().playSoundEffect("cakeSound")
        let circlePath = UIBezierPath(arcCenter: flake.position, radius: 30, startAngle: 0, endAngle: 2 * CGFloat(M_PI), clockwise: true)
        let movePath = SKAction.follow(circlePath.cgPath, asOffset: false, orientToPath: false, speed: 50)
        flake.run(movePath) {
            if let dragAndDropGame = DragAndDropGame(fileNamed:"DragAndDropGame") {
                SKTAudio.sharedInstance().playSoundEffect("hiddenPictureFinish")
                self.run(SKAction.afterDelay(1, runBlock: {
                    self.startGame(dragAndDropGame)
                }))
            }
        }
    }
    
    private func caneTouched(cane:SKNode) {
        guard pictureNumber == 1 else {
            return
        }
        SKTAudio.sharedInstance().playSoundEffect("caneSound")
        cane.run(SKAction.jumpToHeight(20, duration: 2, originalPosition: cane.position)) {
            self.pictureNumber = 2
            self.setHint()
        }
    }
    
    private func spoonTouched(spoon:SKNode) {
        guard pictureNumber == 2 else {
            return
        }
        SKTAudio.sharedInstance().playSoundEffect("spoonSound")
        run(SKAction.actionWithEffect(SKTRotateEffect(node: spoon, duration: 2, startAngle: 0, endAngle: 13))) {
            self.pictureNumber = 3
            self.setHint()
        }
    }
    
    private func sledTouched(sled:SKNode) {
        guard pictureNumber == 3 else {
            return
        }
        SKTAudio.sharedInstance().playSoundEffect("sledSound")
        sled.run(SKAction.move(to: CGPoint(x: sled.position.x + 30, y: sled.position.y + 40), duration: 1))
        run(SKAction.actionWithEffect(SKTRotateEffect(node: sled, duration: 1, startAngle: 0, endAngle: 0.3)))
        run(SKAction.afterDelay(1, performAction: SKAction.actionWithEffect(SKTRotateEffect(node: sled,
                                                                                            duration: 0.5,
                                                                                            startAngle: 0,
                                                                                            endAngle: -0.3))))
        sled.run(SKAction.afterDelay(1, performAction: SKAction.move(to: CGPoint(x: sled.position.x - 30,
                                                                                 y: sled.position.y - 40),
                                                                     duration: 1))) {
                                                                        if let mazeGame = MazeGameScene(fileNamed:"MazeGameScene") {
                                                                            SKTAudio.sharedInstance().playSoundEffect("hiddenPictureFinish")
                                                                            self.run(SKAction.afterDelay(1, runBlock: {
                                                                                self.startGame(mazeGame)
                                                                            }))
                                                                        }
        }
    }
    
    private func setHint() {
        SKTAudio.sharedInstance().playSoundEffect("hintAppear")
        for i in 1...3 {
            if let hint = childNode(withName: "hint\(i)") {
                if pictureNumber == i {
                    hint.isHidden = false
                    hint.run(SKAction.fadeIn(withDuration: 0.5))
                } else {
                    hint.run(SKAction.fadeOut(withDuration: 1))
                }
            }
        }
    }
    
    private func startGame(_ scene: SKScene) {
        scene.scaleMode = .fill
        SKTAudio.sharedInstance().playSoundEffect("startGame")
        let transition = SKTransition.moveIn(with: .right, duration: 1)
        self.view?.presentScene(scene, transition: transition)
    }
}
