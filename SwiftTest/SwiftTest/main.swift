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

struct Calculator {
    func calculate(expression: [Token]) -> Int {
        var operands = Stack<Operand>()
        var calculateResult: Int = 0
        
        for token in expression {
            if let operand = token as? Operand {
                operands.push(element: operand)
            } else if let `operator` = token as? Operator {
                var intermediateResult: Operand?
                guard let secondOperand = operands.pop()?.operand else { return 0 }
                guard let firstOperand = operands.pop()?.operand else { return 0 }
                
                switch `operator`.operator {
                case "+":
                    intermediateResult = Operand(operand: firstOperand + secondOperand)
                case "-":
                    intermediateResult = Operand(operand: firstOperand - secondOperand)
                case "*":
                    intermediateResult = Operand(operand: firstOperand * secondOperand)
                case "/":
                    intermediateResult = Operand(operand: firstOperand / secondOperand)
                default:
                    print("error") // error
                }
                
                guard let result = intermediateResult else { return 0 }
                operands.push(element: result)
            }
        }
        
        if let result = operands.pop() {
            calculateResult = result.operand
        }
        
        return calculateResult
    }
}

let ex = ExpressionLexicalAnalyzer()
let a = ex.convertExpressionToToken(expression: "5+4*3*2=")
let ex2 = ExpressionSyntaxAnalyzer()
let b = ex2.convertInfixToPostfix(tokenization: a!)
let c = Calculator()
print(c.calculate(expression: b))
