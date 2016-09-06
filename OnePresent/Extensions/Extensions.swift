//
//  Extenstions.swift
//  TwitterTimeline
//
//  Created by Arturs Derkintis on 8/10/15.
//  Copyright © 2015 Starfly. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
extension UIColor{
    convenience init(rgba: String) {
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = 1.0
        
        if rgba.hasPrefix("#") {
            let index   = rgba.characters.index(rgba.startIndex, offsetBy: 1)
            let hex = rgba.substring(from: index)
            let scanner = Scanner(string: hex as String)
            var hexValue: CUnsignedLongLong = 0
            if scanner.scanHexInt64(&hexValue) {
                if (hex.characters.count == 6) {
                    red   = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
                    green = CGFloat((hexValue & 0x00FF00) >> 8)  / 255.0
                    blue  = CGFloat(hexValue & 0x0000FF) / 255.0
                } else if hex.characters.count == 8 {
                    red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                    green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                    blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                    alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
                } else {
                    print("invalid rgb string, length should be 7 or 9", terminator: "")
                }
            } else {
                print("scan hex error")
            }
        } else {
            print("invalid rgb string, missing '#' as prefix", terminator: "")
        }
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
}

public func convertUIPointToSprite(_ point: CGPoint, node : SKSpriteNode) -> CGPoint{
    
    let height = node.size.height
    let y = height - point.y
    
    return CGPoint(x: point.x, y: y)
    
}
extension Int {
    var degreesToRadians : CGFloat {
        return CGFloat(self) * CGFloat(M_PI) / 180.0
    }
}

extension UIImage{
    func sliceImageToPieces(_ imageSize : CGSize, pieceSize : CGSize) -> [UIImage]{
        let whole = resizeImage(imageSize, image: self)
        var imagesArray = [UIImage]()
       
        let imagesCountInLine = Int(imageSize.width / pieceSize.width)
        let tilesCount = Int(imagesCountInLine * imagesCountInLine)
        var line = 0
        var row = 0
        for _ in 0 ..< tilesCount {
            let cgImg = whole.cgImage?.cropping(to: CGRect(x: CGFloat(row) * pieceSize.width, y: CGFloat(line) * pieceSize.width, width: pieceSize.width, height: pieceSize.height));
            let img = UIImage(cgImage: cgImg!)
            imagesArray.append(img)

            if row == imagesCountInLine - 1{
                line += 1
                row = 0
            }else{
                row += 1
            }
        }

        return imagesArray
    }
    func resizeImage(_ size: CGSize, image : UIImage) -> UIImage {
      
        UIGraphicsBeginImageContext(size);
        
        let context = UIGraphicsGetCurrentContext();
        context?.translateBy(x: 0.0, y: size.height);
        context?.scaleBy(x: 1.0, y: -1.0);
        
        context?.draw(image.cgImage!, in: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();

        return scaledImage!
    }

    func jigSawCuter(_ imageSize : CGSize, piecesCount : Int) -> ([UIImage], [CGPoint]){
        let imageOrg = resizeImage(imageSize, image: self)
        var im = [UIImage]()
        let paths = (getPath(imageSize) as NSArray).reversedArray() as! [UIBezierPath]
        var centers = [CGPoint]()
        ////Next lines generates huge memory peak when image is cutted, but it releases afterwards
        for i in 0 ..< piecesCount {
            let path = paths[i]
            path.usesEvenOddFillRule = true
            centers.append(path.center())
            let result = clipImage(path, image: imageOrg)
            im.append(result)
            

        }
        return (im, centers)
    }
    func clipImage(_ path : UIBezierPath, image : UIImage) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(image.size, false, 0)
        path.addClip()
        image.draw(at: CGPoint.zero)
        let newIma = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return trimmed(newIma!)
    }
    func trimmed(_ image : UIImage) -> UIImage{
        let inImage = image.cgImage
        let m_dataRef : CFData = inImage!.dataProvider!.data!
        let m_PixelBuf : UnsafePointer<UInt8> = CFDataGetBytePtr(m_dataRef)
        let width : size_t = inImage!.width
        let height : size_t = inImage!.height
        var top : CGPoint?
        var left : CGPoint?
        var right : CGPoint?
        var bottom : CGPoint?
        var breakOut = false
        for x in 0..<width where breakOut == false  {
            for y in 0 ..< height{
                var loc = x + (y * width)
                loc *= 4
                if m_PixelBuf[loc + 3] != 0{
                    left = CGPoint(x: CGFloat(x), y: CGFloat(y))
                    breakOut = true
                    break
                }
                
               
            }
            
        }
        breakOut = false
        for  y in 0..<height where breakOut == false {
            for x in 0 ..< width {
                var loc = x + (y * width)
                loc *= 4
                if m_PixelBuf[loc + 3] != 0{
                    top = CGPoint(x: CGFloat(x), y: CGFloat(y))
                    breakOut = true
                    break
                }
            }
        }
        breakOut = false
        for y in stride(from: (height - 1), to: 0, by: -1) where breakOut == false {
            for x in stride(from: (width - 1), to: 0, by: -1) {
                var loc = x + (y * width)
                loc *= 4
                if m_PixelBuf[loc + 3] != 0{
                    bottom = CGPoint(x: CGFloat(x), y: CGFloat(y))
                    breakOut = true
                    break
                }
            }
        }
        breakOut = false
        for x in stride(from: (width - 1), to: 0, by: -1) where breakOut == false {
            for y in stride(from: (height - 1), to: 0, by: -1) {
                var loc = x + (y * width)
                loc *= 4
                if m_PixelBuf[loc + 3] != 0{
                    right = CGPoint(x: CGFloat(x), y: CGFloat(y))
                    breakOut = true
                    break
                }
            }
        }
        let scale = image.scale
        let cropRect = CGRect(x: left!.x / scale, y: top!.y / scale, width: (right!.x - left!.x) / scale, height: (bottom!.y - top!.y) / scale)
        UIGraphicsBeginImageContextWithOptions(cropRect.size, false, scale)
        image.draw(at: CGPoint(x: -cropRect.origin.x, y: -cropRect.origin.y), blendMode: CGBlendMode.copy, alpha: 1.0)
        let croppedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return croppedImage!
        
       
    }
    
}

extension NSArray{
    func reversedArray() -> NSArray{
        let array = NSMutableArray(capacity: self.count)
        let enumeratore = self.reverseObjectEnumerator()
        for element in enumeratore {
            array.add(element)
            
        }
        return array
    }
    
}
extension UIBezierPath{
    func center() -> CGPoint{
        return CGPoint(x: self.bounds.midX, y: self.bounds.midY)
    }
}
public func abbreviateNumber(_ num: NSNumber) -> NSString {
    var ret: NSString = ""
    let abbrve: [String] = ["K", "M", "B"]
    
    let floatNum = num.floatValue
    
    if floatNum > 1000 {
        
        for i in 0..<abbrve.count {
            let size = pow(10.0, (Float(i) + 1.0) * 3.0)
            // print("\(size)   \(floatNum)")
            if (size <= floatNum) {
                let num = floatNum / size
                let str = floatToString(num)
                ret = NSString(format: "%@%@", str, abbrve[i])
            }
        }
    } else {
        ret = NSString(format: "%d", Int(floatNum))
    }
    
    return ret
}
public func floatToString(_ val: Float) -> NSString {
    var ret = NSString(format: "%.1f", val)
    var c = ret.character(at: ret.length - 1)
    
    while c == 48 {
        ret = ret.substring(to: ret.length - 1) as NSString
        c = ret.character(at: ret.length - 1)
        
        
        if (c == 46) {
            ret = ret.substring(to: ret.length - 1) as NSString
        }
    }
    return ret
}
public func distanceBetweenPoints(_ point1:CGPoint,point2:CGPoint)->CGFloat{
    return sqrt(pow(point1.x-point2.x,2) + pow(point1.y-point2.y,2));
}
extension CGSize{
    
    func containsPoint(_ point : CGPoint) -> Bool{
        if point.x >= 0 && point.x <= width && point.y >= 0 && point.y <= height{
            return true
        }
        return false
    }
    
}
extension CGPoint{
    static func randomPointInRect(_ rect : CGRect) -> CGPoint{
            var point = rect.origin
            point.x += CGFloat(arc4random_uniform(UInt32(rect.width)))
            point.y += CGFloat(arc4random_uniform(UInt32(rect.height)))
    
            return point
        
     
    }
}
extension Collection where Index == Int {
    /// Return a copy of `self` with its elements shuffled
    func shuffle() -> [Iterator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

extension MutableCollection where Index == Int, IndexDistance == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            if i != j {
                swap(&self[i], &self[j])
            }
        }
    }
}
public func randomInRange (_ lower: Int , upper: Int) -> Int {
    return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
}
public func delay(_ delay:Double, closure:@escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

