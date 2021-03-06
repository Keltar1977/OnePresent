
import CoreMotion
import SpriteKit

struct Collision {
    static let Ball: UInt32 = 0x1 << 0       // bin(001) = dec(1)
    static let BlackHole: UInt32 = 0x1 << 1  // bin(010) = dec(2)
    static let FinishHole: UInt32 = 0x1 << 2 // bin(100) = dec(4)
    
}

class MazeGameScene: SKScene {
    var sled: SKSpriteNode!
    var nameArray:[String] = []
    var lastTouch: CGPoint? = nil
    // MARK: - SpriteKit Methods
    
    override func didMove(to view: SKView) {

        if let node = childNode(withName: "DaySevenPresentImage") {
            node.run(SKAction.fadeOut(withDuration: 3)) {
                node.zPosition = -2
            }
        }
        physicsWorld.contactDelegate = self
        
        sled = SKSpriteNode(imageNamed: "sled")
        let startPoint = self.childNode(withName: "StartPoint")
        sled.position = (startPoint?.position)!
        sled.size = CGSize(width: sled.frame.width, height: sled.frame.height)
        sled.physicsBody = SKPhysicsBody(circleOfRadius: sled.frame.height / 2)
        sled.physicsBody?.mass = 10.5
        sled.physicsBody?.allowsRotation = false
        sled.physicsBody?.isDynamic = true // necessary to detect collision
        sled.physicsBody?.categoryBitMask = Collision.Ball
        sled.physicsBody?.collisionBitMask = Collision.Ball
        sled.physicsBody?.contactTestBitMask = Collision.BlackHole | Collision.FinishHole
        sled.physicsBody?.affectedByGravity = false
        sled.physicsBody?.linearDamping = 1.0
        sled.physicsBody?.angularDamping = 1.0
        addChild(sled)
        makePath("Wall")
        nameArray.append("Wall")
        makePath("RightWall")
        nameArray.append("RightWall")
        for i in 1...12 {
            makePath("Wall" + "\(i)")
            nameArray.append("Wall" + "\(i)")
        }
    }
    
    func makePath(_ name:String) {
        if let node = self.childNode(withName: name) as? SKShapeNode {
            node.physicsBody = SKPhysicsBody(edgeChainFrom: node.path!)
            node.physicsBody?.categoryBitMask = 4294967295
            node.physicsBody?.fieldBitMask = 4294967295
            node.physicsBody?.collisionBitMask = 4294967295
            node.physicsBody?.pinned = true
        }

        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            lastTouch = touchLocation
        }

    }
    

    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent!) {
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            lastTouch = touchLocation
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent!) {
        lastTouch = nil
    }
    
    override func update(_ currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if let touch = lastTouch {
            if (SKTAudio.sharedInstance().backgroundMusicPlayer == nil) || !SKTAudio.sharedInstance().soundEffectPlayer!.isPlaying {
                SKTAudio.sharedInstance().playSoundEffect("toboggan")
            }
            let impulseVector = CGVector(dx: touch.x - sled.position.x, dy: touch.y - sled.position.y)
            // If myShip starts moving too fast or too slow, you can multiply impulseVector by a constant or clamp its range
            sled.physicsBody?.applyImpulse(impulseVector)
        } else if !sled.physicsBody!.isResting {
            let impulseVector = CGVector(dx: sled.physicsBody!.velocity.dx * -0.5, dy: sled.physicsBody!.velocity.dy * -0.5)
            sled.physicsBody?.applyImpulse(impulseVector)
    }
    }
    
    override func didSimulatePhysics() {
        if let body = sled.physicsBody {
            if (body.velocity.speed() > 0.01) {

                let newAngle = body.velocity.objectAngle() - CGFloat(M_PI)
                switch abs(newAngle) {
                case 2...5:
                   sled.yScale = -1
                default:
                    sled.yScale = 1
                }
                sled.zRotation = newAngle
                print(sled.zRotation)
            }
        }
    }

    
    func centerSled() {
        SKTAudio.sharedInstance().playSoundEffect("Cheek boing")
        sled.isHidden = false
        sled.physicsBody?.velocity = CGVector(dx: 0.0, dy: 0.0)
        let startPoint = self.childNode(withName: "StartPoint")
        let moveAction = SKAction.move(to: startPoint!.position, duration: 0.0)
        sled.run(moveAction)
    }
    
    func alertWon() {
        SKTAudio.sharedInstance().playSoundEffect("gameVictory")
            if let scene = GetPresentPage(fileNamed: "DaySevenGetPresent"),
                let explosion = childNode(withName: "explosion"){
                scene.day = .daySeven
                self.explosionAnimation(explosion: explosion, scene: scene)
            }
    }

}

// MARK: - SKPhysicsContact Delegate Methods
extension MazeGameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        if (contact.bodyA.categoryBitMask == Collision.BlackHole && contact.bodyB.categoryBitMask == Collision.Ball) || (contact.bodyB.categoryBitMask == Collision.BlackHole  && contact.bodyA.categoryBitMask == Collision.Ball) {
            var soundName = ""
            switch Int.random(0, max: 1) {
            case 0:
                soundName = "Pinball bells"
            default:
                soundName = "bumper"
            }
            sled.isHidden = true
            SKTAudio.sharedInstance().playSoundEffect(soundName)
            run(SKAction.afterDelay(1, runBlock: {
                self.centerSled()
            }))
            
        } else if (contact.bodyA.categoryBitMask == Collision.FinishHole && contact.bodyB.categoryBitMask == Collision.Ball) || (contact.bodyB.categoryBitMask == Collision.FinishHole && contact.bodyA.categoryBitMask == Collision.Ball) {
            alertWon()
        } 
    }
}
