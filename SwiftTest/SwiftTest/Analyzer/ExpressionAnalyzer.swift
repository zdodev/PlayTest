struct ExpressionAnalyzer {
    func convertExpressionToToken(expression: String) -> [Token]? {
        let splitString = expression.split(separator: " ")
        let arithmeticOperators: [String] = {
            var operatorRawValues = [String]()
            Operator.Arithmetic.allCases.forEach {
                operatorRawValues.append($0.rawValue)
            }
            return operatorRawValues
        }()
        var tokenExpression = [Token]()
        
        for element in splitString {
            let stringElement = String(element)
            if let integer = Int(stringElement) {
                tokenExpression.append(IntegerOperand(value: integer))
            } else if let realNumber = Double(stringElement) {
                tokenExpression.append(RealNumberOperand(value: realNumber))
            } else if arithmeticOperators.contains(stringElement) {
                guard let arithmeticOperator = Operator.convertStringOperatorToArithmeticOperator(operator: stringElement) else {
                    return nil
                }
                tokenExpression.append(Operator(value: arithmeticOperator, priority: Operator.getOperatorPrecedence(operator: arithmeticOperator)))
            }
        }
        
        return tokenExpression
    }
}
