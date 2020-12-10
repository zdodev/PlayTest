struct ExpressionLexicalAnalyzer {
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
    
    func convertExpressionToToken(expression: String) -> [Token]? {
        var tokenization = [Token]()
        var digitNumber = 0
        let operatorsTokens: [Character] = ["+", "-", "*", "/"]
        let equalSignToken: Character = "="
        
        for character in expression {
            if character.isHexDigit {
                guard let digitValue = character.hexDigitValue else {
                    return nil
                }
                digitNumber = digitNumber * 10 + digitValue
            } else if operatorsTokens.contains(character) {
                let operandToken = Operand(operand: digitNumber)
                tokenization.append(operandToken)
                digitNumber = 0
                
                let operatorToken = Operator(operator: character, priority: getOperatorPrecedence(operator: character))
                tokenization.append(operatorToken)
            } else if character == equalSignToken {
                let operandToken = Operand(operand: digitNumber)
                tokenization.append(operandToken)
            }
        }
        
        return tokenization
    }
}
