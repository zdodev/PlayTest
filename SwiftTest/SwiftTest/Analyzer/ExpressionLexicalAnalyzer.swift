//struct ExpressionLexicalAnalyzer {
//    func convertExpressionToToken(expression: String) -> [Token]? {
//        var tokenization = [Token]()
//        var stringNumber: String = ""
////        var integerDigitNumber = 0
////        var realDigitNumber = 0
//        let operatorsTokens: [Character] = ["+", "-", "*", "/"]
//        let pointSignToken: Character = "."
//        let equalSignToken: Character = "="
//
//        for character in expression {
//            if character.isHexDigit || character == pointSignToken {
//                stringNumber.append(character)
//            } else if operatorsTokens.contains(character) {
//                if let integerDigitNumber = Int(stringNumber) {
//                    let operandToken = IntegerOperand(value: integerDigitNumber)
//                    tokenization.append(operandToken)
//                } else if let realDigitNumber = Double(stringNumber) {
//                    let operandToken = RealNumberOperand(value: realDigitNumber)
//                    tokenization.append(operandToken)
//                }
//                stringNumber = ""
//
//                let operatorToken = Operator(value: character, priority: Operator.getOperatorPrecedence(operator: character))
//                tokenization.append(operatorToken)
//            } else if character == equalSignToken {
//                if let integerDigitNumber = Int(stringNumber) {
//                    let operandToken = IntegerOperand(value: integerDigitNumber)
//                    tokenization.append(operandToken)
//                } else if let realDigitNumber = Double(stringNumber) {
//                    let operandToken = RealNumberOperand(value: realDigitNumber)
//                    tokenization.append(operandToken)
//                }
//            }
//        }
//
//        return tokenization
//    }
//}

struct ExpressionAnalyzer {
    // String -> [Token]?
    func convertToToken(expression: String) -> [Token]? {
        let splitString = expression.split(separator: " ")
        let arithmeticOperators: [String] = {
            var operatorRawValues = [String]()
            Operator.Arithmetic.allCases.forEach {
                operatorRawValues.append($0.rawValue)
            }
            return operatorRawValues
        }()
        var tokenExpression = [Token]()
//        var operatorRepository = Stack<String>()
        
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
