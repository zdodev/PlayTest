import Foundation

let username = "Arturo"
if username == "Arturo" {
    print("Hi, Arturo!")
}

let today = 8
let favoriteNumbers = [4, 7, 8, 9]
if favoriteNumbers.contains(today) {
    print("It's a good day today!")
}

/// A position in an x-y coordinate system.
struct Position: Equatable, Hashable {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

let availablePositions = [Position(0, 0), Position(0, 1), Position(1, 0)]
let gemPosition = Position(1, 0)

for position in availablePositions {
    if gemPosition == position {
        print("Gem found at (\(position.x), \(position.y))!")
    } else {
        print("No gem at (\(position.x), \(position.y))")
    }
}

var visitedPositions: Set = [Position(0, 0), Position(1, 0)]
let currentPosition = Position(1, 3)

if visitedPositions.contains(currentPosition) {
    print("Already visited (\(currentPosition.x), \(currentPosition.y))")
} else {
    print("First time at (\(currentPosition.x), \(currentPosition.y))")
    visitedPositions.insert(currentPosition)
}

class Player {
    var name: String
    var position: Position
    
    init(name: String, position: Position) {
        self.name = name
        self.position = position
    }
}

extension Player: Equatable {
    static func ==(lhs: Player, rhs: Player) -> Bool {
        lhs.name == rhs.name && lhs.position == rhs.position
    }
}

extension Player: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(position)
    }
}

class MyNSObjectSubclass: NSObject {
    let firstProperty = 1
    let secondProperty = 2
}

extension MyNSObjectSubclass {
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? MyNSObjectSubclass else {
            return false
        }

        return self.firstProperty == other.firstProperty && self.secondProperty == other.secondProperty
    }
    
    override var hash: Int {
        var hasher = Hasher()
        hasher.combine(firstProperty)
        hasher.combine(secondProperty)
        return hasher.finalize()
    }
}
