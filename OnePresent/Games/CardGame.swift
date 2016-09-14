//
//  CardGame.swift
//  OnePresent
//
//  Created by Maxym on 5/17/16.
//  Copyright © 2016 sjinnovation. All rights reserved.
//

import UIKit
import SpriteKit

class CardGame: SKScene {

    var selectedCards = [Card]()
    var counter = 0
    
    override func didMove(to view: SKView) {
        
        var cardOrder = [0,0,1,1,2,2,3,3,4,4,5,5]
        cardOrder = cardOrder.shuffle()
        let backgoround = SKSpriteNode(texture: SKTexture(imageNamed:"memoryGameBackground"), size: view.frame.size)
        backgoround.position = view.center
        backgoround.zPosition = -1
        addChild(backgoround)
        let present = SKSpriteNode(texture: SKTexture(imageNamed:"DayThreePresentImage"), size: view.frame.size)
        present.position = view.center
        present.zPosition = 4
        addChild(present)
        present.run(SKAction.fadeOut(withDuration: 3)) {
            present.zPosition = -2
        }
        for i in 0 ..< 12 {
            let k = i%4
            let j = i/4
            if let cardName = CardName(rawValue: cardOrder[i]) {
                let cardNode = Card(cardNamed: cardName)
                cardNode.size = CGSize(width: 0.2 * view.frame.size.width, height: 0.2 * view.frame.size.height)
                cardNode.name = "\(cardOrder[i])"
                let stepX = (frame.width - 4 * cardNode.frame.width)/5
                let stepY = frame.height/2 + 1.1 * cardNode.frame.height
                let posX = stepX + cardNode.frame.width/2 + CGFloat(k) * (stepX + cardNode.frame.width)
                let posY = stepY - 1.1 * CGFloat(j) * cardNode.frame.height
                cardNode.position = CGPoint(x:posX, y: posY)
                addChild(cardNode)
            }
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: scene!)
            let touchedNode = atPoint(location)
            if touchedNode.isKind(of: Card.self) && !(touchedNode as! Card).faceUp {
                (touchedNode as! Card).flip()
                selectedCards.append((touchedNode as! Card))
            }
            
                if self.selectedCards.count == 2 {
                    isUserInteractionEnabled = false
                    run(SKAction.wait(forDuration: 1.0), completion: {
                    if self.selectedCards[0].name == self.selectedCards[1].name {
                        SKTAudio.sharedInstance().playSoundEffect("xylophone 1 high")
                        self.counter += 1
                    } else {
                        SKTAudio.sharedInstance().playSoundEffect("Rachet short")
                        for card in self.selectedCards {
                            card.flip()
                        }

                    }
                    self.selectedCards.removeAll()
                    if self.counter == 6 {
                        SKTAudio.sharedInstance().playSoundEffect("gameVictory")
                            if let scene = GetPresentPage(fileNamed: "DayThreeGetPresent") {
                                scene.day = .dayThree
                                let explosion = SKSpriteNode(imageNamed: "explosion1")
                                explosion.position = self.view!.center
                                self.addChild(explosion)
                                self.explosionAnimation(explosion: explosion, scene: scene)
                            }
                    }
                    self.isUserInteractionEnabled = true
                    })

                }
           
        }
    }
}
