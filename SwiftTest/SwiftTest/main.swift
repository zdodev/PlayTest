struct Stack<T> {
    var elements = [T]()
    
    mutating func push(element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        elements.popLast()
    }
    
    func peek() -> T? {
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
    var tokens = Stack<Token>()
    
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

var infixTokens = [Token]()

func convertExpressionToToken(expression: String) {
    var number = 0
    let operators: [Character] = ["+", "-", "*", "/"]
    
    for character in expression {
        if character.isHexDigit {
            guard let digitValue = character.hexDigitValue else {
                return
            }
            number = number * 10 + digitValue
        } else if operators.contains(character) {
            let operand = Operand(operand: number)
            infixTokens.append(operand)
            number = 0
            
            let `operator` = Operator(operator: character, priority: getOperatorPrecedence(operator: character))
            infixTokens.append(`operator`)
        } else if character == "=" {
            let operand = Operand(operand: number)
            infixTokens.append(operand)
        }
    }
}

func convertInfixToPostfix(tokens: [Token]) -> [Token] {
    var postfixExpression = [Token]()
    var operators = Stack<Operator>()
    
    for token in tokens {
        if let operand = token as? Operand {
            postfixExpression.append(operand)
        } else if let `operator` = token as? Operator {
            if operators.isEmpty {
                operators.push(element: `operator`)
            } else {
                while let previousStoredOperator = operators.peek(), previousStoredOperator >= `operator` {
                    print("왜")
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

let str = "1+2*3+4-5="
convertExpressionToToken(expression: str)
let a = convertInfixToPostfix(tokens: infixTokens)
printToken(a: a)

func printToken(a: [Token]) {
for ch in a {
    if let operand = ch as? Operand {
        print(operand.operand)
    } else if let `operator` = ch as? Operator {
        print(`operator`.operator)
    }
}
}

