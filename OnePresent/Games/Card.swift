import Foundation
import SpriteKit

enum CardName: Int {
    case creatureWolf = 0,
    creatureBear,       // 1
    creatureDragon,     // 2
    spellRabid,         // 3
    spellSleep,         // 4
    spellStoneskin      // 5

}

class Card : SKSpriteNode {
    
    let frontTexture: SKTexture
    let backTexture: SKTexture
//    var largeTexture: SKTexture?
//    let largeTextureFilename: String
    var faceUp = false
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(cardNamed: CardName) {
        
        // initialize properties
        backTexture = SKTexture(imageNamed: "cardBack")
        
        switch cardNamed {
        case .creatureWolf:
            frontTexture = SKTexture(imageNamed: "cardWolf")
//            largeTextureFilename = "card_creature_wolf_large.png"
        case .creatureBear:
            frontTexture = SKTexture(imageNamed: "cardBear")
//            largeTextureFilename = "Card_creature_bear_large.png"
        case .creatureDragon:
            frontTexture = SKTexture(imageNamed: "cardDragon")
        case .spellRabid:
            frontTexture = SKTexture(imageNamed: "cardRabid")
        case .spellSleep:
            frontTexture = SKTexture(imageNamed: "cardSleep")
        case .spellStoneskin:
            frontTexture = SKTexture(imageNamed: "cardStoneSkin")
//            largeTextureFilename = "card_back_large.png"
        }
        
        // call designated initializer on super
        super.init(texture: backTexture, color: UIColor(), size: frontTexture.size())
        
        
        // set properties defined in super
//        userInteractionEnabled = true
    }
    

    
    func flip() {
        self.run(SKAction.afterDelay(0.3, runBlock: {
            let firstHalfFlip = SKAction.scaleX(to: 0.0, duration: 0.2)
            let secondHalfFlip = SKAction.scaleX(to: 1.0, duration: 0.2)
            
            self.setScale(1.0)
            SKTAudio.sharedInstance().playSoundEffect("card flip")
            if self.faceUp {
                self.faceUp = false
                self.run(firstHalfFlip) {
                    self.texture = self.backTexture
                    self.run(secondHalfFlip)
                }
            } else {
                self.faceUp = true
                self.run(firstHalfFlip) {
                    self.texture = self.frontTexture
                    self.run(secondHalfFlip)
                }
            }
        }))
        
    }
    

}
