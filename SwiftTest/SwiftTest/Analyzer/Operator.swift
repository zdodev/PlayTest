class Operator: Token {
    enum Arithmetic: String, CaseIterable {
        case addition = "+"
        case substraction = "-"
        case multiplication = "*"
        case division = "/"
    }
    
    let value: Arithmetic
    
    init(value: Arithmetic, priority: OperatorPrecedence) {
        self.value = value
        super.init(priority: priority)
    }
    
    static func getOperatorPrecedence(`operator`: Arithmetic) -> OperatorPrecedence {
        switch `operator` {
        case .multiplication, .division:
            return .high
        case .addition, .substraction:
            return .middle
        }
    }
    
    static func convertStringOperatorToArithmeticOperator(`operator`: String) -> Operator.Arithmetic? {
        switch `operator` {
        case "+":
            return .addition
        case "-":
            return .substraction
        case "*":
            return .multiplication
        case "/":
            return .division
        default:
            return nil
        }
    }
}
