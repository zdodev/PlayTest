struct Point: Equatable, Hashable {
    var x: Int
    var y: Int
    
    // Equatable 기능 구현
    static func ==(lhs: Point, rhs: Point) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y
    }
    
    // Hashable 기능 구현
    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}

let currentPosition = Point(x: 1, y: 2)
let anotherPosition = Point(x: 1, y: 2)
let nextPosition = Point(x: 3, y: 4)

var positions: Set = [currentPosition, nextPosition]
if positions.contains(anotherPosition) {
    print(positions.contains(anotherPosition))
}
// true
