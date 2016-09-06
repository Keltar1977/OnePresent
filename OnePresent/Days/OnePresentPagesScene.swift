import UIKit
import SpriteKit

class OnePresentPagesScene: SKScene {

    var index:Int = 0
    var btnLeft = SKSpriteNode(imageNamed: "candyCaneLeft")
    var btnRight = SKSpriteNode(imageNamed: "candyCaneRight")
    final let dancingPresent = SKSpriteNode(imageNamed: "dancingPresent")
    var fromIndexPage = false
    var nextScene:OnePresentPagesScene!
    var isComeBackPage = false
    var snowfall:SKEmitterNode! = nil
    
    
    override func didMove(to view: SKView) {

    }
    
    final func setUpFooter() {
        if fromIndexPage {
            SKTAudio.sharedInstance().playSoundEffect("dayPageAppear")
            btnRight = SKSpriteNode(imageNamed: "readAlong")
            btnLeft = SKSpriteNode(imageNamed: "readYourself")
            btnRight.position = CGPoint(x:(3 * self.size.width)/4, y: self.size.height/4)
            btnRight.zPosition = 1
            btnLeft.position = CGPoint(x: self.size.width/4, y:  self.size.height/4)
            btnLeft.zPosition = 1
            addChild(btnRight)
            addChild(btnLeft)
        } else {
            btnRight.position = CGPoint(x: self.size.width - 70, y: self.size.height/2)
            btnRight.zPosition = 3
            addChild(btnRight)
            if index > 0 {
                btnLeft.position = CGPoint(x: 70, y: self.size.height/2)
                btnLeft.zPosition = 3
                addChild(btnLeft)
            }
        }
    }
    
    func giveHighFive(location:CGPoint) {
        if let hand = childNode(withName: "hand"), hand.contains(location) {
            hand.name = "touchedHand"
            hand.run(SKAction.actionWithEffect(SKTRotateEffect(node: hand, duration: 0.25, startAngle: 0, endAngle: -1.5)))
            hand.run(SKAction.moveTo(y: hand.position.y - 140, duration: 0.25))
            hand.run(SKAction.moveTo(x: hand.position.x + 20, duration: 0.125))
        }
    }
    

    
    final func startSnowfall () {
        let path = Bundle.main.path(forResource: "snowfall", ofType: "sks")
        if let node = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as? SKEmitterNode, snowfall == nil {
            snowfall = node
            snowfall.position = CGPoint(x:self.size.width/2 ,y:self.size.height)
            snowfall.name = "snowfall"
            snowfall.targetNode = self.scene
            snowfall.zPosition = 100
            self.addChild(snowfall)
        }

    }
    
    override func touchesBegan(_ touches: Set<UITouch>?, with event: UIEvent?) {
        super.touchesBegan(touches!, with: event)
        
        for touch in touches!  {
            let location = touch.location(in: self)
             if btnRight.contains(location) {
                nextScene.index = self.index + 1
                goToScene(nextScene,transition: .curlUp)
            } else if btnLeft.contains(location) {
                var transition: UIViewAnimationTransition
                if fromIndexPage {
                    nextScene.index = self.index + 1
                    transition = .curlUp
                } else {
                    nextScene.index = self.index - 1
                    transition = .curlDown
                }
                goToScene(nextScene,transition: transition)
             }
        }
    }
    
    final func goToScene(_ scene: SKScene, transition:UIViewAnimationTransition) {
        scene.scaleMode = .aspectFill
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDuration(0.2)
        UIView.setAnimationTransition(transition, for: self.view!, cache: false)
        UIView.commitAnimations()
        if fromIndexPage {
            SKTAudio.sharedInstance().playSoundEffect("dayButtonPressed")
        } else {
            SKTAudio.sharedInstance().playSoundEffect("pageFlip")
        }
        UIView.animate(withDuration: 0.001, animations: {
            self.view?.presentScene(scene)
        }) { (finished) in
            
        }
        
    }
    

    

    

}
