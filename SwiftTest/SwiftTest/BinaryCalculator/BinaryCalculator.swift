struct BinaryCalculator {
    func calculate(postfixTokenExpression: [BinaryToken]) -> BinaryToken? {
        var temporaryOperandStorage = Stack<BinaryToken>()

        for token in postfixTokenExpression {
            switch token {
            case let binaryOperandToken as BinaryOperand:
                temporaryOperandStorage.push(element: binaryOperandToken)
            case let operatorToken as BinaryOperator:
                var intermediateCalculationToken: BinaryToken?
                
                if operatorToken.value == .bitwiseNOT {
                    guard let firstToken = temporaryOperandStorage.pop() else { return nil }
                    guard let singleOperand = firstToken as? BinaryOperand else { return nil }
                    intermediateCalculationToken = BinaryOperand(value: BinaryCalculation.calculate(singleOperand.value, 0, .bitwiseNOT))
                } else {
                    guard let secondToken = temporaryOperandStorage.pop() else { return nil }
                    guard let firstToken = temporaryOperandStorage.pop() else { return nil }
                    guard let secondOperand = secondToken as? BinaryOperand else { return nil }
                    guard let firstOperand = firstToken as? BinaryOperand else { return nil }
                    
                    intermediateCalculationToken = BinaryOperand(value: BinaryCalculation.calculate(firstOperand.value, secondOperand.value, operatorToken.value))
                }

                guard let intermediateCalculationResult = intermediateCalculationToken else { return nil }
                temporaryOperandStorage.push(element: intermediateCalculationResult)
            default:
                return nil
            }
        }
        
        guard let calculationResultToken = temporaryOperandStorage.pop() else { return nil }
        return calculationResultToken
    }
}
