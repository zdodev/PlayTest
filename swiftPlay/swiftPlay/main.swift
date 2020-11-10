// The Problem that Opaque Types Solve

protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    var size: Int
    
    func draw() -> String {
        var result = [String]()
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        
        return result.joined(separator: "\n")
    }
}

let smallTriangle = Triangle(size: 3)
print(smallTriangle.draw())

struct FlippedShape<T: Shape>: Shape {
    var shape: T
    
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}

let flippedTriangle = FlippedShape(shape: smallTriangle)
print(flippedTriangle.draw())

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    
    func draw() -> String {
        top.draw() + "\n" + bottom.draw()
    }
}

let joinedTriangle = JoinedShape(top: smallTriangle, bottom: flippedTriangle)
print(joinedTriangle.draw())

// Returning an Opaque Type

struct Square: Shape {
    var size: Int
    
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = Array<String>(repeating: line, count: size)
        
        return result.joined(separator: "\n")
    }
}

func makeTrapezoid() -> some Shape {
    let top = Triangle(size: 2)
    let middle = Square(size: 2)
    let bottom = FlippedShape(shape: top)
    let trapezoid = JoinedShape(top: top, bottom: JoinedShape(top: middle, bottom: bottom))
    
    return trapezoid
}

let trapezoid = makeTrapezoid()
print(trapezoid.draw())

func flip<T: Shape>(_ shape: T) -> some Shape {
    FlippedShape(shape: shape)
}

func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> some Shape {
    JoinedShape(top: top, bottom: bottom)
}

let opaqueJoinedTriangles = join(smallTriangle, flip(smallTriangle))
print(opaqueJoinedTriangles.draw())

/*
func invalidFlip<T: Shape>(_ shape: T) -> some Shape {
    if shape is Square {
        return shape
    }
    
    return FlippedShape(shape: shape)
}
 */

struct FlippedShape1<T: Shape>: Shape {
    var shape: T
    
    func draw() -> String {
        if shape is Square {
            return shape.draw()
        }
        let lines = shape.draw().split(separator: "\n")
        
        return lines.reversed().joined(separator: "\n")
    }
}

func `repeat`<T: Shape>(shape: T, count: Int) -> some Collection {
    Array<T>(repeating: shape, count: count)
}

// Difference Between Opaque Types and Protocol Types

func protoFlip<T: Shape>(_ shape: T) -> Shape {
    FlippedShape(shape: shape)
}

func protoFlip1<T: Shape>(_ shape: T) -> Shape {
    if shape is Square {
        return shape
    }
    
    return FlippedShape(shape: shape)
}

let protoFlippedTriangle = protoFlip(smallTriangle)
let sameThing = protoFlip(smallTriangle)
/*
protoFlippedTriangle == sameThing
 */

protocol Container {
    associatedtype Item
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

extension Array: Container {}

/*
func makeProtocolContainer<T>(item: T) -> Container {
    [item]
}

func makeProtocolContainer1<T, C: Container>(item: T) -> C {
    [item]
}
 */

func makeOpaqueContainer<T>(item: T) -> some Container {
    [item]
}

let opaqueContainer = makeOpaqueContainer(item: 12)
let twelve = opaqueContainer[0]
print(type(of: twelve))
