struct Calculator {
    func calculate(expression: [Token]) -> Double {
        var operands = Stack<Token>()
        var calculateResult: Double = 0
        
        for a in expression {
            switch a {
            case let a as IntegerOperand:
                print(a.value)
            case let a as RealNumberOperand:
                print(a.value)
            case let a as Operator:
                print(a.value)
            default:
                print("ee")
            }
        }
        
        for token in expression {
            if let operand = token as? IntegerOperand {
                operands.push(element: operand)
            } else if let operand = token as? RealNumberOperand {
                operands.push(element: operand)
            } else if let `operator` = token as? Operator {
                
//                var intermediateResult: IntegerOperand?
                
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
            }
        }
        
//        if let result = operands.pop() {
//            calculateResult = Double(result.value)
//        }
        
        return Double(calculateResult)
    }
}
