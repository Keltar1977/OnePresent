
import Foundation

enum HiddenObjects: String {
    //Page One
    case pearl = "pearl"
    case bug = "bug"
    case fish = "fish"
    //Page Two
    case key = "key"
    case candle = "candle"
    case frog = "frog"
    //Page Three
    case goat = "goat"
    case flower = "flower"
    case mail = "mail"
    //Page Four
    case sock = "sock"
    case heart = "heart"
    case wings = "wings"
    //Page Five
    case jacket = "jacket"
    case hat = "hat"
    case glue = "glue"
    //Page Six
    case star = "star"
    case glasses = "glasses"
    case flake = "flake"
    //Page Seven
    case cane = "cane"
    case spoon = "spoon"
    case sled = "sled"
}

enum PresentsType: String {
    //Page One
    case yoyo = "yoyo"

    //Page Two
    case santa = "santa"

    //Page Three
    case bell = "bell"

    //Page Four
    case glow = "glow"

    //Page Six
    case lollipop = "lollipop"
    
    //Page Seven
    case doll = "doll"

}

enum BookDays: String {
    case dayOne = "DayOne"
    case dayTwo = "DayTwo"
    case dayThree = "DayThree"
    case dayFour = "DayFour"
    case dayFive = "DayFive"
    case daySix = "DaySix"
    case daySeven = "DaySeven"
    static let allValues = [dayOne, dayTwo, dayThree, dayFour, dayFive ,daySix, daySeven]
    
    func nextDay() -> BookDays {
        if self == BookDays.allValues.last {
            return self
        }
        let index = BookDays.allValues.index(of: self)!
        return BookDays.allValues[index + 1]
    }
}

enum NumberLevels: Int {
    case Easy   = 4
    case Medium = 8
    case Hard   = 12
    case Insane = 16
    case Sreyoukiddingme = 20
}
enum ImageLevels : Int {
    case Easy   = 4
    case Normal = 6
    case Hard   = 8
}
enum TileMoves{
    case up, down, right, left, notMove
}

//MARK: Things for JigSaw Puzzle

enum JigsawLevels: Int{
    case Easy   = 9
    case Normal = 15
    case Hard   = 20
}
enum PieceRotation : Int{
    case Zero   = 0     //correct
    case First  = 1     //90d
    case Second = 2     //180d
    case Third  = 3     //270d
}
struct ConectionTags {
    var Top: Int = 0
    var Right: Int = 0
    var Bottom: Int = 0
    var Left: Int = 0
}
