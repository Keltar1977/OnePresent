//
//  PuzzleBeziers.swift
//  puzzleGame
//
//  Created by Arturs Derkintis on 8/16/15.
//  Copyright © 2015 Starfly. All rights reserved.
//

import UIKit

public func getPath(_ size:CGSize) -> [UIBezierPath]{
    
    var paths = [UIBezierPath]()


    
    
    
// MARK: 4th row
    
     let k:CGFloat = (2.24 * size.width)/760
    let j:CGFloat = (2.24 * size.height)/698
    
    
let puzzle44 = UIBezierPath()
puzzle44.move(to: CGPoint(x: size.width, y: size.height))
puzzle44.addLine (to: CGPoint(x: size.width, y: 234.6 * j))
puzzle44.addCurve(to: CGPoint(x: k * 316.6, y: 232.5 * j), controlPoint1: CGPoint(x: k * 330.9, y: 232.1 * j), controlPoint2: CGPoint(x: k * 321.3, y: 228 * j))
puzzle44.addCurve(to: CGPoint(x: k * 313.9, y: 237.5 * j), controlPoint1: CGPoint(x: k * 315.8, y: 233.3 * j), controlPoint2: CGPoint(x: k * 314.4, y: 235.1 * j))
puzzle44.addCurve(to: CGPoint(x: k * 315.9, y: 248.4 * j), controlPoint1: CGPoint(x: k * 312.8, y: 242.8 * j), controlPoint2: CGPoint(x: k * 317.3, y: 245.9 * j))
puzzle44.addCurve(to: CGPoint(x: k * 299.9, y: 247.5 * j), controlPoint1: CGPoint(x: k * 314, y: 251.9 * j), controlPoint2: CGPoint(x: k * 302.1, y: 251.7 * j))
puzzle44.addCurve(to: CGPoint(x: k * 301.9, y: 235.9 * j), controlPoint1: CGPoint(x: k * 298.1, y: 244 * j), controlPoint2: CGPoint(x: k * 303.9, y: 240.2 * j))
puzzle44.addCurve(to: CGPoint(x: k * 292.2, y: 231.3 * j), controlPoint1: CGPoint(x: k * 300, y: 231.8 * j), controlPoint2: CGPoint(x: k * 292.6, y: 231.3 * j))
puzzle44.addCurve(to: CGPoint(x: k * 282.2, y: 234 * j), controlPoint1: CGPoint(x: k * 287.2, y: 231.1 * j), controlPoint2: CGPoint(x: k * 283.3, y: 233.4 * j))
puzzle44.addCurve(to: CGPoint(x: k * 248.1, y: 240 * j), controlPoint1: CGPoint(x: k * 274.2, y: 238.5 * j), controlPoint2: CGPoint(x: k * 259.9, y: 240.3 * j))
puzzle44.addCurve(to: CGPoint(x: k * 250.4, y: 258.9 * j), controlPoint1: CGPoint(x: k * 246.7, y: 248.7 * j), controlPoint2: CGPoint(x: k * 246.5, y: 256 * j))
puzzle44.addCurve(to: CGPoint(x: k * 255.1, y: 260.7 * j), controlPoint1: CGPoint(x: k * 251.6, y: 259.9 * j), controlPoint2: CGPoint(x: k * 253.2, y: 260.3 * j))
puzzle44.addCurve(to: CGPoint(x: k * 269.5, y: 261.1 * j), controlPoint1: CGPoint(x: k * 262.6, y: 262.6 * j), controlPoint2: CGPoint(x: k * 266.7, y: 259.2 * j))
puzzle44.addCurve(to: CGPoint(x: k * 266.9, y: 275.2 * j), controlPoint1: CGPoint(x: k * 273.2, y: 263.6 * j), controlPoint2: CGPoint(x: k * 271.4, y: 273.7 * j))
puzzle44.addCurve(to: CGPoint(x: k * 254.7, y: 271.8 * j), controlPoint1: CGPoint(x: k * 262.9, y: 276.5 * j), controlPoint2: CGPoint(x: k * 258.8, y: 270.4 * j))
puzzle44.addCurve(to: CGPoint(x: k * 250.6, y: 279 * j), controlPoint1: CGPoint(x: k * 251.8, y: 272.8 * j), controlPoint2: CGPoint(x: k * 251, y: 276.7 * j))
puzzle44.addCurve(to: CGPoint(x: k * 253.6, y: size.height), controlPoint1: CGPoint(x: k * 249, y: 288.9 * j), controlPoint2: CGPoint(x: k * 251.6, y: 298.3 * j))
puzzle44.addLine(to: CGPoint(x: k * 338.4, y: size.height))
puzzle44.close()
puzzle44.miterLimit = 4;

paths.append(puzzle44)


let puzzle43 = UIBezierPath()
puzzle43.move(to: CGPoint(x: k * 253.5, y: size.height))
puzzle43.addCurve(to: CGPoint(x: k * 250.5, y: 278.8 * j), controlPoint1: CGPoint(x: k * 251.5, y: 298.1 * j), controlPoint2: CGPoint(x: k * 248.9, y: 288.7 * j))
puzzle43.addCurve(to: CGPoint(x: k * 254.6, y: 271.6 * j), controlPoint1: CGPoint(x: k * 250.9, y: 276.5 * j), controlPoint2: CGPoint(x: k * 251.7, y: 272.6 * j))
puzzle43.addCurve(to: CGPoint(x: k * 266.8, y: 275 * j), controlPoint1: CGPoint(x: k * 258.7, y: 270.2 * j), controlPoint2: CGPoint(x: k * 262.8, y: 276.3 * j))
puzzle43.addCurve(to: CGPoint(x: k * 269.4, y: 260.9 * j), controlPoint1: CGPoint(x: k * 271.3, y: 273.6 * j), controlPoint2: CGPoint(x: k * 273.1, y: 263.5 * j))
puzzle43.addCurve(to: CGPoint(x: k * 255, y: 260.5 * j), controlPoint1: CGPoint(x: k * 266.7, y: 259 * j), controlPoint2: CGPoint(x: k * 262.5, y: 262.4 * j))
puzzle43.addCurve(to: CGPoint(x: k * 250.3, y: 258.7 * j), controlPoint1: CGPoint(x: k * 253.1, y: 260 * j), controlPoint2: CGPoint(x: k * 251.6, y: 259.6 * j))
puzzle43.addCurve(to: CGPoint(x: k * 248, y: 239.8 * j), controlPoint1: CGPoint(x: k * 246.5, y: 255.8 * j), controlPoint2: CGPoint(x: k * 246.7, y: 248.4 * j))
puzzle43.addCurve(to: CGPoint(x: k * 228.7, y: 235 * j), controlPoint1: CGPoint(x: k * 237.8, y: 239.6 * j), controlPoint2: CGPoint(x: k * 229.4, y: 237.8 * j))
puzzle43.addCurve(to: CGPoint(x: k * 232.7, y: 226.8 * j), controlPoint1: CGPoint(x: k * 228.1, y: 232.7 * j), controlPoint2: CGPoint(x: k * 233.3, y: 230.9 * j))
puzzle43.addCurve(to: CGPoint(x: k * 224.5, y: 220.2 * j), controlPoint1: CGPoint(x: k * 232.2, y: 223.5 * j), controlPoint2: CGPoint(x: k * 228.2, y: 220.8 * j))
puzzle43.addCurve(to: CGPoint(x: k * 213.2, y: 224.9 * j), controlPoint1: CGPoint(x: k * 219.9, y: 219.4 * j), controlPoint2: CGPoint(x: k * 214.6, y: 221.5 * j))
puzzle43.addCurve(to: CGPoint(x: k * 214.5, y: 233.1 * j), controlPoint1: CGPoint(x: k * 211.7, y: 228.4 * j), controlPoint2: CGPoint(x: k * 215.6, y: 230.6 * j))
puzzle43.addCurve(to: CGPoint(x: k * 165.2, y: 233.4 * j), controlPoint1: CGPoint(x: k * 211.8, y: 239.4 * j), controlPoint2: CGPoint(x: k * 181, y: 239.3 * j))
puzzle43.addCurve(to: CGPoint(x: k * 159.1, y: 232.2 * j), controlPoint1: CGPoint(x: k * 164.4, y: 233.1 * j), controlPoint2: CGPoint(x: k * 161.9, y: 232.1 * j))
puzzle43.addCurve(to: CGPoint(x: k * 165.6, y: 258.5 * j), controlPoint1: CGPoint(x: k * 159.6, y: 241.9 * j), controlPoint2: CGPoint(x: k * 161.6, y: 252.2 * j))
puzzle43.addCurve(to: CGPoint(x: k * 168.5, y: 268.2 * j), controlPoint1: CGPoint(x: k * 166.3, y: 259.5 * j), controlPoint2: CGPoint(x: k * 168.8, y: 263.3 * j))
puzzle43.addCurve(to: CGPoint(x: k * 163.5, y: 277.6 * j), controlPoint1: CGPoint(x: k * 168.5, y: 268.6 * j), controlPoint2: CGPoint(x: k * 168, y: 275.7 * j))
puzzle43.addCurve(to: CGPoint(x: k * 150.9, y: 275.7 * j), controlPoint1: CGPoint(x: k * 158.9, y: 279.5 * j), controlPoint2: CGPoint(x: k * 154.7, y: 273.9 * j))
puzzle43.addCurve(to: CGPoint(x: k * 149.9, y: 291.2 * j), controlPoint1: CGPoint(x: k * 146.3, y: 277.9 * j), controlPoint2: CGPoint(x: k * 146.1, y: 289.4 * j))
puzzle43.addCurve(to: CGPoint(x: k * 161.8, y: 289.3 * j), controlPoint1: CGPoint(x: k * 152.6, y: 292.5 * j), controlPoint2: CGPoint(x: k * 156, y: 288.2 * j))
puzzle43.addCurve(to: CGPoint(x: k * 167.2, y: 291.9 * j), controlPoint1: CGPoint(x: k * 164.4, y: 289.8 * j), controlPoint2: CGPoint(x: k * 166.4, y: 291.2 * j))
puzzle43.addCurve(to: CGPoint(x: k * 166.3, y: size.height), controlPoint1: CGPoint(x: k * 171.4, y: 295.7 * j), controlPoint2: CGPoint(x: k * 168.8, y: 303 * j))
puzzle43.addLine (to: CGPoint(x: k * 253.5, y: size.height))
puzzle43.close()
puzzle43.miterLimit = 4;

paths.append(puzzle43)


let puzzle42 = UIBezierPath()
puzzle42.move(to: CGPoint(x: k * 166.3, y: 310.8 * j))
puzzle42.addCurve(to: CGPoint(x: k * 167.2, y: 291.9 * j), controlPoint1: CGPoint(x: k * 168.8, y: 303 * j), controlPoint2: CGPoint(x: k * 171.4, y: 295.7 * j))
puzzle42.addCurve(to: CGPoint(x: k * 161.8, y: 289.3 * j), controlPoint1: CGPoint(x: k * 166.3, y: 291.1 * j), controlPoint2: CGPoint(x: k * 164.4, y: 289.8 * j))
puzzle42.addCurve(to: CGPoint(x: k * 149.9, y: 291.2 * j), controlPoint1: CGPoint(x: k * 156, y: 288.2 * j), controlPoint2: CGPoint(x: k * 152.7, y: 292.6 * j))
puzzle42.addCurve(to: CGPoint(x: k * 150.9, y: 275.7 * j), controlPoint1: CGPoint(x: k * 146.1, y: 289.4 * j), controlPoint2: CGPoint(x: k * 146.3, y: 277.9 * j))
puzzle42.addCurve(to: CGPoint(x: k * 163.5, y: 277.6 * j), controlPoint1: CGPoint(x: k * 154.7, y: 273.9 * j), controlPoint2: CGPoint(x: k * 158.9, y: 279.6 * j))
puzzle42.addCurve(to: CGPoint(x: k * 168.5, y: 268.2 * j), controlPoint1: CGPoint(x: k * 168, y: 275.7 * j), controlPoint2: CGPoint(x: k * 168.4, y: 268.6 * j))
puzzle42.addCurve(to: CGPoint(x: k * 165.6, y: 258.5 * j), controlPoint1: CGPoint(x: k * 168.8, y: 263.3 * j), controlPoint2: CGPoint(x: k * 166.2, y: 259.6 * j))
puzzle42.addCurve(to: CGPoint(x: k * 159.1, y: 232.2 * j), controlPoint1: CGPoint(x: k * 161.6, y: 252.2 * j), controlPoint2: CGPoint(x: k * 159.6, y: 241.9 * j))
puzzle42.addCurve(to: CGPoint(x: k * 155.8, y: 232.9 * j), controlPoint1: CGPoint(x: k * 158, y: 232.2 * j), controlPoint2: CGPoint(x: k * 156.9, y: 232.4 * j))
puzzle42.addCurve(to: CGPoint(x: k * 149.9, y: 240.7 * j), controlPoint1: CGPoint(x: k * 152.7, y: 234.2 * j), controlPoint2: CGPoint(x: k * 150.1, y: 237.3 * j))
puzzle42.addCurve(to: CGPoint(x: k * 153.9, y: 250.1 * j), controlPoint1: CGPoint(x: k * 149.6, y: 245.7 * j), controlPoint2: CGPoint(x: k * 154.8, y: 247.7 * j))
puzzle42.addCurve(to: CGPoint(x: k * 132, y: 249 * j), controlPoint1: CGPoint(x: k * 152.3, y: 254.4 * j), controlPoint2: CGPoint(x: k * 133.6, y: 253.9 * j))
puzzle42.addCurve(to: CGPoint(x: k * 134, y: 241.3 * j), controlPoint1: CGPoint(x: k * 131.3, y: 246.9 * j), controlPoint2: CGPoint(x: k * 134.2, y: 245.4 * j))
puzzle42.addCurve(to: CGPoint(x: k * 130.7, y: 234.4 * j), controlPoint1: CGPoint(x: k * 134, y: 241.3 * j), controlPoint2: CGPoint(x: k * 133.8, y: 237.8 * j))
puzzle42.addCurve(to: CGPoint(x: k * 87.2, y: 234 * j), controlPoint1: CGPoint(x: k * 128.9, y: 232.5 * j), controlPoint2: CGPoint(x: k * 122.6, y: 226.3 * j))
puzzle42.addCurve(to: CGPoint(x: k * 85, y: 254.6 * j), controlPoint1: CGPoint(x: k * 88.7, y: 243.4 * j), controlPoint2: CGPoint(x: k * 88.9, y: 251.4 * j))
puzzle42.addCurve(to: CGPoint(x: k * 80.3, y: 256.6 * j), controlPoint1: CGPoint(x: k * 83.8, y: 255.6 * j), controlPoint2: CGPoint(x: k * 82.2, y: 256 * j))
puzzle42.addCurve(to: CGPoint(x: k * 65.9, y: 257 * j), controlPoint1: CGPoint(x: k * 72.8, y: 258.7 * j), controlPoint2: CGPoint(x: k * 68.6, y: 255 * j))
puzzle42.addCurve(to: CGPoint(x: k * 68.6, y: 271.9 * j), controlPoint1: CGPoint(x: k * 62.2, y: 259.7 * j), controlPoint2: CGPoint(x: k * 64, y: 270.4 * j))
puzzle42.addCurve(to: CGPoint(x: k * 80.8, y: 268.3 * j), controlPoint1: CGPoint(x: k * 72.6, y: 273.2 * j), controlPoint2: CGPoint(x: k * 76.6, y: 266.8 * j))
puzzle42.addCurve(to: CGPoint(x: k * 84.9, y: 276 * j), controlPoint1: CGPoint(x: k * 83.7, y: 269.3 * j), controlPoint2: CGPoint(x: k * 84.5, y: 273.5 * j))
puzzle42.addCurve(to: CGPoint(x: k * 81.1, y: size.height), controlPoint1: CGPoint(x: k * 86.8, y: 288.2 * j), controlPoint2: CGPoint(x: k * 83, y: 299.7 * j))
puzzle42.addLine(to: CGPoint(x: k * 166.3, y: size.height))
puzzle42.close()
puzzle42.miterLimit = 4;

paths.append(puzzle42)


//// XMLID_85_ Drawing
let puzzle41 = UIBezierPath()
puzzle41.move(to: CGPoint(x: k * 81.1, y: size.height))
puzzle41.addCurve(to: CGPoint(x: k * 84.9, y: 276 * j), controlPoint1: CGPoint(x: k * 83, y: 299.8 * j), controlPoint2: CGPoint(x: k * 86.8, y: 288.3 * j))
puzzle41.addCurve(to: CGPoint(x: k * 80.8, y: 268.3 * j), controlPoint1: CGPoint(x: k * 84.5, y: 273.6 * j), controlPoint2: CGPoint(x: k * 83.7, y: 269.4 * j))
puzzle41.addCurve(to: CGPoint(x: k * 68.6, y: 271.9 * j), controlPoint1: CGPoint(x: k * 76.7, y: 266.8 * j), controlPoint2: CGPoint(x: k * 72.6, y: 273.3 * j))
puzzle41.addCurve(to: CGPoint(x: k * 65.9, y: 257 * j), controlPoint1: CGPoint(x: k * 64.1, y: 270.4 * j), controlPoint2: CGPoint(x: k * 62.3, y: 259.7 * j))
puzzle41.addCurve(to: CGPoint(x: k * 80.3, y: 256.6 * j), controlPoint1: CGPoint(x: k * 68.6, y: 255 * j), controlPoint2: CGPoint(x: k * 72.8, y: 258.6 * j))
puzzle41.addCurve(to: CGPoint(x: k * 85, y: 254.6 * j), controlPoint1: CGPoint(x: k * 82.2, y: 256.1 * j), controlPoint2: CGPoint(x: k * 83.7, y: 255.7 * j))
puzzle41.addCurve(to: CGPoint(x: k * 87.2, y: 234 * j), controlPoint1: CGPoint(x: k * 88.9, y: 251.4 * j), controlPoint2: CGPoint(x: k * 88.6, y: 243.4 * j))
puzzle41.addCurve(to: CGPoint(x: k * 79, y: 235.9 * j), controlPoint1: CGPoint(x: k * 84.6, y: 234.6 * j), controlPoint2: CGPoint(x: k * 81.9, y: 235.2 * j))
puzzle41.addCurve(to: CGPoint(x: k * 61, y: 236.3 * j), controlPoint1: CGPoint(x: k * 74.2, y: 237.1 * j), controlPoint2: CGPoint(x: k * 63.8, y: 240 * j))
puzzle41.addCurve(to: CGPoint(x: k * 63.4, y: 220.6 * j), controlPoint1: CGPoint(x: k * 58, y: 232.4 * j), controlPoint2: CGPoint(x: k * 66.4, y: 225.2 * j))
puzzle41.addCurve(to: CGPoint(x: k * 40.2, y: 222.2 * j), controlPoint1: CGPoint(x: k * 59.8, y: 215.1 * j), controlPoint2: CGPoint(x: k * 42.3, y: 216.7 * j))
puzzle41.addCurve(to: CGPoint(x: k * 44.8, y: 235.5 * j), controlPoint1: CGPoint(x: k * 38.5, y: 226.6 * j), controlPoint2: CGPoint(x: k * 47, y: 232.5 * j))
puzzle41.addCurve(to: CGPoint(x: k * 38.9, y: 236.6 * j), controlPoint1: CGPoint(x: k * 43.6, y: 237.2 * j), controlPoint2: CGPoint(x: k * 40, y: 236.7 * j))
puzzle41.addCurve(to: CGPoint(x: k * 0, y: 234.4 * j), controlPoint1: CGPoint(x: k * 32.6, y: 235.8 * j), controlPoint2: CGPoint(x: k * 19.6, y: 235.1 * j))
puzzle41.addLine(to: CGPoint(x: k * 0, y: size.height))
puzzle41.addLine(to: CGPoint(x: k * 81.1, y: size.height))
puzzle41.close()
puzzle41.miterLimit = 4;

paths.append(puzzle41)
//
// MARK: 3th row
//
//// XMLID_81_ Drawing
let puzzle34 = UIBezierPath()
puzzle34.move(to: CGPoint(x: k * 255, y: 181.5 * j))
puzzle34.addCurve(to: CGPoint(x: k * 242.1, y: 186 * j), controlPoint1: CGPoint(x: k * 252.3, y: 183.9 * j), controlPoint2: CGPoint(x: k * 247.2, y: 186.1 * j))
puzzle34.addCurve(to: CGPoint(x: k * 231.5, y: 184.4 * j), controlPoint1: CGPoint(x: k * 236.5, y: 185.9 * j), controlPoint2: CGPoint(x: k * 234, y: 183.1 * j))
puzzle34.addCurve(to: CGPoint(x: k * 231.8, y: 197.1 * j), controlPoint1: CGPoint(x: k * 228.1, y: 186.2 * j), controlPoint2: CGPoint(x: k * 227.9, y: 194.2 * j))
puzzle34.addCurve(to: CGPoint(x: k * 243.2, y: 199.3 * j), controlPoint1: CGPoint(x: k * 234.3, y: 198.9 * j), controlPoint2: CGPoint(x: k * 236.4, y: 197.4 * j))
puzzle34.addCurve(to: CGPoint(x: k * 251, y: 203.2 * j), controlPoint1: CGPoint(x: k * 246.3, y: 200.2 * j), controlPoint2: CGPoint(x: k * 249.1, y: 201 * j))
puzzle34.addCurve(to: CGPoint(x: k * 252.9, y: 210.7 * j), controlPoint1: CGPoint(x: k * 253.2, y: 205.8 * j), controlPoint2: CGPoint(x: k * 253, y: 209.1 * j))
puzzle34.addCurve(to: CGPoint(x: k * 247.9, y: 239.7 * j), controlPoint1: CGPoint(x: k * 252.2, y: 219.5 * j), controlPoint2: CGPoint(x: k * 249.4, y: 230.4 * j))
puzzle34.addCurve(to: CGPoint(x: k * 282, y: 233.7 * j), controlPoint1: CGPoint(x: k * 259.7, y: 240 * j), controlPoint2: CGPoint(x: k * 274, y: 238.3 * j))
puzzle34.addCurve(to: CGPoint(x: k * 292, y: 231 * j), controlPoint1: CGPoint(x: k * 283.1, y: 233.1 * j), controlPoint2: CGPoint(x: k * 287, y: 230.8 * j))
puzzle34.addCurve(to: CGPoint(x: k * 301.7, y: 235.6 * j), controlPoint1: CGPoint(x: k * 292.5, y: 231 * j), controlPoint2: CGPoint(x: k * 299.8, y: 231.5 * j))
puzzle34.addCurve(to: CGPoint(x: k * 299.7, y: 247.2 * j), controlPoint1: CGPoint(x: k * 303.7, y: 239.9 * j), controlPoint2: CGPoint(x: k * 297.9, y: 243.7 * j))
puzzle34.addCurve(to: CGPoint(x: k * 315.7, y: 248.1 * j), controlPoint1: CGPoint(x: k * 301.9, y: 251.5 * j), controlPoint2: CGPoint(x: k * 313.8, y: 251.6 * j))
puzzle34.addCurve(to: CGPoint(x: k * 313.7, y: 237.2 * j), controlPoint1: CGPoint(x: k * 317.1, y: 245.6 * j), controlPoint2: CGPoint(x: k * 312.6, y: 242.5 * j))
puzzle34.addCurve(to: CGPoint(x: k * 316.4, y: 232.2 * j), controlPoint1: CGPoint(x: k * 314.2, y: 234.8 * j), controlPoint2: CGPoint(x: k * 315.6, y: 233 * j))
puzzle34.addCurve(to: CGPoint(x: size.width, y: 234.3 * j), controlPoint1: CGPoint(x: k * 321, y: 227.6 * j), controlPoint2: CGPoint(x: k * 330.7, y: 231.8 * j))
puzzle34.addLine(to: CGPoint(x: size.width, y: 151.8 * j))
puzzle34.addCurve(to: CGPoint(x: k * 294.8, y: 155.9 * j), controlPoint1: CGPoint(x: k * 323.1, y: 153.3 * j), controlPoint2: CGPoint(x: k * 309.4, y: 157.8 * j))
puzzle34.addCurve(to: CGPoint(x: k * 286.5, y: 152.1 * j), controlPoint1: CGPoint(x: k * 292.2, y: 155.6 * j), controlPoint2: CGPoint(x: k * 287.6, y: 154.8 * j))
puzzle34.addCurve(to: CGPoint(x: k * 290.4, y: 140.9 * j), controlPoint1: CGPoint(x: k * 284.9, y: 148.3 * j), controlPoint2: CGPoint(x: k * 291.9, y: 144.6 * j))
puzzle34.addCurve(to: CGPoint(x: k * 274.3, y: 138.5 * j), controlPoint1: CGPoint(x: k * 288.8, y: 136.8 * j), controlPoint2: CGPoint(x: k * 277.2, y: 135.1 * j))
puzzle34.addCurve(to: CGPoint(x: k * 273.8, y: 151.7 * j), controlPoint1: CGPoint(x: k * 272.2, y: 141 * j), controlPoint2: CGPoint(x: k * 276.1, y: 144.8 * j))
puzzle34.addCurve(to: CGPoint(x: k * 271.7, y: 156 * j), controlPoint1: CGPoint(x: k * 273.2, y: 153.4 * j), controlPoint2: CGPoint(x: k * 272.8, y: 154.9 * j))
puzzle34.addCurve(to: CGPoint(x: k * 253.7, y: 158.5 * j), controlPoint1: CGPoint(x: k * 268.8, y: 159.1 * j), controlPoint2: CGPoint(x: k * 262, y: 159.3 * j))
puzzle34.addCurve(to: CGPoint(x: k * 255, y: 181.5 * j), controlPoint1: CGPoint(x: k * 257.2, y: 168.5 * j), controlPoint2: CGPoint(x: k * 260.5, y: 176.5 * j))
puzzle34.close()
puzzle34.miterLimit = 4;

paths.append(puzzle34)


let puzzle33 = UIBezierPath()
puzzle33.move(to: CGPoint(x: k * 214.5, y: 233.2 * j))
puzzle33.addCurve(to: CGPoint(x: k * 213.2, y: 225 * j), controlPoint1: CGPoint(x: k * 215.6, y: 230.7 * j), controlPoint2: CGPoint(x: k * 211.7, y: 228.5 * j))
puzzle33.addCurve(to: CGPoint(x: k * 224.5, y: 220.3 * j), controlPoint1: CGPoint(x: k * 214.6, y: 221.6 * j), controlPoint2: CGPoint(x: k * 219.9, y: 219.5 * j))
puzzle33.addCurve(to: CGPoint(x: k * 232.7, y: 226.9 * j), controlPoint1: CGPoint(x: k * 228.2, y: 220.9 * j), controlPoint2: CGPoint(x: k * 232.2, y: 223.6 * j))
puzzle33.addCurve(to: CGPoint(x: k * 228.7, y: 235.1 * j), controlPoint1: CGPoint(x: k * 233.3, y: 231 * j), controlPoint2: CGPoint(x: k * 228.1, y: 232.8 * j))
puzzle33.addCurve(to: CGPoint(x: k * 248, y: 239.9 * j), controlPoint1: CGPoint(x: k * 229.4, y: 237.9 * j), controlPoint2: CGPoint(x: k * 237.8, y: 239.6 * j))
puzzle33.addCurve(to: CGPoint(x: k * 253, y: 210.9 * j), controlPoint1: CGPoint(x: k * 249.5, y: 230.6 * j), controlPoint2: CGPoint(x: k * 252.3, y: 219.6 * j))
puzzle33.addCurve(to: CGPoint(x: k * 251.1, y: 203.4 * j), controlPoint1: CGPoint(x: k * 253.1, y: 209.3 * j), controlPoint2: CGPoint(x: k * 253.3, y: 206.1 * j))
puzzle33.addCurve(to: CGPoint(x: k * 243.3, y: 199.5 * j), controlPoint1: CGPoint(x: k * 249.2, y: 201.2 * j), controlPoint2: CGPoint(x: k * 246.4, y: 200.3 * j))
puzzle33.addCurve(to: CGPoint(x: k * 231.9, y: 197.3 * j), controlPoint1: CGPoint(x: k * 236.4, y: 197.6 * j), controlPoint2: CGPoint(x: k * 234.3, y: 199.1 * j))
puzzle33.addCurve(to: CGPoint(x: k * 231.6, y: 184.6 * j), controlPoint1: CGPoint(x: k * 228, y: 194.3 * j), controlPoint2: CGPoint(x: k * 228.2, y: 186.4 * j))
puzzle33.addCurve(to: CGPoint(x: k * 242.2, y: 186.2 * j), controlPoint1: CGPoint(x: k * 234.1, y: 183.3 * j), controlPoint2: CGPoint(x: k * 236.6, y: 186 * j))
puzzle33.addCurve(to: CGPoint(x: k * 255.1, y: 181.7 * j), controlPoint1: CGPoint(x: k * 247.3, y: 186.3 * j), controlPoint2: CGPoint(x: k * 252.4, y: 184.2 * j))
puzzle33.addCurve(to: CGPoint(x: k * 254, y: 158.8 * j), controlPoint1: CGPoint(x: k * 260.6, y: 176.7 * j), controlPoint2: CGPoint(x: k * 257.3, y: 168.7 * j))
puzzle33.addCurve(to: CGPoint(x: k * 217, y: 153.8 * j), controlPoint1: CGPoint(x: k * 242.6, y: 157.7 * j), controlPoint2: CGPoint(x: k * 228.3, y: 154.5 * j))
puzzle33.addCurve(to: CGPoint(x: k * 208.4, y: 155.5 * j), controlPoint1: CGPoint(x: k * 215.2, y: 153.7 * j), controlPoint2: CGPoint(x: k * 211.4, y: 153.5 * j))
puzzle33.addCurve(to: CGPoint(x: k * 203.9, y: 162.6 * j), controlPoint1: CGPoint(x: k * 205.8, y: 157.2 * j), controlPoint2: CGPoint(x: k * 204.9, y: 159.8 * j))
puzzle33.addCurve(to: CGPoint(x: k * 201.3, y: 173.1 * j), controlPoint1: CGPoint(x: k * 201.7, y: 168.9 * j), controlPoint2: CGPoint(x: k * 203.5, y: 170.8 * j))
puzzle33.addCurve(to: CGPoint(x: k * 186.7, y: 173.4 * j), controlPoint1: CGPoint(x: k * 197.9, y: 176.7 * j), controlPoint2: CGPoint(x: k * 188.8, y: 176.5 * j))
puzzle33.addCurve(to: CGPoint(x: k * 188.5, y: 163.7 * j), controlPoint1: CGPoint(x: k * 185.2, y: 171.1 * j), controlPoint2: CGPoint(x: k * 188.4, y: 168.8 * j))
puzzle33.addCurve(to: CGPoint(x: k * 183.4, y: 151.9 * j), controlPoint1: CGPoint(x: k * 188.6, y: 159.1 * j), controlPoint2: CGPoint(x: k * 186.2, y: 154.3 * j))
puzzle33.addCurve(to: CGPoint(x: k * 164.1, y: 151 * j), controlPoint1: CGPoint(x: k * 178.9, y: 147.9 * j), controlPoint2: CGPoint(x: k * 172.3, y: 149 * j))
puzzle33.addCurve(to: CGPoint(x: k * 166.2, y: 193.5 * j), controlPoint1: CGPoint(x: k * 159.5, y: 166.9 * j), controlPoint2: CGPoint(x: k * 160, y: 191.1 * j))
puzzle33.addCurve(to: CGPoint(x: k * 175.1, y: 192.2 * j), controlPoint1: CGPoint(x: k * 168.9, y: 194.5 * j), controlPoint2: CGPoint(x: k * 171.3, y: 190.8 * j))
puzzle33.addCurve(to: CGPoint(x: k * 180.2, y: 203.1 * j), controlPoint1: CGPoint(x: k * 178.8, y: 193.6 * j), controlPoint2: CGPoint(x: k * 181.1, y: 198.7 * j))
puzzle33.addCurve(to: CGPoint(x: k * 173, y: 211 * j), controlPoint1: CGPoint(x: k * 179.5, y: 206.6 * j), controlPoint2: CGPoint(x: k * 176.7, y: 210.5 * j))
puzzle33.addCurve(to: CGPoint(x: k * 164.1, y: 207.1 * j), controlPoint1: CGPoint(x: k * 168.6, y: 211.6 * j), controlPoint2: CGPoint(x: k * 166.6, y: 206.5 * j))
puzzle33.addCurve(to: CGPoint(x: k * 159, y: 232.3 * j), controlPoint1: CGPoint(x: k * 160.5, y: 208 * j), controlPoint2: CGPoint(x: k * 158.4, y: 219.7 * j))
puzzle33.addCurve(to: CGPoint(x: k * 165.1, y: 233.5 * j), controlPoint1: CGPoint(x: k * 161.8, y: 232.2 * j), controlPoint2: CGPoint(x: k * 164.3, y: 233.2 * j))
puzzle33.addCurve(to: CGPoint(x: k * 214.5, y: 233.2 * j), controlPoint1: CGPoint(x: k * 181, y: 239.4 * j), controlPoint2: CGPoint(x: k * 211.8, y: 239.6 * j))
puzzle33.close()
puzzle33.miterLimit = 4;

paths.append(puzzle33)


//// XMLID_53_ Drawing
let puzzle32 = UIBezierPath()
puzzle32.move(to: CGPoint(x: k * 130.7, y: 234.6 * j))
puzzle32.addCurve(to: CGPoint(x: k * 134, y: 241.5 * j), controlPoint1: CGPoint(x: k * 133.8, y: 237.9 * j), controlPoint2: CGPoint(x: k * 134, y: 241.5 * j))
puzzle32.addCurve(to: CGPoint(x: k * 132, y: 249.2 * j), controlPoint1: CGPoint(x: k * 134.2, y: 245.5 * j), controlPoint2: CGPoint(x: k * 131.3, y: 247.1 * j))
puzzle32.addCurve(to: CGPoint(x: k * 153.9, y: 250.3 * j), controlPoint1: CGPoint(x: k * 133.6, y: 254.1 * j), controlPoint2: CGPoint(x: k * 152.3, y: 254.6 * j))
puzzle32.addCurve(to: CGPoint(x: k * 149.9, y: 240.9 * j), controlPoint1: CGPoint(x: k * 154.8, y: 247.9 * j), controlPoint2: CGPoint(x: k * 149.6, y: 245.9 * j))
puzzle32.addCurve(to: CGPoint(x: k * 155.8, y: 233.1 * j), controlPoint1: CGPoint(x: k * 150.1, y: 237.5 * j), controlPoint2: CGPoint(x: k * 152.7, y: 234.4 * j))
puzzle32.addCurve(to: CGPoint(x: k * 159.1, y: 232.4 * j), controlPoint1: CGPoint(x: k * 156.9, y: 232.6 * j), controlPoint2: CGPoint(x: k * 158, y: 232.5 * j))
puzzle32.addCurve(to: CGPoint(x: k * 164.2, y: 207.2 * j), controlPoint1: CGPoint(x: k * 158.5, y: 219.8 * j), controlPoint2: CGPoint(x: k * 160.5, y: 208 * j))
puzzle32.addCurve(to: CGPoint(x: k * 173.1, y: 211.1 * j), controlPoint1: CGPoint(x: k * 166.7, y: 206.6 * j), controlPoint2: CGPoint(x: k * 168.7, y: 211.6 * j))
puzzle32.addCurve(to: CGPoint(x: k * 180.3, y: 203.2 * j), controlPoint1: CGPoint(x: k * 176.7, y: 210.6 * j), controlPoint2: CGPoint(x: k * 179.6, y: 206.7 * j))
puzzle32.addCurve(to: CGPoint(x: k * 175.2, y: 192.3 * j), controlPoint1: CGPoint(x: k * 181.2, y: 198.8 * j), controlPoint2: CGPoint(x: k * 178.9, y: 193.6 * j))
puzzle32.addCurve(to: CGPoint(x: k * 166.3, y: 193.6 * j), controlPoint1: CGPoint(x: k * 171.4, y: 190.9 * j), controlPoint2: CGPoint(x: k * 169, y: 194.6 * j))
puzzle32.addCurve(to: CGPoint(x: k * 164.2, y: 151.1 * j), controlPoint1: CGPoint(x: k * 160.1, y: 191.2 * j), controlPoint2: CGPoint(x: k * 159.6, y: 167.1 * j))
puzzle32.addCurve(to: CGPoint(x: k * 128.1, y: 155.9 * j), controlPoint1: CGPoint(x: k * 154.1, y: 153.6 * j), controlPoint2: CGPoint(x: k * 141.8, y: 157.8 * j))
puzzle32.addCurve(to: CGPoint(x: k * 117.2, y: 157.4 * j), controlPoint1: CGPoint(x: k * 125.8, y: 155.6 * j), controlPoint2: CGPoint(x: k * 120.1, y: 154.6 * j))
puzzle32.addCurve(to: CGPoint(x: k * 114.2, y: 168.7 * j), controlPoint1: CGPoint(x: k * 113.8, y: 160.6 * j), controlPoint2: CGPoint(x: k * 117.5, y: 165.9 * j))
puzzle32.addCurve(to: CGPoint(x: k * 102, y: 167.2 * j), controlPoint1: CGPoint(x: k * 111.2, y: 171.2 * j), controlPoint2: CGPoint(x: k * 104, y: 170.3 * j))
puzzle32.addCurve(to: CGPoint(x: k * 104.6, y: 156.3 * j), controlPoint1: CGPoint(x: k * 99.7, y: 163.7 * j), controlPoint2: CGPoint(x: k * 106, y: 159.9 * j))
puzzle32.addCurve(to: CGPoint(x: k * 79.4, y: 154.6 * j), controlPoint1: CGPoint(x: k * 103, y: 152.3 * j), controlPoint2: CGPoint(x: k * 94.1, y: 153.9 * j))
puzzle32.addCurve(to: CGPoint(x: k * 80.2, y: 173 * j), controlPoint1: CGPoint(x: k * 77.1, y: 162.4 * j), controlPoint2: CGPoint(x: k * 75.8, y: 168.7 * j))
puzzle32.addCurve(to: CGPoint(x: k * 93.1, y: 177.7 * j), controlPoint1: CGPoint(x: k * 82.9, y: 175.6 * j), controlPoint2: CGPoint(x: k * 88, y: 177.9 * j))
puzzle32.addCurve(to: CGPoint(x: k * 103.7, y: 176 * j), controlPoint1: CGPoint(x: k * 98.7, y: 177.6 * j), controlPoint2: CGPoint(x: k * 101.2, y: 174.6 * j))
puzzle32.addCurve(to: CGPoint(x: k * 103.4, y: 189.5 * j), controlPoint1: CGPoint(x: k * 107.1, y: 178 * j), controlPoint2: CGPoint(x: k * 107.3, y: 186.4 * j))
puzzle32.addCurve(to: CGPoint(x: k * 92, y: 191.9 * j), controlPoint1: CGPoint(x: k * 101, y: 191.5 * j), controlPoint2: CGPoint(x: k * 98.8, y: 189.8 * j))
puzzle32.addCurve(to: CGPoint(x: k * 84.2, y: 196.1 * j), controlPoint1: CGPoint(x: k * 88.9, y: 192.8 * j), controlPoint2: CGPoint(x: k * 86.1, y: 193.7 * j))
puzzle32.addCurve(to: CGPoint(x: k * 82.3, y: 204.1 * j), controlPoint1: CGPoint(x: k * 82, y: 198.9 * j), controlPoint2: CGPoint(x: k * 82.2, y: 202.4 * j))
puzzle32.addCurve(to: CGPoint(x: k * 87.3, y: 234.4 * j), controlPoint1: CGPoint(x: k * 83, y: 213.2 * j), controlPoint2: CGPoint(x: k * 85.8, y: 224.6 * j))
puzzle32.addCurve(to: CGPoint(x: k * 130.7, y: 234.6 * j), controlPoint1: CGPoint(x: k * 122.6, y: 226.5 * j), controlPoint2: CGPoint(x: k * 129, y: 232.7 * j))
puzzle32.close()
puzzle32.miterLimit = 4;

paths.append(puzzle32)


// XMLID_118_ Drawing
let puzzle31 = UIBezierPath()
puzzle31.move(to: CGPoint(x: k * 44.8, y: 235.6 * j))
puzzle31.addCurve(to: CGPoint(x: k * 40.2, y: 222.3 * j), controlPoint1: CGPoint(x: k * 47, y: 232.6 * j), controlPoint2: CGPoint(x: k * 38.5, y: 226.7 * j))
puzzle31.addCurve(to: CGPoint(x: k * 63.4, y: 220.7 * j), controlPoint1: CGPoint(x: k * 42.3, y: 216.8 * j), controlPoint2: CGPoint(x: k * 59.8, y: 215.1 * j))
puzzle31.addCurve(to: CGPoint(x: k * 61, y: 236.4 * j), controlPoint1: CGPoint(x: k * 66.4, y: 225.3 * j), controlPoint2: CGPoint(x: k * 58, y: 232.6 * j))
puzzle31.addCurve(to: CGPoint(x: k * 79, y: 236 * j), controlPoint1: CGPoint(x: k * 63.8, y: 240.1 * j), controlPoint2: CGPoint(x: k * 74.2, y: 237.2 * j))
puzzle31.addCurve(to: CGPoint(x: k * 87.2, y: 234.1 * j), controlPoint1: CGPoint(x: k * 81.9, y: 235.3 * j), controlPoint2: CGPoint(x: k * 84.6, y: 234.7 * j))
puzzle31.addCurve(to: CGPoint(x: k * 82.2, y: 203.8 * j), controlPoint1: CGPoint(x: k * 85.7, y: 224.3 * j), controlPoint2: CGPoint(x: k * 82.9, y: 212.9 * j))
puzzle31.addCurve(to: CGPoint(x: k * 84.1, y: 195.8 * j), controlPoint1: CGPoint(x: k * 82.1, y: 202.2 * j), controlPoint2: CGPoint(x: k * 81.9, y: 198.7 * j))
puzzle31.addCurve(to: CGPoint(x: k * 91.9, y: 191.6 * j), controlPoint1: CGPoint(x: k * 86, y: 193.4 * j), controlPoint2: CGPoint(x: k * 88.8, y: 192.5 * j))
puzzle31.addCurve(to: CGPoint(x: k * 103.3, y: 189.2 * j), controlPoint1: CGPoint(x: k * 98.7, y: 189.5 * j), controlPoint2: CGPoint(x: k * 100.9, y: 191.2 * j))
puzzle31.addCurve(to: CGPoint(x: k * 103.6, y: 175.7 * j), controlPoint1: CGPoint(x: k * 107.2, y: 186.1 * j), controlPoint2: CGPoint(x: k * 107, y: 177.6 * j))
puzzle31.addCurve(to: CGPoint(x: k * 93, y: 177.4 * j), controlPoint1: CGPoint(x: k * 101.1, y: 174.3 * j), controlPoint2: CGPoint(x: k * 98.6, y: 177.2 * j))
puzzle31.addCurve(to: CGPoint(x: k * 80.1, y: 172.7 * j), controlPoint1: CGPoint(x: k * 87.9, y: 177.5 * j), controlPoint2: CGPoint(x: k * 82.8, y: 175.3 * j))
puzzle31.addCurve(to: CGPoint(x: k * 79.3, y: 154.3 * j), controlPoint1: CGPoint(x: k * 75.7, y: 168.4 * j), controlPoint2: CGPoint(x: k * 77, y: 162.1 * j))
puzzle31.addCurve(to: CGPoint(x: k * 51.3, y: 153.8 * j), controlPoint1: CGPoint(x: k * 71.5, y: 154.7 * j), controlPoint2: CGPoint(x: k * 62.2, y: 154.8 * j))
puzzle31.addCurve(to: CGPoint(x: k * 32, y: 155.8 * j), controlPoint1: CGPoint(x: k * 46.7, y: 153.4 * j), controlPoint2: CGPoint(x: k * 33.8, y: 152 * j))
puzzle31.addCurve(to: CGPoint(x: k * 32.5, y: 163.2 * j), controlPoint1: CGPoint(x: k * 31.3, y: 157.4 * j), controlPoint2: CGPoint(x: k * 32.8, y: 158.9 * j))
puzzle31.addCurve(to: CGPoint(x: k * 30.5, y: 169 * j), controlPoint1: CGPoint(x: k * 32.3, y: 165.5 * j), controlPoint2: CGPoint(x: k * 32.1, y: 167.6 * j))
puzzle31.addCurve(to: CGPoint(x: k * 15.9, y: 166 * j), controlPoint1: CGPoint(x: k * 26.9, y: 172.1 * j), controlPoint2: CGPoint(x: k * 17.2, y: 169.9 * j))
puzzle31.addCurve(to: CGPoint(x: k * 20.1, y: 156.2 * j), controlPoint1: CGPoint(x: k * 14.6, y: 162.4 * j), controlPoint2: CGPoint(x: k * 21.3, y: 159.2 * j))
puzzle31.addCurve(to: CGPoint(x: k * 3.4, y: 153.4 * j), controlPoint1: CGPoint(x: k * 18.6, y: 152.4 * j), controlPoint2: CGPoint(x: k * 6.2, y: 153.2 * j))
puzzle31.addCurve(to: CGPoint(x: k * 0, y: 153.5 * j), controlPoint1: CGPoint(x: k * 2.6, y: 153.4 * j), controlPoint2: CGPoint(x: k * 1.9, y: 153.5 * j))
puzzle31.addLine(to: CGPoint(x: k * 0, y: 234.4 * j))
puzzle31.addCurve(to: CGPoint(x: k * 38.9, y: 236.6 * j), controlPoint1: CGPoint(x: k * 19.6, y: 235.1 * j), controlPoint2: CGPoint(x: k * 32.6, y: 235.8 * j))
puzzle31.addCurve(to: CGPoint(x: k * 44.8, y: 235.6 * j), controlPoint1: CGPoint(x: k * 40, y: 236.8 * j), controlPoint2: CGPoint(x: k * 43.6, y: 237.3 * j))
puzzle31.close()
puzzle31.miterLimit = 4;

paths.append(puzzle31)


// MARK: 2nd row
    
    

let puzzle24 = UIBezierPath()
puzzle24.move(to: CGPoint(x: k * 250.3, y: 112.8 * j))
puzzle24.addCurve(to: CGPoint(x: k * 238.4, y: 110.6 * j), controlPoint1: CGPoint(x: k * 246.4, y: 114.1 * j), controlPoint2: CGPoint(x: k * 242.2, y: 108.6 * j))
puzzle24.addCurve(to: CGPoint(x: k * 236.8, y: 121.2 * j), controlPoint1: CGPoint(x: k * 235.1, y: 112.3 * j), controlPoint2: CGPoint(x: k * 234.1, y: 118.6 * j))
puzzle24.addCurve(to: CGPoint(x: k * 249.1, y: 123.8 * j), controlPoint1: CGPoint(x: k * 239.8, y: 124.1 * j), controlPoint2: CGPoint(x: k * 245.6, y: 120.9 * j))
puzzle24.addCurve(to: CGPoint(x: k * 250.7, y: 133.3 * j), controlPoint1: CGPoint(x: k * 252.1, y: 126.3 * j), controlPoint2: CGPoint(x: k * 251.1, y: 131.3 * j))
puzzle24.addCurve(to: CGPoint(x: k * 254, y: 158.6 * j), controlPoint1: CGPoint(x: k * 249.1, y: 142.6 * j), controlPoint2: CGPoint(x: k * 251.5, y: 151.2 * j))
puzzle24.addCurve(to: CGPoint(x: k * 272, y: 156.1 * j), controlPoint1: CGPoint(x: k * 262.3, y: 159.4 * j), controlPoint2: CGPoint(x: k * 269.1, y: 159.2 * j))
puzzle24.addCurve(to: CGPoint(x: k * 274.1, y: 151.8 * j), controlPoint1: CGPoint(x: k * 273.1, y: 155 * j), controlPoint2: CGPoint(x: k * 273.6, y: 153.5 * j))
puzzle24.addCurve(to: CGPoint(x: k * 274.6, y: 138.6 * j), controlPoint1: CGPoint(x: k * 276.3, y: 144.9 * j), controlPoint2: CGPoint(x: k * 272.4, y: 141.1 * j))
puzzle24.addCurve(to: CGPoint(x: k * 290.7, y: 141 * j), controlPoint1: CGPoint(x: k * 277.5, y: 135.2 * j), controlPoint2: CGPoint(x: k * 289.1, y: 136.9 * j))
puzzle24.addCurve(to: CGPoint(x: k * 286.8, y: 152.2 * j), controlPoint1: CGPoint(x: k * 292.1, y: 144.6 * j), controlPoint2: CGPoint(x: k * 285.2, y: 148.4 * j))
puzzle24.addCurve(to: CGPoint(x: k * 295.1, y: 156 * j), controlPoint1: CGPoint(x: k * 287.9, y: 154.8 * j), controlPoint2: CGPoint(x: k * 292.5, y: 155.6 * j))
puzzle24.addCurve(to: CGPoint(x: size.width, y: 151.9 * j), controlPoint1: CGPoint(x: k * 309.8, y: 157.9 * j), controlPoint2: CGPoint(x: k * 323.4, y: 153.4 * j))
puzzle24.addLine (to: CGPoint(x: size.width, y: 77.2 * j))
puzzle24.addCurve(to: CGPoint(x: k * 311.1, y: 79 * j), controlPoint1: CGPoint(x: k * 325.6, y: 79.7 * j), controlPoint2: CGPoint(x: k * 315.9, y: 83.4 * j))
puzzle24.addCurve(to: CGPoint(x: k * 308.2, y: 74 * j), controlPoint1: CGPoint(x: k * 310.3, y: 78.2 * j), controlPoint2: CGPoint(x: k * 308.7, y: 76.4 * j))
puzzle24.addCurve(to: CGPoint(x: k * 310.3, y: 63.1 * j), controlPoint1: CGPoint(x: k * 307, y: 68.7 * j), controlPoint2: CGPoint(x: k * 311.8, y: 65.6 * j))
puzzle24.addCurve(to: CGPoint(x: k * 293.3, y: 64 * j), controlPoint1: CGPoint(x: k * 308.3, y: 59.6 * j), controlPoint2: CGPoint(x: k * 295.7, y: 59.8 * j))
puzzle24.addCurve(to: CGPoint(x: k * 295.4, y: 75.6 * j), controlPoint1: CGPoint(x: k * 291.4, y: 67.5 * j), controlPoint2: CGPoint(x: k * 297.6, y: 71.3 * j))
puzzle24.addCurve(to: CGPoint(x: k * 285.1, y: 80.2 * j), controlPoint1: CGPoint(x: k * 293.3, y: 79.7 * j), controlPoint2: CGPoint(x: k * 285.5, y: 80.2 * j))
puzzle24.addCurve(to: CGPoint(x: k * 274.5, y: 77.5 * j), controlPoint1: CGPoint(x: k * 279.7, y: 80.4 * j), controlPoint2: CGPoint(x: k * 275.6, y: 78.1 * j))
puzzle24.addCurve(to: CGPoint(x: k * 252.1, y: 72 * j), controlPoint1: CGPoint(x: k * 269, y: 74.6 * j), controlPoint2: CGPoint(x: k * 260.6, y: 72.8 * j))
puzzle24.addCurve(to: CGPoint(x: k * 250.3, y: 112.8 * j), controlPoint1: CGPoint(x: k * 250.4, y: 96.1 * j), controlPoint2: CGPoint(x: k * 256.4, y: 110.8 * j))
puzzle24.close()
puzzle24.miterLimit = 4;

paths.append(puzzle24)



let puzzle23 = UIBezierPath()
puzzle23.move(to: CGPoint(x: k * 164.7, y: 112.5 * j))
puzzle23.addCurve(to: CGPoint(x: k * 157.2, y: 115.7 * j), controlPoint1: CGPoint(x: k * 161.1, y: 115.5 * j), controlPoint2: CGPoint(x: k * 157.2, y: 115.7 * j))
puzzle23.addCurve(to: CGPoint(x: k * 148.8, y: 113.8 * j), controlPoint1: CGPoint(x: k * 152.8, y: 115.9 * j), controlPoint2: CGPoint(x: k * 151.1, y: 113.1 * j))
puzzle23.addCurve(to: CGPoint(x: k * 147.7, y: 135 * j), controlPoint1: CGPoint(x: k * 143.5, y: 115.4 * j), controlPoint2: CGPoint(x: k * 142.9, y: 133.4 * j))
puzzle23.addCurve(to: CGPoint(x: k * 158, y: 131.1 * j), controlPoint1: CGPoint(x: k * 150.4, y: 135.9 * j), controlPoint2: CGPoint(x: k * 152.5, y: 130.8 * j))
puzzle23.addCurve(to: CGPoint(x: k * 166.5, y: 136.8 * j), controlPoint1: CGPoint(x: k * 161.7, y: 131.3 * j), controlPoint2: CGPoint(x: k * 165.1, y: 133.8 * j))
puzzle23.addCurve(to: CGPoint(x: k * 165.9, y: 145.9 * j), controlPoint1: CGPoint(x: k * 168.3, y: 140.6 * j), controlPoint2: CGPoint(x: k * 166.4, y: 144.8 * j))
puzzle23.addCurve(to: CGPoint(x: k * 164.2, y: 151 * j), controlPoint1: CGPoint(x: k * 165.2, y: 147.5 * j), controlPoint2: CGPoint(x: k * 164.7, y: 149.2 * j))
puzzle23.addCurve(to: CGPoint(x: k * 183.5, y: 151.9 * j), controlPoint1: CGPoint(x: k * 172.3, y: 148.9 * j), controlPoint2: CGPoint(x: k * 178.9, y: 147.9 * j))
puzzle23.addCurve(to: CGPoint(x: k * 188.6, y: 163.7 * j), controlPoint1: CGPoint(x: k * 186.3, y: 154.3 * j), controlPoint2: CGPoint(x: k * 188.8, y: 159.1 * j))
puzzle23.addCurve(to: CGPoint(x: k * 186.8, y: 173.4 * j), controlPoint1: CGPoint(x: k * 188.5, y: 168.8 * j), controlPoint2: CGPoint(x: k * 185.3, y: 171.1 * j))
puzzle23.addCurve(to: CGPoint(x: k * 201.4, y: 173.1 * j), controlPoint1: CGPoint(x: k * 188.9, y: 176.5 * j), controlPoint2: CGPoint(x: k * 198, y: 176.7 * j))
puzzle23.addCurve(to: CGPoint(x: k * 204, y: 162.6 * j), controlPoint1: CGPoint(x: k * 203.5, y: 170.9 * j), controlPoint2: CGPoint(x: k * 201.7, y: 168.9 * j))
puzzle23.addCurve(to: CGPoint(x: k * 208.5, y: 155.5 * j), controlPoint1: CGPoint(x: k * 205, y: 159.8 * j), controlPoint2: CGPoint(x: k * 206, y: 157.2 * j))
puzzle23.addCurve(to: CGPoint(x: k * 217.1, y: 153.8 * j), controlPoint1: CGPoint(x: k * 211.5, y: 153.4 * j), controlPoint2: CGPoint(x: k * 215.3, y: 153.6 * j))
puzzle23.addCurve(to: CGPoint(x: k * 254.1, y: 158.8 * j), controlPoint1: CGPoint(x: k * 228.3, y: 154.5 * j), controlPoint2: CGPoint(x: k * 242.6, y: 157.7 * j))
puzzle23.addCurve(to: CGPoint(x: k * 250.8, y: 133.5 * j), controlPoint1: CGPoint(x: k * 251.7, y: 151.3 * j), controlPoint2: CGPoint(x: k * 249.3, y: 142.7 * j))
puzzle23.addCurve(to: CGPoint(x: k * 249.2, y: 124 * j), controlPoint1: CGPoint(x: k * 251.1, y: 131.5 * j), controlPoint2: CGPoint(x: k * 252.2, y: 126.5 * j))
puzzle23.addCurve(to: CGPoint(x: k * 236.9, y: 121.4 * j), controlPoint1: CGPoint(x: k * 245.7, y: 121.1 * j), controlPoint2: CGPoint(x: k * 239.9, y: 124.3 * j))
puzzle23.addCurve(to: CGPoint(x: k * 238.5, y: 110.8 * j), controlPoint1: CGPoint(x: k * 234.2, y: 118.8 * j), controlPoint2: CGPoint(x: k * 235.2, y: 112.5 * j))
puzzle23.addCurve(to: CGPoint(x: k * 250.4, y: 113 * j), controlPoint1: CGPoint(x: k * 242.3, y: 108.8 * j), controlPoint2: CGPoint(x: k * 246.4, y: 114.3 * j))
puzzle23.addCurve(to: CGPoint(x: k * 252.2, y: 72.2 * j), controlPoint1: CGPoint(x: k * 256.5, y: 111 * j), controlPoint2: CGPoint(x: k * 250.5, y: 96.2 * j))
puzzle23.addCurve(to: CGPoint(x: k * 217.9, y: 76.5 * j), controlPoint1: CGPoint(x: k * 236.1, y: 70.7 * j), controlPoint2: CGPoint(x: k * 219, y: 72.6 * j))
puzzle23.addCurve(to: CGPoint(x: k * 222.2, y: 84.7 * j), controlPoint1: CGPoint(x: k * 217.2, y: 78.8 * j), controlPoint2: CGPoint(x: k * 222.8, y: 80.6 * j))
puzzle23.addCurve(to: CGPoint(x: k * 213.5, y: 91.3 * j), controlPoint1: CGPoint(x: k * 221.7, y: 88 * j), controlPoint2: CGPoint(x: k * 217.4, y: 90.7 * j))
puzzle23.addCurve(to: CGPoint(x: k * 201.5, y: 86.6 * j), controlPoint1: CGPoint(x: k * 208.6, y: 92.1 * j), controlPoint2: CGPoint(x: k * 203, y: 90 * j))
puzzle23.addCurve(to: CGPoint(x: k * 202.9, y: 78.4 * j), controlPoint1: CGPoint(x: k * 199.9, y: 83.1 * j), controlPoint2: CGPoint(x: k * 204, y: 80.9 * j))
puzzle23.addCurve(to: CGPoint(x: k * 166.2, y: 74.7 * j), controlPoint1: CGPoint(x: k * 200.8, y: 73.7 * j), controlPoint2: CGPoint(x: k * 182.4, y: 72.6 * j))
puzzle23.addCurve(to: CGPoint(x: k * 164.7, y: 112.5 * j), controlPoint1: CGPoint(x: k * 172.9, y: 105.1 * j), controlPoint2: CGPoint(x: k * 166.6, y: 110.8 * j))
puzzle23.close()
puzzle23.miterLimit = 4;

paths.append(puzzle23)



let puzzle22 = UIBezierPath()
puzzle22.move(to: CGPoint(x: k * 104.6, y: 156 * j))
puzzle22.addCurve(to: CGPoint(x: k * 102, y: 166.9 * j), controlPoint1: CGPoint(x: k * 106.1, y: 159.6 * j), controlPoint2: CGPoint(x: k * 99.8, y: 163.4 * j))
puzzle22.addCurve(to: CGPoint(x: k * 114.2, y: 168.4 * j), controlPoint1: CGPoint(x: k * 104, y: 170 * j), controlPoint2: CGPoint(x: k * 111.2, y: 170.9 * j))
puzzle22.addCurve(to: CGPoint(x: k * 117.2, y: 157.1 * j), controlPoint1: CGPoint(x: k * 117.5, y: 165.6 * j), controlPoint2: CGPoint(x: k * 113.8, y: 160.3 * j))
puzzle22.addCurve(to: CGPoint(x: k * 128.1, y: 155.6 * j), controlPoint1: CGPoint(x: k * 120.1, y: 154.4 * j), controlPoint2: CGPoint(x: k * 125.8, y: 155.3 * j))
puzzle22.addCurve(to: CGPoint(x: k * 164.2, y: 150.8 * j), controlPoint1: CGPoint(x: k * 141.7, y: 157.5 * j), controlPoint2: CGPoint(x: k * 154.1, y: 153.4 * j))
puzzle22.addCurve(to: CGPoint(x: k * 165.9, y: 145.7 * j), controlPoint1: CGPoint(x: k * 164.7, y: 149 * j), controlPoint2: CGPoint(x: k * 165.3, y: 147.3 * j))
puzzle22.addCurve(to: CGPoint(x: k * 166.5, y: 136.6 * j), controlPoint1: CGPoint(x: k * 166.4, y: 144.6 * j), controlPoint2: CGPoint(x: k * 168.3, y: 140.4 * j))
puzzle22.addCurve(to: CGPoint(x: k * 158, y: 130.9 * j), controlPoint1: CGPoint(x: k * 165.1, y: 133.7 * j), controlPoint2: CGPoint(x: k * 161.6, y: 131.1 * j))
puzzle22.addCurve(to: CGPoint(x: k * 147.7, y: 134.8 * j), controlPoint1: CGPoint(x: k * 152.6, y: 130.6 * j), controlPoint2: CGPoint(x: k * 150.4, y: 135.7 * j))
puzzle22.addCurve(to: CGPoint(x: k * 148.8, y: 113.6 * j), controlPoint1: CGPoint(x: k * 143, y: 133.2 * j), controlPoint2: CGPoint(x: k * 143.5, y: 115.2 * j))
puzzle22.addCurve(to: CGPoint(x: k * 157.2, y: 115.5 * j), controlPoint1: CGPoint(x: k * 151.1, y: 112.9 * j), controlPoint2: CGPoint(x: k * 152.8, y: 115.7 * j))
puzzle22.addCurve(to: CGPoint(x: k * 164.7, y: 112.3 * j), controlPoint1: CGPoint(x: k * 157.2, y: 115.5 * j), controlPoint2: CGPoint(x: k * 161, y: 115.3 * j))
puzzle22.addCurve(to: CGPoint(x: k * 166, y: 74.3 * j), controlPoint1: CGPoint(x: k * 166.7, y: 110.7 * j), controlPoint2: CGPoint(x: k * 172.9, y: 104.9 * j))
puzzle22.addCurve(to: CGPoint(x: k * 150.4, y: 77.7 * j), controlPoint1: CGPoint(x: k * 160.3, y: 75 * j), controlPoint2: CGPoint(x: k * 154.8, y: 76.2 * j))
puzzle22.addCurve(to: CGPoint(x: k * 140.4, y: 78.2 * j), controlPoint1: CGPoint(x: k * 149.2, y: 78.1 * j), controlPoint2: CGPoint(x: k * 144.6, y: 79.9 * j))
puzzle22.addCurve(to: CGPoint(x: k * 134.2, y: 70.4 * j), controlPoint1: CGPoint(x: k * 137.2, y: 76.9 * j), controlPoint2: CGPoint(x: k * 134.4, y: 73.8 * j))
puzzle22.addCurve(to: CGPoint(x: k * 138.5, y: 61 * j), controlPoint1: CGPoint(x: k * 133.9, y: 65.4 * j), controlPoint2: CGPoint(x: k * 139.4, y: 63.4 * j))
puzzle22.addCurve(to: CGPoint(x: k * 115.2, y: 62.1 * j), controlPoint1: CGPoint(x: k * 136.8, y: 56.7 * j), controlPoint2: CGPoint(x: k * 116.9, y: 57.2 * j))
puzzle22.addCurve(to: CGPoint(x: k * 117.3, y: 69.8 * j), controlPoint1: CGPoint(x: k * 114.5, y: 64.2 * j), controlPoint2: CGPoint(x: k * 117.5, y: 65.7 * j))
puzzle22.addCurve(to: CGPoint(x: k * 113.8, y: 76.7 * j), controlPoint1: CGPoint(x: k * 117.3, y: 69.8 * j), controlPoint2: CGPoint(x: k * 117.1, y: 73.3 * j))
puzzle22.addCurve(to: CGPoint(x: k * 82.7, y: 79.7 * j), controlPoint1: CGPoint(x: k * 112.2, y: 78.3 * j), controlPoint2: CGPoint(x: k * 107.1, y: 83 * j))
puzzle22.addCurve(to: CGPoint(x: k * 84.8, y: 99.6 * j), controlPoint1: CGPoint(x: k * 81.9, y: 91.3 * j), controlPoint2: CGPoint(x: k * 80.8, y: 98.3 * j))
puzzle22.addCurve(to: CGPoint(x: k * 96.7, y: 97.2 * j), controlPoint1: CGPoint(x: k * 88.7, y: 101 * j), controlPoint2: CGPoint(x: k * 92.8, y: 95.1 * j))
puzzle22.addCurve(to: CGPoint(x: k * 98.3, y: 108.5 * j), controlPoint1: CGPoint(x: k * 100, y: 99 * j), controlPoint2: CGPoint(x: k * 101.1, y: 105.7 * j))
puzzle22.addCurve(to: CGPoint(x: k * 86, y: 111.3 * j), controlPoint1: CGPoint(x: k * 95.3, y: 111.6 * j), controlPoint2: CGPoint(x: k * 89.5, y: 108.2 * j))
puzzle22.addCurve(to: CGPoint(x: k * 84.4, y: 121.3 * j), controlPoint1: CGPoint(x: k * 83, y: 114 * j), controlPoint2: CGPoint(x: k * 84.1, y: 119.2 * j))
puzzle22.addCurve(to: CGPoint(x: k * 79.4, y: 154.1 * j), controlPoint1: CGPoint(x: k * 86.4, y: 133.7 * j), controlPoint2: CGPoint(x: k * 82.2, y: 144.9 * j))
puzzle22.addCurve(to: CGPoint(x: k * 104.6, y: 156 * j), controlPoint1: CGPoint(x: k * 94.1, y: 153.6 * j), controlPoint2: CGPoint(x: k * 103, y: 152.1 * j))
puzzle22.close()
puzzle22.miterLimit = 4;

paths.append(puzzle22)



let puzzle21 = UIBezierPath()
puzzle21.move(to: CGPoint(x: k * 20.2, y: 156.3 * j))
puzzle21.addCurve(to: CGPoint(x: k * 16, y: 166.1 * j), controlPoint1: CGPoint(x: k * 21.4, y: 159.3 * j), controlPoint2: CGPoint(x: k * 14.7, y: 162.5 * j))
puzzle21.addCurve(to: CGPoint(x: k * 30.6, y: 169.1 * j), controlPoint1: CGPoint(x: k * 17.3, y: 169.9 * j), controlPoint2: CGPoint(x: k * 27, y: 172.1 * j))
puzzle21.addCurve(to: CGPoint(x: k * 32.6, y: 163.3 * j), controlPoint1: CGPoint(x: k * 32.2, y: 167.8 * j), controlPoint2: CGPoint(x: k * 32.4, y: 165.6 * j))
puzzle21.addCurve(to: CGPoint(x: k * 32.1, y: 155.9 * j), controlPoint1: CGPoint(x: k * 33, y: 159 * j), controlPoint2: CGPoint(x: k * 31.4, y: 157.5 * j))
puzzle21.addCurve(to: CGPoint(x: k * 51.4, y: 153.9 * j), controlPoint1: CGPoint(x: k * 33.8, y: 152.1 * j), controlPoint2: CGPoint(x: k * 46.8, y: 153.5 * j))
puzzle21.addCurve(to: CGPoint(x: k * 79.4, y: 154.4 * j), controlPoint1: CGPoint(x: k * 62.2, y: 154.9 * j), controlPoint2: CGPoint(x: k * 71.6, y: 154.7 * j))
puzzle21.addCurve(to: CGPoint(x: k * 84.4, y: 121.6 * j), controlPoint1: CGPoint(x: k * 82.2, y: 145.2 * j), controlPoint2: CGPoint(x: k * 86.4, y: 133.9 * j))
puzzle21.addCurve(to: CGPoint(x: k * 86, y: 111.6 * j), controlPoint1: CGPoint(x: k * 84.1, y: 119.5 * j), controlPoint2: CGPoint(x: k * 83, y: 114.2 * j))
puzzle21.addCurve(to: CGPoint(x: k * 98.3, y: 108.8 * j), controlPoint1: CGPoint(x: k * 89.5, y: 108.5 * j), controlPoint2: CGPoint(x: k * 95.3, y: 111.9 * j))
puzzle21.addCurve(to: CGPoint(x: k * 96.7, y: 97.5 * j), controlPoint1: CGPoint(x: k * 101, y: 106 * j), controlPoint2: CGPoint(x: k * 100, y: 99.3 * j))
puzzle21.addCurve(to: CGPoint(x: k * 84.8, y: 99.9 * j), controlPoint1: CGPoint(x: k * 92.9, y: 95.4 * j), controlPoint2: CGPoint(x: k * 88.8, y: 101.3 * j))
puzzle21.addCurve(to: CGPoint(x: k * 82.7, y: 80 * j), controlPoint1: CGPoint(x: k * 80.9, y: 98.5 * j), controlPoint2: CGPoint(x: k * 81.9, y: 91.5 * j))
puzzle21.addCurve(to: CGPoint(x: k * 58.9, y: 75.5 * j), controlPoint1: CGPoint(x: k * 76.2, y: 79.1 * j), controlPoint2: CGPoint(x: k * 68.4, y: 77.7 * j))
puzzle21.addCurve(to: CGPoint(x: k * 39.7, y: 75.1 * j), controlPoint1: CGPoint(x: k * 53.8, y: 74.3 * j), controlPoint2: CGPoint(x: k * 42.7, y: 71.4 * j))
puzzle21.addCurve(to: CGPoint(x: k * 42.3, y: 90.8 * j), controlPoint1: CGPoint(x: k * 36.6, y: 79 * j), controlPoint2: CGPoint(x: k * 45.4, y: 86.2 * j))
puzzle21.addCurve(to: CGPoint(x: k * 17.7, y: 89.2 * j), controlPoint1: CGPoint(x: k * 38.5, y: 96.3 * j), controlPoint2: CGPoint(x: k * 19.9, y: 94.7 * j))
puzzle21.addCurve(to: CGPoint(x: k * 22.6, y: 75.9 * j), controlPoint1: CGPoint(x: k * 15.9, y: 84.8 * j), controlPoint2: CGPoint(x: k * 24.9, y: 78.9 * j))
puzzle21.addCurve(to: CGPoint(x: k * 16.4, y: 74.8 * j), controlPoint1: CGPoint(x: k * 21.3, y: 74.2 * j), controlPoint2: CGPoint(x: k * 17.5, y: 74.7 * j))
puzzle21.addCurve(to: CGPoint(x: k * 0, y: 75.9 * j), controlPoint1: CGPoint(x: k * 13.1, y: 75.2 * j), controlPoint2: CGPoint(x: k * 8, y: 75.5 * j))
puzzle21.addLine(to: CGPoint(x: k * 0, y: 75.9 * j))
puzzle21.addLine(to: CGPoint(x: k * 0, y: 153.7 * j))
puzzle21.addCurve(to: CGPoint(x: k * 3.5, y: 153.6 * j), controlPoint1: CGPoint(x: k * 2, y: 153.7 * j), controlPoint2: CGPoint(x: k * 2.7, y: 153.6 * j))
puzzle21.addCurve(to: CGPoint(x: k * 20.2, y: 156.3 * j), controlPoint1: CGPoint(x: k * 6.3, y: 153.3 * j), controlPoint2: CGPoint(x: k * 18.7, y: 152.6 * j))
puzzle21.close()
puzzle21.miterLimit = 4;

paths.append(puzzle21)


// MARK: 1st row
    
    
let puzzle14 = UIBezierPath()
puzzle14.move(to: CGPoint(x: k * 249.9, y: 39.2 * j))
puzzle14.addCurve(to: CGPoint(x: k * 239.2, y: 35.5 * j), controlPoint1: CGPoint(x: k * 246.6, y: 40.3 * j), controlPoint2: CGPoint(x: k * 243.1, y: 34.4 * j))
puzzle14.addCurve(to: CGPoint(x: k * 236, y: 48.2 * j), controlPoint1: CGPoint(x: k * 235, y: 36.7 * j), controlPoint2: CGPoint(x: k * 232.6, y: 45.1 * j))
puzzle14.addCurve(to: CGPoint(x: k * 242.3, y: 49.9 * j), controlPoint1: CGPoint(x: k * 237.5, y: 49.6 * j), controlPoint2: CGPoint(x: k * 239.8, y: 49.7 * j))
puzzle14.addCurve(to: CGPoint(x: k * 250.4, y: 49.5 * j), controlPoint1: CGPoint(x: k * 247, y: 50.2 * j), controlPoint2: CGPoint(x: k * 248.7, y: 48.9 * j))
puzzle14.addCurve(to: CGPoint(x: k * 252.6, y: 66.3 * j), controlPoint1: CGPoint(x: k * 254.6, y: 51 * j), controlPoint2: CGPoint(x: k * 253.1, y: 62.3 * j))
puzzle14.addCurve(to: CGPoint(x: k * 252.1, y: 71.9 * j), controlPoint1: CGPoint(x: k * 252.4, y: 68.2 * j), controlPoint2: CGPoint(x: k * 252.2, y: 70.1 * j))
puzzle14.addCurve(to: CGPoint(x: k * 274.5, y: 77.4 * j), controlPoint1: CGPoint(x: k * 260.7, y: 72.7 * j), controlPoint2: CGPoint(x: k * 269, y: 74.4 * j))
puzzle14.addCurve(to: CGPoint(x: k * 285.1, y: 80.1 * j), controlPoint1: CGPoint(x: k * 275.7, y: 78 * j), controlPoint2: CGPoint(x: k * 279.8, y: 80.3 * j))
puzzle14.addCurve(to: CGPoint(x: k * 295.4, y: 75.5 * j), controlPoint1: CGPoint(x: k * 285.6, y: 80.1 * j), controlPoint2: CGPoint(x: k * 293.4, y: 79.6 * j))
puzzle14.addCurve(to: CGPoint(x: k * 293.3, y: 63.9 * j), controlPoint1: CGPoint(x: k * 297.5, y: 71.2 * j), controlPoint2: CGPoint(x: k * 291.3, y: 67.4 * j))
puzzle14.addCurve(to: CGPoint(x: k * 310.3, y: 63 * j), controlPoint1: CGPoint(x: k * 295.7, y: 59.6 * j), controlPoint2: CGPoint(x: k * 308.3, y: 59.5 * j))
puzzle14.addCurve(to: CGPoint(x: k * 308.2, y: 73.9 * j), controlPoint1: CGPoint(x: k * 311.8, y: 65.5 * j), controlPoint2: CGPoint(x: k * 307, y: 68.6 * j))
puzzle14.addCurve(to: CGPoint(x: k * 311.1, y: 78.9 * j), controlPoint1: CGPoint(x: k * 308.7, y: 76.3 * j), controlPoint2: CGPoint(x: k * 310.2, y: 78.1 * j))
puzzle14.addCurve(to: CGPoint(x: size.width, y: 77.1 * j), controlPoint1: CGPoint(x: k * 315.9, y: 83.3 * j), controlPoint2: CGPoint(x: k * 325.6, y: 79.6 * j))
puzzle14.addLine(to: CGPoint(x: size.width, y: 0 * j))
puzzle14.addLine(to: CGPoint(x: k * 251.8, y: 0 * j))
puzzle14.addCurve(to: CGPoint(x: k * 252.9, y: 24.8 * j), controlPoint1: CGPoint(x: k * 252, y: 8.7 * j), controlPoint2: CGPoint(x: k * 252.3, y: 16.7 * j))
puzzle14.addCurve(to: CGPoint(x: k * 249.9, y: 39.2 * j), controlPoint1: CGPoint(x: k * 253.1, y: 27.1 * j), controlPoint2: CGPoint(x: k * 254, y: 37.9 * j))
puzzle14.close()
puzzle14.miterLimit = 4;

paths.append(puzzle14)


let puzzle13 = UIBezierPath()
puzzle13.move(to: CGPoint(x: k * 163.4, y: 29.5 * j))
puzzle13.addCurve(to: CGPoint(x: k * 177.9, y: 25.1 * j), controlPoint1: CGPoint(x: k * 166.7, y: 31.6 * j), controlPoint2: CGPoint(x: k * 173.1, y: 23.4 * j))
puzzle13.addCurve(to: CGPoint(x: k * 179.7, y: 47.5 * j), controlPoint1: CGPoint(x: k * 183.9, y: 27.2 * j), controlPoint2: CGPoint(x: k * 185.7, y: 44.1 * j))
puzzle13.addCurve(to: CGPoint(x: k * 162.5, y: 45.2 * j), controlPoint1: CGPoint(x: k * 174.6, y: 50.4 * j), controlPoint2: CGPoint(x: k * 166.8, y: 42.3 * j))
puzzle13.addCurve(to: CGPoint(x: k * 163, y: 62.6 * j), controlPoint1: CGPoint(x: k * 158.5, y: 47.9 * j), controlPoint2: CGPoint(x: k * 161.7, y: 58 * j))
puzzle13.addCurve(to: CGPoint(x: k * 166, y: 74.5 * j), controlPoint1: CGPoint(x: k * 164.2, y: 67 * j), controlPoint2: CGPoint(x: k * 165.2, y: 70.9 * j))
puzzle13.addCurve(to: CGPoint(x: k * 202.7, y: 78.2 * j), controlPoint1: CGPoint(x: k * 182.2, y: 72.4 * j), controlPoint2: CGPoint(x: k * 200.5, y: 73.5 * j))
puzzle13.addCurve(to: CGPoint(x: k * 201.3, y: 86.4 * j), controlPoint1: CGPoint(x: k * 203.8, y: 80.7 * j), controlPoint2: CGPoint(x: k * 199.8, y: 82.9 * j))
puzzle13.addCurve(to: CGPoint(x: k * 213.3, y: 91.1 * j), controlPoint1: CGPoint(x: k * 202.8, y: 89.8 * j), controlPoint2: CGPoint(x: k * 208.4, y: 91.9 * j))
puzzle13.addCurve(to: CGPoint(x: k * 222, y: 84.5 * j), controlPoint1: CGPoint(x: k * 217.2, y: 90.5 * j), controlPoint2: CGPoint(x: k * 221.5, y: 87.8 * j))
puzzle13.addCurve(to: CGPoint(x: k * 217.7, y: 76.3 * j), controlPoint1: CGPoint(x: k * 222.6, y: 80.4 * j), controlPoint2: CGPoint(x: k * 217.1, y: 78.6 * j))
puzzle13.addCurve(to: CGPoint(x: k * 252, y: 72 * j), controlPoint1: CGPoint(x: k * 218.8, y: 72.4 * j), controlPoint2: CGPoint(x: k * 235.8, y: 70.5 * j))
puzzle13.addCurve(to: CGPoint(x: k * 252.5, y: 66.4 * j), controlPoint1: CGPoint(x: k * 252.1, y: 70.2 * j), controlPoint2: CGPoint(x: k * 252.3, y: 68.3 * j))
puzzle13.addCurve(to: CGPoint(x: k * 250.3, y: 49.6 * j), controlPoint1: CGPoint(x: k * 253, y: 62.4 * j), controlPoint2: CGPoint(x: k * 254.4, y: 51.1 * j))
puzzle13.addCurve(to: CGPoint(x: k * 242.2, y: 50 * j), controlPoint1: CGPoint(x: k * 248.6, y: 49 * j), controlPoint2: CGPoint(x: k * 246.9, y: 50.3 * j))
puzzle13.addCurve(to: CGPoint(x: k * 235.9, y: 48.3 * j), controlPoint1: CGPoint(x: k * 239.7, y: 49.8 * j), controlPoint2: CGPoint(x: k * 237.4, y: 49.7 * j))
puzzle13.addCurve(to: CGPoint(x: k * 239.1, y: 35.6 * j), controlPoint1: CGPoint(x: k * 232.5, y: 45.2 * j), controlPoint2: CGPoint(x: k * 234.9, y: 36.7 * j))
puzzle13.addCurve(to: CGPoint(x: k * 249.8, y: 39.3 * j), controlPoint1: CGPoint(x: k * 243, y: 34.5 * j), controlPoint2: CGPoint(x: k * 246.6, y: 40.3 * j))
puzzle13.addCurve(to: CGPoint(x: k * 252.9, y: 24.7 * j), controlPoint1: CGPoint(x: k * 253.9, y: 38 * j), controlPoint2: CGPoint(x: k * 253.1, y: 27.2 * j))
puzzle13.addCurve(to: CGPoint(x: k * 251.8, y: 0 * j), controlPoint1: CGPoint(x: k * 252.3, y: 16.6 * j), controlPoint2: CGPoint(x: k * 251.9, y: 8.6 * j))
puzzle13.addLine(to: CGPoint(x: k * 164, y: 0 * j))
puzzle13.addCurve(to: CGPoint(x: k * 162.3, y: 23.8 * j), controlPoint1: CGPoint(x: k * 163.4, y: 11.3 * j), controlPoint2: CGPoint(x: k * 162.9, y: 19.4 * j))
puzzle13.addCurve(to: CGPoint(x: k * 163.4, y: 29.5 * j), controlPoint1: CGPoint(x: k * 162.1, y: 24.9 * j), controlPoint2: CGPoint(x: k * 161.6, y: 28.3 * j))
puzzle13.close()
puzzle13.miterLimit = 4;

paths.append(puzzle13)


let puzzle12 = UIBezierPath()
puzzle12.move(to: CGPoint(x: k * 85, y: 21.7 * j))
puzzle12.addCurve(to: CGPoint(x: k * 95.7, y: 17.8 * j), controlPoint1: CGPoint(x: k * 88.3, y: 22.8 * j), controlPoint2: CGPoint(x: k * 91.8, y: 16.6 * j))
puzzle12.addCurve(to: CGPoint(x: k * 98.9, y: 31.3 * j), controlPoint1: CGPoint(x: k * 99.9, y: 19 * j), controlPoint2: CGPoint(x: k * 102.3, y: 28 * j))
puzzle12.addCurve(to: CGPoint(x: k * 92.6, y: 33.1 * j), controlPoint1: CGPoint(x: k * 97.4, y: 32.7 * j), controlPoint2: CGPoint(x: k * 95.1, y: 32.9 * j))
puzzle12.addCurve(to: CGPoint(x: k * 84.5, y: 32.7 * j), controlPoint1: CGPoint(x: k * 87.9, y: 33.5 * j), controlPoint2: CGPoint(x: k * 86.2, y: 32 * j))
puzzle12.addCurve(to: CGPoint(x: k * 82.3, y: 50.6 * j), controlPoint1: CGPoint(x: k * 80.3, y: 34.3 * j), controlPoint2: CGPoint(x: k * 81.9, y: 46.3 * j))
puzzle12.addCurve(to: CGPoint(x: k * 82.6, y: 79.9 * j), controlPoint1: CGPoint(x: k * 83.6, y: 62.3 * j), controlPoint2: CGPoint(x: k * 83.2, y: 72.1 * j))
puzzle12.addCurve(to: CGPoint(x: k * 113.7, y: 76.9 * j), controlPoint1: CGPoint(x: k * 107, y: 83.2 * j), controlPoint2: CGPoint(x: k * 112.1, y: 78.5 * j))
puzzle12.addCurve(to: CGPoint(x: k * 117.2, y: 70 * j), controlPoint1: CGPoint(x: k * 117, y: 73.6 * j), controlPoint2: CGPoint(x: k * 117.2, y: 70 * j))
puzzle12.addCurve(to: CGPoint(x: k * 115.1, y: 62.3 * j), controlPoint1: CGPoint(x: k * 117.4, y: 66 * j), controlPoint2: CGPoint(x: k * 114.3, y: 64.4 * j))
puzzle12.addCurve(to: CGPoint(x: k * 138.4, y: 61.2 * j), controlPoint1: CGPoint(x: k * 116.8, y: 57.4 * j), controlPoint2: CGPoint(x: k * 136.6, y: 56.9 * j))
puzzle12.addCurve(to: CGPoint(x: k * 134.1, y: 70.6 * j), controlPoint1: CGPoint(x: k * 139.4, y: 63.6 * j), controlPoint2: CGPoint(x: k * 133.8, y: 65.6 * j))
puzzle12.addCurve(to: CGPoint(x: k * 140.3, y: 78.4 * j), controlPoint1: CGPoint(x: k * 134.3, y: 74 * j), controlPoint2: CGPoint(x: k * 137.1, y: 77.1 * j))
puzzle12.addCurve(to: CGPoint(x: k * 150.3, y: 77.9 * j), controlPoint1: CGPoint(x: k * 144.5, y: 80 * j), controlPoint2: CGPoint(x: k * 149.1, y: 78.3 * j))
puzzle12.addCurve(to: CGPoint(x: k * 165.9, y: 74.5 * j), controlPoint1: CGPoint(x: k * 154.7, y: 76.4 * j), controlPoint2: CGPoint(x: k * 160.2, y: 75.2 * j))
puzzle12.addCurve(to: CGPoint(x: k * 162.9, y: 62.6 * j), controlPoint1: CGPoint(x: k * 165.1, y: 70.9 * j), controlPoint2: CGPoint(x: k * 164.1, y: 66.9 * j))
puzzle12.addCurve(to: CGPoint(x: k * 162.4, y: 45.2 * j), controlPoint1: CGPoint(x: k * 161.6, y: 57.9 * j), controlPoint2: CGPoint(x: k * 158.4, y: 47.9 * j))
puzzle12.addCurve(to: CGPoint(x: k * 179.6, y: 47.5 * j), controlPoint1: CGPoint(x: k * 166.6, y: 42.3 * j), controlPoint2: CGPoint(x: k * 174.5, y: 50.4 * j))
puzzle12.addCurve(to: CGPoint(x: k * 177.8, y: 25.1 * j), controlPoint1: CGPoint(x: k * 185.6, y: 44.1 * j), controlPoint2: CGPoint(x: k * 183.9, y: 27.2 * j))
puzzle12.addCurve(to: CGPoint(x: k * 163.3, y: 29.5 * j), controlPoint1: CGPoint(x: k * 173, y: 23.5 * j), controlPoint2: CGPoint(x: k * 166.6, y: 31.6 * j))
puzzle12.addCurve(to: CGPoint(x: k * 162.1, y: 23.8 * j), controlPoint1: CGPoint(x: k * 161.5, y: 28.3 * j), controlPoint2: CGPoint(x: k * 162, y: 24.9 * j))
puzzle12.addCurve(to: CGPoint(x: k * 163.8, y: 0 * j), controlPoint1: CGPoint(x: k * 162.7, y: 19.3 * j), controlPoint2: CGPoint(x: k * 163.3, y: 11.3 * j))
puzzle12.addLine(to: CGPoint(x: k * 82.3, y: 0 * j))
puzzle12.addCurve(to: CGPoint(x: k * 81.9, y: 6.2 * j), controlPoint1: CGPoint(x: k * 82.2, y: 2.2 * j), controlPoint2: CGPoint(x: k * 82.1, y: 4.2 * j))
puzzle12.addCurve(to: CGPoint(x: k * 85, y: 21.7 * j), controlPoint1: CGPoint(x: k * 81.7, y: 8.8 * j), controlPoint2: CGPoint(x: k * 80.9, y: 20.3 * j))
puzzle12.close()
puzzle12.miterLimit = 4;

paths.append(puzzle12)


//// XMLID_116_ Drawing
let puzzle11 = UIBezierPath()

puzzle11.move(to: CGPoint(x: k * 16.3, y: 74.7 * j))
puzzle11.addCurve(to: CGPoint(x: k * 22.5, y: 75.8 * j), controlPoint1: CGPoint(x: k * 17.5, y: 74.6 * j), controlPoint2: CGPoint(x: k * 21.3, y: 74.1 * j))
puzzle11.addCurve(to: CGPoint(x: k * 17.6, y: 89.1 * j), controlPoint1: CGPoint(x: k * 24.8, y: 78.8 * j), controlPoint2: CGPoint(x: k * 15.8, y: 84.7 * j))
puzzle11.addCurve(to: CGPoint(x: k * 42.2, y: 90.7 * j), controlPoint1: CGPoint(x: k * 19.9, y: 94.6 * j), controlPoint2: CGPoint(x: k * 38.5, y: 96.3 * j))
puzzle11.addCurve(to: CGPoint(x: k * 39.6, y: 75 * j), controlPoint1: CGPoint(x: k * 45.4, y: 86.1 * j), controlPoint2: CGPoint(x: k * 36.5, y: 78.8 * j))
puzzle11.addCurve(to: CGPoint(x: k * 58.8, y: 75.4 * j), controlPoint1: CGPoint(x: k * 42.6, y: 71.3 * j), controlPoint2: CGPoint(x: k * 53.6, y: 74.2 * j))
puzzle11.addCurve(to: CGPoint(x: k * 82.6, y: 79.9 * j), controlPoint1: CGPoint(x: k * 68.3, y: 77.6 * j), controlPoint2: CGPoint(x: k * 76.1, y: 79 * j))
puzzle11.addCurve(to: CGPoint(x: k * 82.3, y: 50.6 * j), controlPoint1: CGPoint(x: k * 83.1, y: 72.1 * j), controlPoint2: CGPoint(x: k * 83.6, y: 62.3 * j))
puzzle11.addCurve(to: CGPoint(x: k * 84.5, y: 32.7 * j), controlPoint1: CGPoint(x: k * 81.8, y: 46.4 * j), controlPoint2: CGPoint(x: k * 80.3, y: 34.4 * j))
puzzle11.addCurve(to: CGPoint(x: k * 92.6, y: 33.1 * j), controlPoint1: CGPoint(x: k * 86.2, y: 32 * j), controlPoint2: CGPoint(x: k * 87.9, y: 33.5 * j))
puzzle11.addCurve(to: CGPoint(x: k * 98.9, y: 31.3 * j), controlPoint1: CGPoint(x: k * 95.1, y: 32.9 * j), controlPoint2: CGPoint(x: k * 97.4, y: 32.7 * j))
puzzle11.addCurve(to: CGPoint(x: k * 95.7, y: 17.8 * j), controlPoint1: CGPoint(x: k * 102.3, y: 28 * j), controlPoint2: CGPoint(x: k * 99.8, y: 19 * j))
puzzle11.addCurve(to: CGPoint(x: k * 85, y: 21.7 * j), controlPoint1: CGPoint(x: k * 91.8, y: 16.6 * j), controlPoint2: CGPoint(x: k * 88.3, y: 22.8 * j))
puzzle11.addCurve(to: CGPoint(x: k * 81.9, y: 6.2 * j), controlPoint1: CGPoint(x: k * 80.9, y: 20.3 * j), controlPoint2: CGPoint(x: k * 81.7, y: 8.9 * j))
puzzle11.addCurve(to: CGPoint(x: k * 82.3, y: 0), controlPoint1: CGPoint(x: k * 82, y: 4.2 * j), controlPoint2: CGPoint(x: k * 82.2, y: 2.2 * j))
puzzle11.addLine(to: CGPoint(x: 0, y: 0))
puzzle11.addLine(to: CGPoint(x: 0, y: 75.8 * j))
puzzle11.addLine(to: CGPoint(x: 0, y: 75.8 * j))
puzzle11.addCurve(to: CGPoint(x: k * 16.3, y: 74.7 * j), controlPoint1: CGPoint(x: k * 7.9, y: 75.4 * j), controlPoint2: CGPoint(x: k * 13 , y: 75.1 * j))
puzzle11.close()
puzzle11.miterLimit = 4;

paths.append(puzzle11)
    
return paths

    
}
