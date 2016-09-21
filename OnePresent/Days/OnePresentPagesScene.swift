import UIKit
import SpriteKit

class OnePresentPagesScene: SKScene {

    var btnLeft = SKNode()
    var btnRight = SKNode()
    var readYourselfButton = SKNode()
    var readAloneButton = SKNode()
    var snowfall:SKEmitterNode! = nil
    var bookChapter:BookChapter!
    

    
    override func didMove(to view: SKView) {

        if let pageContent = childNode(withName: "pageContent") {
            let texture = SKTexture(imageNamed: bookChapter.day.rawValue + "Page \(bookChapter.pageIndex)")
            pageContent.run(SKAction.setTexture(texture))
        }
        if bookChapter.fromIndexPage {
            SKTAudio.sharedInstance().playSoundEffect("dayPageAppear")
        }
        run(SKAction.afterDelay(1, runBlock: {
            let narration = self.bookChapter.day.rawValue + "NarrationPage\(self.bookChapter.pageIndex)"
            SKTAudio.sharedInstance().playNarration(narration)
        }))
        setUpFooter()
    }
    
    final func setUpFooter() {
        if let node = childNode(withName: "rightCane") {
            btnRight = node
        }
        if let node = childNode(withName: "leftCane") {
            btnLeft = node
        }
        if let node = childNode(withName: "readYourself") {
            readYourselfButton = node
        }
        if let node = childNode(withName: "readAlone") {
            readAloneButton = node
        }
        if bookChapter.fromIndexPage {
            btnRight.zPosition = -1
            readAloneButton.zPosition = 3
            readYourselfButton.zPosition = 3
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>?, with event: UIEvent?) {
        super.touchesBegan(touches!, with: event)
        
        for touch in touches!  {
            let location = touch.location(in: self)
            
            if bookChapter.fromIndexPage, readYourselfButton.contains(location) || readAloneButton.contains(location) {
                firstPageTouch(location: location)
            } else if bookChapter.fromIndexPage, btnLeft.contains(location) {
                if let nextScene = IndexPageScene(fileNamed:"IndexPageScene") {
                    simpleTransition(nextScene, startGame: false, direction: .left)
                }
            } else if bookChapter.pageIndex == bookChapter.pageNumbers, btnRight.contains(location) {
                if let nextScene = HiddenPictures(fileNamed:bookChapter.day.rawValue + "HiddenPictures") {
                    nextScene.day = bookChapter.day 
                    goToScene(nextScene,transition: .curlUp)
                }
            } else if btnLeft.contains(location) || btnRight.contains(location) {
                if let nextScene = OnePresentPagesScene(fileNamed: "OnePresentPagesScene") {
                    candyCaneTouched(nextScene:nextScene, location: location)
                }
            }
        }
    }
    func candyCaneTouched(nextScene:OnePresentPagesScene,location:CGPoint) {
        nextScene.bookChapter = self.bookChapter
        var transition = UIViewAnimationTransition.curlUp
        nextScene.bookChapter.pageIndex = self.bookChapter.pageIndex + 1
        if btnLeft.contains(location) {
            transition = .curlDown
            nextScene.bookChapter.pageIndex = self.bookChapter.pageIndex - 1
        }
        if nextScene.bookChapter.fromIndexPage {
            simpleTransition(nextScene, startGame: false, direction: .left)
        } else {
           goToScene(nextScene,transition: transition)
        }
        

    }
    
    func firstPageTouch(location:CGPoint) {
        var narration = false
        if readAloneButton.contains(location) {
            narration = true
        }
        SKTAudio.sharedInstance().withNarration = narration
        if let nextScene = OnePresentPagesScene(fileNamed: "OnePresentPagesScene") {
            nextScene.bookChapter = self.bookChapter
            nextScene.bookChapter.pageIndex = self.bookChapter.pageIndex + 1
            nextScene.bookChapter.narration = narration
            SKTAudio.sharedInstance().playSoundEffect("dayButtonPressed")
            simpleTransition(nextScene, startGame: false, direction: .right)
        }
    }
    
    override func willMove(from view: SKView) {
        SKTAudio.sharedInstance().pauseNarration()
    }
    

}

extension SKScene {
    final func goToScene(_ scene: SKScene, transition:UIViewAnimationTransition) {
        scene.scaleMode = .fill
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationTransition(transition, for: self.view!, cache: false)
        UIView.commitAnimations()
        SKTAudio.sharedInstance().playSoundEffect("pageFlip")
        UIView.animate(withDuration: 0.6, animations: {
            self.view?.presentScene(scene)
        }) { (finished) in
            
        }
    }
    
    final func startSnowfall (emitterNode:SKEmitterNode?) -> SKEmitterNode {
        let path = Bundle.main.path(forResource: "snowfall", ofType: "sks")
        if let node = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as? SKEmitterNode, emitterNode == nil {
            node.position = CGPoint(x:self.size.width/2 ,y:self.size.height)
            node.name = "snowfall"
            node.targetNode = self.scene
            node.zPosition = 100
            self.addChild(node)
            return node
        }
        return emitterNode!
    }
    
    final func simpleTransition(_ scene: SKScene, startGame:Bool, direction: SKTransitionDirection) {
        scene.scaleMode = .fill
        if startGame {
            SKTAudio.sharedInstance().playSoundEffect("startGame")
        } else if let current = self as? OnePresentPagesScene, current.bookChapter.fromIndexPage {
            SKTAudio.sharedInstance().playSoundEffect("dayButtonPressed")
        } else {
            SKTAudio.sharedInstance().playSoundEffect("pageFlip")
        }
        let transition = SKTransition.moveIn(with: direction, duration: 1)
        self.view?.presentScene(scene, transition: transition)
    }
    
    func explosionAnimation(explosion:SKNode ,scene:SKScene) {
        explosion.zPosition = 100
        var textures:[SKTexture] = []
        for i in 1...8 {
            let texture = SKTexture(imageNamed: "explosion\(i)")
            textures.append(texture)
        }
        explosion.run(SKAction.animate(with: textures, timePerFrame: 0.2, resize: true, restore: false))
        run(SKAction.afterDelay(3, runBlock: { 
            self.simpleTransition(scene, startGame: false, direction: .right)
        }))
    }
}
