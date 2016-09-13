//
//  Constants.swift
//  puzzleGame
//
//  Created by Arturs Derkintis on 8/17/15.
//  Copyright © 2015 Starfly. All rights reserved.
//
import UIKit


let pieceName = "Pieces98"
struct Layer {
    static let Background: CGFloat = 1
    static let GuidePhoto: CGFloat = 2
    static let Tiles: CGFloat = 3
    static let MenuItems: CGFloat = 4
    static let MovingPiece: CGFloat = 5
}

struct BookChapter {
    let day:BookDays
    let pageNumbers:Int
    private var index = 0
    var fromIndexPage = false
    var narration = false
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
        self.pageIndex = index
    }
}

