//struct Calculator {
//    func calculate(expression: [Token]) -> Double {
//        var operands = Stack<Token>()
//        var calculateResult: Double = 0
//
//        for token in expression {
//            if let operand = token as? IntegerOperand {
//                operands.push(element: operand)
//            } else if let operand = token as? RealNumberOperand {
//                operands.push(element: operand)
//            } else if let `operator` = token as? Operator {
//
//                var intermediateResult: IntegerOperand?
//
//                guard let secondOperand = operands.pop()?.value else { return 0 }
//                guard let firstOperand = operands.pop()?.value else { return 0 }
//                print("firstoperand: ", firstOperand, "secondoperand: ", secondOperand)
//
//                switch `operator`.value {
//                case "+":
//                    intermediateResult = IntegerOperand(value: firstOperand + secondOperand)
//                case "-":
//                    intermediateResult = IntegerOperand(value: firstOperand - secondOperand)
//                case "*":
//                    intermediateResult = IntegerOperand(value: firstOperand * secondOperand)
//                case "/":
//                    intermediateResult = IntegerOperand(value: firstOperand / secondOperand)
//                default:
//                    print("error") // error
//                }
//
//                guard let result = intermediateResult else { return 0 }
//                operands.push(element: result)
//            }
//        }
//
//        if let result = operands.pop() {
//            calculateResult = Double(result.value)
//        }
//
//        return Double(calculateResult)
//    }
//}

struct Calculation {
    func calculate(_ lhs: Int, _ rhs: Int, `operator`: Operator.Arithmetic) -> Int {
        switch `operator` {
        case .addition:
            return add(<#T##lhs: Int##Int#>, <#T##rhs: Int##Int#>)
        case .substraction:
            subtract(lhs, rhs)
            
        default:
            <#code#>
        }
    }
    
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
    
    func subtract(_ lhs: Int, _ rhs: Int) -> Int {
        lhs - rhs
    }
    
    func subtract(_ lhs: Int, _ rhs: Double) -> Double {
        Double(lhs) - rhs
    }
    
    func subtract(_ lhs: Double, _ rhs: Int) -> Double {
        lhs - Double(rhs)
    }
    
    func subtract(_ lhs: Double, _ rhs: Double) -> Double {
        Double(lhs) - Double(rhs)
    }
}

struct Calculator {
    func calculate(postfixTokenExpression: [Token]) -> Token? {
        var temporaryOperandStorage = Stack<Token>()

        for token in postfixTokenExpression {
            switch token {
            case let integerOperandToken as IntegerOperand:
                temporaryOperandStorage.push(element: integerOperandToken)
            case let realNumberOperandToken as RealNumberOperand:
                temporaryOperandStorage.push(element: realNumberOperandToken)
            case let operatorToken as Operator:
                guard let secondToken = temporaryOperandStorage.pop() else { return nil }
                guard let firstToken = temporaryOperandStorage.pop() else { return nil }
                var intermediateCalculationResult: Token
                
                if let secondOperand = secondToken as? IntegerOperand {
                    if let firstOperand = firstToken as? IntegerOperand {
                        intermediateCalculationResult = IntegerOperand(value: Calculate.add(secondOperand.value, firstOperand.value))
                    }
                }
                
            default:
                <#code#>
            }
        }
    }
}


//        var operands = Stack<Token>()
//        var calculateResult: Double = 0
//
//        for token in expression {
//            if let operand = token as? IntegerOperand {
//                operands.push(element: operand)
//            } else if let operand = token as? RealNumberOperand {
//                operands.push(element: operand)
//            } else if let `operator` = token as? Operator {
//
//                var intermediateResult: IntegerOperand?
//
//                guard let secondOperand = operands.pop()?.value else { return 0 }
//                guard let firstOperand = operands.pop()?.value else { return 0 }
//                print("firstoperand: ", firstOperand, "secondoperand: ", secondOperand)
//
//                switch `operator`.value {
//                case "+":
//                    intermediateResult = IntegerOperand(value: firstOperand + secondOperand)
//                case "-":
//                    intermediateResult = IntegerOperand(value: firstOperand - secondOperand)
//                case "*":
//                    intermediateResult = IntegerOperand(value: firstOperand * secondOperand)
//                case "/":
//                    intermediateResult = IntegerOperand(value: firstOperand / secondOperand)
//                default:
//                    print("error") // error
//                }
//
//                guard let result = intermediateResult else { return 0 }
//                operands.push(element: result)
//            }
//        }
//
//        if let result = operands.pop() {
//            calculateResult = Double(result.value)
//        }
//
//        return Double(calculateResult)
//}
