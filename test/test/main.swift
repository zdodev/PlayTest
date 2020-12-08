struct Stack<Number: Numeric> {
    private var elements = [Number]()
    
    mutating func push(element: Number) {
        elements.append(element)
    }
    
    mutating func pop() -> Number? {
        elements.popLast()
    }
    
    func peek() -> Number? {
        elements.last
    }
    
    var isEmpty: Bool {
        elements.isEmpty
    }
    
    var count: Int {
        elements.count
    }
}

protocol Calculable {
    func add(_ lhs: Int, _ rhs: Int) -> Int
//    func subtract(_ lhs: Int, _ rhs: Int) -> Int
//    func multiply(_ lhs: Int, _ rhs: Int) -> Int
}
// double 형의 정확한 int화?

protocol DecimalCalculable: Calculable {
    func add(_ lhs: Int, _ rhs: Double) -> Double
    func add(_ lhs: Double, _ rhs: Int) -> Double
    func add(_ lhs: Double, _ rhs: Double) -> Double
}

protocol BinaryCalculable: Calculable {
}

struct DecimalCalculator: DecimalCalculable {
    func add(_ lhs: Int, _ rhs: Int) -> Int {
        lhs + rhs
    }
    
    func add(_ lhs: Int, _ rhs: Double) -> Double {
        Double(lhs) + rhs
    }
    
    func add(_ lhs: Double, _ rhs: Int) -> Double {
        lhs + Double(rhs)
    }
    
    func add(_ lhs: Double, _ rhs: Double) -> Double {
        lhs + rhs
    }
}

struct Calculator {
    var decimalCalculator = DecimalCalculator()
//    var stack = Stack()
    
    init() {}
    
    // 공통
    func add(_ lhs: String, _ rhs: String) {
        
    }
    
    func subtract() {}
    func multiply() {}
    
    // 10진수 전용
    func divide() {}
    
    // 2진수 전용
    func logicalANDoperation() {}
    func logicalORoperation() {}
    func logicalNOToperation() {}
    func logicalNORoperation() {}
    func logicalXORoperation() {}
    func logicalNANDoperation() {}
    func bitwiseLeftShiftOperation() {}
    func bitwiseRightShiftOperation() {}
}

var c = Calculator()
let lhs = "25"
let op = "*"
let rhs = "48"

let str = lhs + op + rhs
print(str)

let a = str.endIndex
