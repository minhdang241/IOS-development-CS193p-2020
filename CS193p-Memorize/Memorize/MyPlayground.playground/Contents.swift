import UIKit


let myTuple: (String, Int) = (greet: "Hello", number:123)
let a = [1,2,3]
print(a.count == 3)


// MARK: - String
// Type can be infered by swift
// Note: Swift always infers float number as DOUBLE
let apples = 3
let oranges = 5
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of
    fruit."
"""
print(quotation)

// MARK: - Array && Dictionary
var shoppingList = ["catfish", "water", "tulips"]
print(shoppingList[0])

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic"
]

print(occupations["Malcolm"] ?? 0)

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0

for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}

print(largest)

// MARK: - Control Flow
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

//MARK: - Optionals
var optionalString: String? = "Hello"
optionalString = nil
print(optionalString == nil)

var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

// MARK: - Switch
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers){ $0 < 10 }

// MARK: - Enumerations and Structures
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten, jack, queen, king

    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue
Rank.ten.rawValue
if let convertedRank = Rank(rawValue: 3) {
    
    print(convertedRank)
    let _ = convertedRank.simpleDescription()
}


enum Suit {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades (\(color(of: .spades)))"
        case .hearts:
            return "hearts (\(color(of: .hearts)))"
        case .diamonds:
            return "diamonds (\(color(of: .diamonds)))"
        case .clubs:
            return "clubs (\(color(of: .clubs)))"
        }
    }
    
    func color(of suit: Suit) -> String {
        if suit == .spades || suit == .clubs {
            return "black"
        } else {
            return "red"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

protocol ExampleProtocol {
    var simpleDescription: String {get}
    mutating func adjust()
}
extension Double: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self = abs(self)
    }
}

var num = -7.5
print(num.simpleDescription)
print(num.adjust())
print(num)

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

enum Planet: Int, CaseIterable {
    case mercury,venus, earth, mars, jupiter, saturn, uranus, neptune
}


print(Planet.allCases.count)

struct randomStruct {
    var a: Int {
        get {
            return 5
        }
    }
}


