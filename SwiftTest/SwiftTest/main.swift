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

//class Lexer {
//    var tokens = Stack<Token>()
//
//    func makeToken(expression: String) {
//        var index = 0
//        if isOperator(character: str[String.Index(utf16Offset: index, in: str)]) {
//            tokens.push(element: Operator(operator: str[String.Index(utf16Offset: index, in: str)]))
//            index += 1
//        } else if isNumber(character: str[String.Index(utf16Offset: index, in: str)]) {
//            var number: Int = 0
//
//            while isNumber(character: str[String.Index(utf16Offset: index, in: str)]) {
//                guard let digit = str[String.Index(utf16Offset: index, in: str)].hexDigitValue else {
//                    return
//                }
//                number = number * 10 + digit
//                index += 1
//            }
//            tokens.push(element: Operand(operand: number))
//        }
//    }
//
//    func isNumber(character: Character) -> Bool {
//        character.isNumber
//    }
//
//    func isOperator(character: Character) -> Bool {
//        let delimiters: [Character] = ["+", "-", "*", "/"]
//        return delimiters.contains(character)
//    }
//}

class Token {
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

enum OperatorPrecedence {
    case high
    case middle
    case low
}

func getOperatorPrecedence(`operator`: Character) -> OperatorPrecedence {
    switch `operator` {
    case "*", "/":
        return .high
    case "+", "0":
        return .middle
    default:
        return .low
    }
}

var tokens = [Token]()

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
            tokens.append(operand)
            number = 0
            
            let `operator` = Operator(operator: character, priority: getOperatorPrecedence(operator: character))
            tokens.append(`operator`)
        } else if character == "=" {
            let operand = Operand(operand: number)
            tokens.append(operand)
        }
    }
}

let str = "11+2*3="
convertExpressionToToken(expression: str)

/*
for ch in tokens {
    if let operand = ch as? Operand {
        print(operand.operand)
    } else if let `operator` = ch as? Operator {
        print(`operator`.operator)
    }
}
 */

