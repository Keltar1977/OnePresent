import UIKit
import SpriteKit

class OnePresentPagesScene: SKScene {

    var btnLeft = SKSpriteNode(imageNamed: "candyCaneLeft")
    var btnRight = SKSpriteNode(imageNamed: "candyCaneRight")
    var nextScene:OnePresentPagesScene!
    var snowfall:SKEmitterNode! = nil
    var bookChapter:BookChapter!
    
    struct BookChapter {
        let day:BookDays
        let pageNumbers:Int
        private var index = 0
        var fromIndexPage = false
        var pageIndex:Int {
            get {
                return index
            }
            set {
                index = newValue
                if index == 0 {
                    fromIndexPage = true
                } else {
                    fromIndexPage = false
                }
            }
        }
        
        init(day:BookDays, pageNumbers:Int) {
            self.day = day
            self.pageNumbers = pageNumbers
        }
    }
    
    override func didMove(to view: SKView) {

        let pageContent = SKSpriteNode(imageNamed: bookChapter.day.rawValue + "Page \(index)")
        pageContent.size = view.frame.size
        pageContent.position = view.center
        pageContent.zPosition = 0
        addChild(pageContent)
        setUpFooter(btnRight: btnRight, btnLeft: btnLeft, fromIndexPage: bookChapter.fromIndexPage)
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>?, with event: UIEvent?) {
//        if index == 4 {
//            nextScene = HiddenPictures(fileNamed:"DayOneHiddenPictures")!
//        } else {
//            nextScene = DayOneScene(size: self.view!.bounds.size)
//        }
//        super.touchesBegan(touches, with: event)
//    }
    
    override func touchesBegan(_ touches: Set<UITouch>?, with event: UIEvent?) {
        super.touchesBegan(touches!, with: event)
        
        for touch in touches!  {
            let location = touch.location(in: self)
             if btnRight.contains(location) {
                nextScene.bookChapter.pageIndex = self.bookChapter.pageIndex + 1
                goToScene(nextScene,transition: .curlUp, fromIndexPage: bookChapter.fromIndexPage)
            } else if btnLeft.contains(location) {
                var transition: UIViewAnimationTransition
                if bookChapter.fromIndexPage {
                    nextScene.bookChapter.pageIndex = self.bookChapter.pageIndex + 1
                    transition = .curlUp
                } else {
                    nextScene.bookChapter.pageIndex = self.bookChapter.pageIndex - 1
                    transition = .curlDown
                }
                if bookChapter.fromIndexPage {
                    SKTAudio.sharedInstance().playSoundEffect("dayButtonPressed")
                } else {
                    SKTAudio.sharedInstance().playSoundEffect("pageFlip")
                }
                goToScene(nextScene,transition: transition, fromIndexPage: bookChapter.fromIndexPage)
             }
        }
    }
    

}

extension SKScene {
    
    final func goToScene(_ scene: SKScene, transition:UIViewAnimationTransition, fromIndexPage:Bool) {
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
    
    final func setUpFooter(btnRight:SKNode, btnLeft:SKNode, fromIndexPage:Bool) {
        if fromIndexPage {
            SKTAudio.sharedInstance().playSoundEffect("dayPageAppear")
            btnRight.run(SKAction.setTexture(SKTexture(imageNamed: "readAlong")))
            btnLeft.run(SKAction.setTexture(SKTexture(imageNamed: "readYourself")))
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
            btnLeft.position = CGPoint(x: 70, y: self.size.height/2)
            btnLeft.zPosition = 3
            addChild(btnLeft)
    }
    }
}
