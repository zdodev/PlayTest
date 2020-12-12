//protocol Calculable {
//    func add(_ lhs: Int, _ rhs: Int) -> Int
//}
//
//protocol DecimalCalculable: Calculable {
//    func add(_ lhs: Int, _ rhs: Double) -> Double
//    func add(_ lhs: Double, _ rhs: Int) -> Double
//    func add(_ lhs: Double, _ rhs: Double) -> Double
//}
//
//protocol BinaryCalculable: Calculable {
//}
//
//struct DecimalCalculator: DecimalCalculable {
//    func add(_ lhs: Int, _ rhs: Int) -> Int {
//        lhs + rhs
//    }
//
//    func add(_ lhs: Int, _ rhs: Double) -> Double {
//        Double(lhs) + rhs
//    }
//
//    func add(_ lhs: Double, _ rhs: Int) -> Double {
//        lhs + Double(rhs)
//    }
//
//    func add(_ lhs: Double, _ rhs: Double) -> Double {
//        lhs + rhs
//    }
//}
//
//struct Calculator {
//    var decimalCalculator = DecimalCalculator()
//    var tokens = Stack<Token>()
//
//    init() {}
//
//    // 공통
//    func add(_ lhs: String, _ rhs: String) {
//
//    }
//
//    func subtract() {}
//    func multiply() {}
//
//    // 10진수 전용
//    func divide() {}
//
//    // 2진수 전용
//    func logicalANDoperation() {}
//    func logicalORoperation() {}
//    func logicalNOToperation() {}
//    func logicalNORoperation() {}
//    func logicalXORoperation() {}
//    func logicalNANDoperation() {}
//    func bitwiseLeftShiftOperation() {}
//    func bitwiseRightShiftOperation() {}
//}

//let ex = ExpressionLexicalAnalyzer()
//let a = ex.convertExpressionToToken(expression: "5.1+4*3*2=")
//let ex2 = ExpressionSyntaxAnalyzer()
//let b = ex2.convertInfixToPostfix(tokenization: a!)
//let c = Calculator()
//print(c.calculate(expression: b))

let expressions = [
    "12 + 23 - 34",
    "12 + 23 * 34 - 45",
    "12.23 + 34 * 45"
]

//for expression in expressions {
//    let a = expression.split(separator: " ")
//    if let b = Int(a[0]) {
//        print(b)
//    } else if let c = Double(a[0]) {
//        print(c)
//    }
//}

let a = ExpressionAnalyzer()
let b = TokenAnalyzer()
let q = a.convertExpressionToToken(expression: expressions[2])
let w = b.convertInfixToPostfix(tokenExpression: q!)

if let c = w {
    for d in c {
        if let e = d as? IntegerOperand {
            print(e.value)
        } else if let f = d as? RealNumberOperand {
            print(f.value)
        } else if let g = d as? Operator {
            print(g.value.rawValue)
        }
    }
}
