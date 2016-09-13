//
//  JigsawPuzzle.swift
//  puzzleGame
//
//  Created by Arturs Derkintis on 8/16/15.
//  Copyright © 2015 Starfly. All rights reserved.
//
// swiftlint:disable line_length
import SpriteKit

class JigsawPuzzle: SKScene {
    var border: SKSpriteNode?
    var points = [CGPoint]()
    var pieces = [Piece]()
    var piecesCount: Int?
    var width: CGFloat = 0
    var imageTiles = ([UIImage](), [CGPoint]())
    var guidePhoto: SKSpriteNode?
    var movingPiece: Piece?
    var maxZPosition: CGFloat = Layer.Tiles
    var imageSize: CGSize!

     override func didMove(to view: SKView) {
        super.didMove(to: view)
        scaleMode = .fill
        backgroundColor = UIColor.lightGray
        let background = SKSpriteNode(imageNamed: "puzzleBackground")
        background.size = view.frame.size
        background.position = view.center
        background.zPosition = 0
        addChild(background)
        let present = SKSpriteNode(texture: SKTexture(imageNamed:"DayFourPresentImage"), size: view.frame.size)
        present.position = view.center
        present.zPosition = 4
        addChild(present)
        run(SKAction.afterDelay(2, runBlock: {
            present.zPosition = -2
            self.imageSize = CGSize(width: 400, height: 400)
            self.setBorder()
            self.startNewPuzzleGameLevel()
        }))
    }

    func startNewPuzzleGameLevel() {
        border?.removeAllChildren()
        let tilesInLine = 4
        pieces.removeAll()
        piecesCount = tilesInLine * tilesInLine
        if imageTiles.0.count == 0 {
            let image = UIImage(named: "puzzleImage")!
            imageTiles = image.jigSawCuter(imageSize, piecesCount: piecesCount!)
        }

        for i in 0...piecesCount! - 1 {
            setPiece(size: CGSize(width: width, height: width), index : i)
        }
        guidePhoto = SKSpriteNode(imageNamed: "puzzleImage")
        guidePhoto?.size = imageSize
        guidePhoto?.zPosition = Layer.GuidePhoto
        guidePhoto?.anchorPoint = CGPoint(x: 0, y: 0)
        guidePhoto?.position = CGPoint(x: 0, y: 0)
        guidePhoto?.alpha = 0.01
        border!.addChild(guidePhoto!)
        for piece in pieces {
            setNeighboursInSafeDistance(piece: piece)
        }
        var scale: CGFloat!
        if size.height > 400 {
            scale = 1.2
        } else {
            scale = 0.6
        }
        border?.setScale(scale)
        border!.position = CGPoint(x: (frame.width - border!.size.width) *
            0.5, y: (frame.height - border!.size.height) * 0.5)
        self.smashAndCrashDown()
    }

    func smashAndCrashDown() {
        let fallRect1 = CGRect(x: 50, y: 50, width: frame.width - 100, height: 5)
        let fallRect2 = CGRect(x: 50, y: frame.height - 130, width: frame.width - 100, height: 5)
        let fallRect3 = CGRect(x: 55, y: 50, width: 5, height: frame.height - 110)
        let fallRect4 = CGRect(x: frame.width - 65, y: 50, width: 5, height: frame.height - 110)
        let rects = [fallRect1, fallRect2, fallRect3, fallRect4]
        for piece in pieces {
            let rect = rects[randomInRange(0, upper: rects.count - 1)]
            let point = CGPoint.randomPointInRect(rect)
            let position = convert(point, to: border!)
            let action = SKAction.move(to: position, duration: 1.5)
            piece.run(action)
            piece.rotateRandomly()
        }
        let fadein = SKAction.fadeAlpha(to: 0.3, duration: 1.5)
        guidePhoto?.run(fadein)
    }

    func setPiece(size: CGSize, index: Int) {
        let piece = Piece()
        piece.size = size
        piece.color = UIColor.blue
        piece.name = pieceName

        piece.tag = index
        let texture = SKTexture(image: imageTiles.0[index])
        let point = imageTiles.1[index]
        piece.zPosition = CGFloat(index + 10)
        maxZPosition = CGFloat(index + 10)
        piece.texture = texture
        piece.size = texture.size()
        let conP = convertUIPointToSprite(point, node: border!)
        piece.position = conP
        piece.correctPosition = conP
        points.append(conP)
        pieces.append(piece)
        border?.addChild(piece)
    }

    func setBorder() {
        let sprite = SKSpriteNode()
        sprite.color = .clear
        sprite.size = imageSize
        sprite.position = CGPoint(x: (frame.width - imageSize.width) *
            0.5, y: (frame.height - imageSize.height) * 0.5)
        sprite.anchorPoint = CGPoint(x: 0, y: 0)
        addChild(sprite)
        border = sprite
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let loc = touch.location( in: border!)
            let nodes = border!.nodes(at: loc)
            var piecess = [Piece]()
            for node in nodes where node.name == pieceName {
                if node.isKind(of:Piece.self) {
                    piecess.append((node as? Piece)!)
                }
            }
            var minElem = CGFloat.leastNormalMagnitude
            var index: Int = 0
            for piece in piecess {
                if piece.zPosition > minElem {
                    minElem += piece.zPosition
                    index = piecess.index(of: piece)!
                }
            }
            if piecess.count > 0 {
                maxZPosition += 1
                movingPiece = piecess[index] as Piece
                movingPiece?.zPosition = maxZPosition
                movingPiece?.touchStart()
            }
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let loc = touch.location(in: border!)
            movingPiece?.touchMoves(point: loc)
        }

    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        movingPiece?.touchEnd()
        if let node = movingPiece, node.isMoving {
            radar(piece: node)
            node.isMoving = false
        } else {
            run(SKAction.afterDelay(2, runBlock: { 
                self.checkPosition()
            }))
            
        }
        movingPiece = nil
    }

    func radar(piece: Piece) {
        let position = piece.position
        var distances = [CGFloat]()
        for point in points {
            let distance = distanceBetweenPoints(point, point2: position)
            distances.append(distance)
        }
        var min: CGFloat = 25
        var index = 0
        for distance in distances {
            if distance < min {
                min = distance
                index = distances.index(of: distance)!
            }
        }
        let point = points[index]
        if piece.correctPosition == point {
            SKTAudio.sharedInstance().playSoundEffect("puzzleCorrect")
            let action = SKAction.move(to: point, duration: 0.001)
            piece.run(action, completion: {
                self.checkPosition()
            })
        } else {
            SKTAudio.sharedInstance().playSoundEffect("puzzleWrong")
        }
    }
    
    func checkPosition() {
        var notInPosition = false
        for piece in self.pieces {
            if roundf(Float(piece.correctPosition!.x)) != roundf(Float(piece.position.x)) ||
                roundf(Float(piece.correctPosition!.y)) != roundf(Float(piece.position.y)) ||
                piece.rotation != .Zero {
                notInPosition = true
            }
        }
        if !notInPosition {
            SKTAudio.sharedInstance().playSoundEffect("gameVictory")
            self.run(SKAction.afterDelay(4, runBlock: {
                if let scene = GetPresentPage(fileNamed: "DayFourGetPresent") {
                    scene.day = .dayFour
                    self.goToScene(scene, transition: .curlUp, fromIndexPage: false)
                }
            }))
        }
    }
    
    
    func setNeighboursInSafeDistance(piece: Piece) {
        let widthe = piece.size.width * 0.9
        let centerNodePosition = piece.position
        let upPoint = CGPoint(x: centerNodePosition.x, y: centerNodePosition.y + widthe)
        let rightPoint = CGPoint(x: centerNodePosition.x + widthe, y: centerNodePosition.y)
        let leftPoint = CGPoint(x: centerNodePosition.x - widthe, y: centerNodePosition.y)
        let downPoint = CGPoint(x: centerNodePosition.x, y: centerNodePosition.y - widthe)
        let upNodes = border?.nodes(at: upPoint)
        let rightNodes = border?.nodes(at: rightPoint)
        let leftNodes  = border?.nodes(at: leftPoint)
        let downNodes = border?.nodes(at: downPoint)
        if let up = upNodes {
        for pie in up where pie.name == pieceName{
            piece.con!.Top = (pie as! Piece).tag!
            }
        }
        if let right = rightNodes{
            for pie in right where pie.name == pieceName{
                piece.con!.Right = (pie as! Piece).tag!
            }
        }
        if let left = leftNodes{
            for pie in left where pie.name == pieceName{
                piece.con!.Left = (pie as! Piece).tag!
            }
        }
        if let down = downNodes{
            for pie in down where pie.name == pieceName{
                let tag = (pie as! Piece).tag!
                piece.con!.Bottom = tag
            }
        }
    }
}

class Piece: SKSpriteNode {
    var correctPosition : CGPoint?
    var con : ConectionTags?
    var sprite : SKSpriteNode?
    var tapTimeInterval : Int = 0
    var taps = 0
    let rotationTimeLimit = 3
    var counterTimer : Timer?
    var rotation = PieceRotation.Zero
    var tag : Int?
    var isMoving = false
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        isUserInteractionEnabled = false
        con = ConectionTags()
    }
    
    func rotateRandomly(){
        let array = [0, 90, 180, 270]
        let index = randomInRange(0, upper: array.count - 1)
        rotation = PieceRotation(rawValue: index)!
        taps = index
        let randomRot = array[index].degreesToRadians
        let action = SKAction.rotate(byAngle: randomRot, duration: 1.5)
        run(action)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
    }
    func touchStart(){
        counterTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(Piece.addMiliSec), userInfo: nil, repeats: true)
    }
    func touchMoves(point : CGPoint){
        if tapTimeInterval > 1 {
            isMoving = true
            let action = SKAction.move(to: point, duration: 0)
            run(action)
        }
    }
    func touchEnd(){
        
        counterTimer?.invalidate()
        counterTimer = nil
        if tapTimeInterval <= 1{
            
            let action = SKAction.rotate(byAngle: 90.degreesToRadians, duration: 0.2)
            run(action)
            tapTimeInterval = 0
            if taps < 3{
                taps += 1
                rotation = PieceRotation(rawValue: taps)!
                
            }else{
                rotation = .Zero
                taps = 0
            }
            }
        tapTimeInterval = 0
    }
    func addMiliSec(){
        tapTimeInterval += 1
    }
    
    
}
