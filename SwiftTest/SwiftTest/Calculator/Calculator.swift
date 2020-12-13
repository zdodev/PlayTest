struct Calculator {
    func calculate(postfixTokenExpression: [Token]) -> Token? {
        var temporaryOperandStorage = Stack<Token>()

        for token in postfixTokenExpression {
            switch token {
            case let integerOperandToken as IntegerOperand:
                temporaryOperandStorage.push(element: integerOperandToken)
            case let realNumberOperandToken as RealNumberOperand:
                temporaryOperandStorage.push(element: realNumberOperandToken)
            case let operatorToken as DecimalOperator:
                guard let secondToken = temporaryOperandStorage.pop() else { return nil }
                guard let firstToken = temporaryOperandStorage.pop() else { return nil }
                var intermediateCalculationToken: Token?
                
                if let secondOperand = secondToken as? IntegerOperand {
                    if let firstOperand = firstToken as? IntegerOperand {
                        intermediateCalculationToken = IntegerOperand(value: Calculation.calculate(firstOperand.value, secondOperand.value, operatorToken.value))
                    } else if let firstOperand = firstToken as? RealNumberOperand {
                        intermediateCalculationToken = RealNumberOperand(value: Calculation.calculate(firstOperand.value, secondOperand.value, operatorToken.value))
                    }
                } else if let secondOperand = secondToken as? RealNumberOperand {
                    if let firstOperand = firstToken as? IntegerOperand {
                        intermediateCalculationToken = RealNumberOperand(value: Calculation.calculate(firstOperand.value, secondOperand.value, operatorToken.value))
                    } else if let firstOperand = firstToken as? RealNumberOperand {
                        intermediateCalculationToken = RealNumberOperand(value: Calculation.calculate(firstOperand.value, secondOperand.value, operatorToken.value))
                    }
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
