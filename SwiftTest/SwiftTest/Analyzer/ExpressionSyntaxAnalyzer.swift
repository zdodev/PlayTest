struct ExpressionSyntaxAnalyzer {
    func convertInfixToPostfix(tokenization: [Token]) -> [Token] {
        var postfixExpression = [Token]()
        var operators = Stack<Operator>()
        
        for token in tokenization {
            if let operand = token as? IntegerOperand {
                postfixExpression.append(operand)
            } else if let operand = token as? RealNumberOperand {
                postfixExpression.append(operand)
            } else if let `operator` = token as? Operator {
                if operators.isEmpty {
                    operators.push(element: `operator`)
                } else {
                    while let previousStoredOperator = operators.peek(), previousStoredOperator >= `operator` {
                        postfixExpression.append(previousStoredOperator)
                        _ = operators.pop()
                    }
                    operators.push(element: `operator`)
                }
            }
        }
        
        while !operators.isEmpty {
            if let previousStoredOperator = operators.pop() {
                postfixExpression.append(previousStoredOperator)
            }
        }
        
        return postfixExpression
    }
}
