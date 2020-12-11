struct Calculator {
    func calculate(expression: [Token]) -> Int {
        var operands = Stack<IntegerOperand>()
        var calculateResult: Int = 0
        
        for token in expression {
            if let operand = token as? IntegerOperand {
                operands.push(element: operand)
            } else if let `operator` = token as? Operator {
                var intermediateResult: IntegerOperand?
                guard let secondOperand = operands.pop()?.value else { return 0 }
                guard let firstOperand = operands.pop()?.value else { return 0 }
                
                switch `operator`.value {
                case "+":
                    intermediateResult = IntegerOperand(value: firstOperand + secondOperand)
                case "-":
                    intermediateResult = IntegerOperand(value: firstOperand - secondOperand)
                case "*":
                    intermediateResult = IntegerOperand(value: firstOperand * secondOperand)
                case "/":
                    intermediateResult = IntegerOperand(value: firstOperand / secondOperand)
                default:
                    print("error") // error
                }
                
                guard let result = intermediateResult else { return 0 }
                operands.push(element: result)
            }
        }
        
        if let result = operands.pop() {
            calculateResult = result.value
        }
        
        return calculateResult
    }
}
