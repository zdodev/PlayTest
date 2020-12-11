struct ExpressionLexicalAnalyzer {
    func convertExpressionToToken(expression: String) -> [Token]? {
        var tokenization = [Token]()
        var stringNumber: String = ""
//        var integerDigitNumber = 0
//        var realDigitNumber = 0
        let operatorsTokens: [Character] = ["+", "-", "*", "/"]
        let pointSignToken: Character = "."
        let equalSignToken: Character = "="
        
        for character in expression {
            if character.isHexDigit || character == pointSignToken {
                stringNumber.append(character)
//                guard let digitValue = character.hexDigitValue else {
//                    return nil
//                }
//                digitNumber = digitNumber * 10 + digitValue
            } else if operatorsTokens.contains(character) {
                if let integerDigitNumber = Int(stringNumber) {
                    let operandToken = IntegerOperand(value: integerDigitNumber)
                    tokenization.append(operandToken)
                } else if let realDigitNumber = Double(stringNumber) {
                    let operandToken = RealNumberOperand(value: realDigitNumber)
                    tokenization.append(operandToken)
                }
                
                let operatorToken = Operator(value: character, priority: Operator.getOperatorPrecedence(operator: character))
                tokenization.append(operatorToken)
            } else if character == equalSignToken {
                if let integerDigitNumber = Int(stringNumber) {
                    let operandToken = IntegerOperand(value: integerDigitNumber)
                    tokenization.append(operandToken)
                } else if let realDigitNumber = Double(stringNumber) {
                    let operandToken = RealNumberOperand(value: realDigitNumber)
                    tokenization.append(operandToken)
                }
            }
        }
        
        return tokenization
    }
}
