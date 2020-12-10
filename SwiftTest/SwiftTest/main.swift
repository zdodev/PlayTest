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

class Token: Comparable {
    static func < (lhs: Token, rhs: Token) -> Bool {
        lhs.priority < rhs.priority
    }
    
    static func == (lhs: Token, rhs: Token) -> Bool {
        lhs.priority == rhs.priority
    }
    
    let priority: OperatorPrecedence
    
    init(priority: OperatorPrecedence) {
        self.priority = priority
    }
}

class Operand: Token {
    let operand: Int
    
    init(operand: Int) {
        self.operand = operand
        super.init(priority: .low)
    }
}

class Operator: Token {
    let `operator`: Character
    
    init(`operator`: Character, priority: OperatorPrecedence) {
        self.operator = `operator`
        super.init(priority: priority)
    }
}

enum OperatorPrecedence: Comparable {
    case low
    case middle
    case high
}

struct ExpressionLexicalAnalyzer {
    func getOperatorPrecedence(`operator`: Character) -> OperatorPrecedence {
        switch `operator` {
        case "*", "/":
            return .high
        case "+", "-":
            return .middle
        default:
            return .low
        }
    }
    
    func convertExpressionToToken(expression: String) -> [Token]? {
        var tokenization = [Token]()
        var digitNumber = 0
        let operatorsTokens: [Character] = ["+", "-", "*", "/"]
        let equalSignToken: Character = "="
        
        for character in expression {
            if character.isHexDigit {
                guard let digitValue = character.hexDigitValue else {
                    return nil
                }
                digitNumber = digitNumber * 10 + digitValue
            } else if operatorsTokens.contains(character) {
                let operandToken = Operand(operand: digitNumber)
                tokenization.append(operandToken)
                digitNumber = 0
                
                let operatorToken = Operator(operator: character, priority: getOperatorPrecedence(operator: character))
                tokenization.append(operatorToken)
            } else if character == equalSignToken {
                let operandToken = Operand(operand: digitNumber)
                tokenization.append(operandToken)
            }
        }
        
        return tokenization
    }
}

struct ExpressionSyntaxAnalyzer {
    func convertInfixToPostfix(tokenization: [Token]) -> [Token] {
        var postfixExpression = [Token]()
        var operators = Stack<Operator>()
        
        for token in tokenization {
            if let operand = token as? Operand {
                postfixExpression.append(operand)
            } else if let `operator` = token as? Operator {
                if operators.isEmpty {
                    operators.push(element: `operator`)
                } else {
                    while let previousStoredOperator = operators.peek(), previousStoredOperator >= `operator` {
                        postfixExpression.append(previousStoredOperator)
                        _ = operators.pop()
                    }
                    operators.push(element: `operator`)
                }
            }
        }
        
        while !operators.isEmpty {
            if let previousStoredOperator = operators.pop() {
                postfixExpression.append(previousStoredOperator)
            }
        }
        
        return postfixExpression
    }
}

func calculate(expression: [Token]) -> Int {
    var operands = Stack<Operand>()
    var calculateResult: Int = 0
    
    for token in expression {
        if let operand = token as? Operand {
            operands.push(element: operand)
        } else if let `operator` = token as? Operator {
            switch `operator`.operator {
            case "+":
                guard let secondOperand = operands.pop()?.operand else { return 0 }
                guard let firstOperand = operands.pop()?.operand else { return 0 }
                let result = Operand(operand: firstOperand + secondOperand)
                operands.push(element: result)
            case "-":
                guard let secondOperand = operands.pop()?.operand else { return 0 }
                guard let firstOperand = operands.pop()?.operand else { return 0 }
                let result = Operand(operand: firstOperand - secondOperand)
                operands.push(element: result)
            case "*":
                guard let secondOperand = operands.pop()?.operand else { return 0 }
                guard let firstOperand = operands.pop()?.operand else { return 0 }
                let result = Operand(operand: firstOperand * secondOperand)
                operands.push(element: result)
            case "/":
                guard let secondOperand = operands.pop()?.operand else { return 0 }
                guard let firstOperand = operands.pop()?.operand else { return 0 }
                let result = Operand(operand: firstOperand / secondOperand)
                operands.push(element: result)
            default:
                print("error") // error
            }
        }
    }
    
    if let result = operands.pop() {
        calculateResult = result.operand
    }
    
    return calculateResult
}

let ex = ExpressionLexicalAnalyzer()
let a = ex.convertExpressionToToken(expression: "5+4*3-1=")
let ex2 = ExpressionSyntaxAnalyzer()
let b = ex2.convertInfixToPostfix(tokenization: a!)

print(calculate(expression: b))
