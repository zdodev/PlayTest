struct Point {
    var x: Int
    var y: Int
    
    mutating func move(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

let point = Point(x: 1, y: 2)
point.move(3, 4)
