class BinaryOperator: BinaryToken {
    enum `Operator`: String, CaseIterable {
        case bitwiseNOT = "~"
        case bitwistLeftShift = "<<"
        case bitwiseRightShift = ">>"
        case bitwiseAND = "&"
        case bitwiseOR = "|"
        case bitwiseXOR = "^"
        case bitwiseNAND = "↑"
        case bitwiseNOR = "↓"
        case addition = "+"
        case substraction = "-"
    }
    
    let value: `Operator`
    
    init(value: `Operator`, priority: BinaryOperatorPrecedence) {
        self.value = value
        super.init(priority: priority)
    }
    
    static func getOperatorPrecedence(`operator`: `Operator`) -> BinaryOperatorPrecedence {
        switch `operator` {
        case .bitwiseNOT:
            return .highest
        case .bitwistLeftShift, .bitwiseRightShift:
            return .high
        case .bitwiseAND:
            return .middle
        case .bitwiseOR, .bitwiseXOR, .bitwiseNAND, .bitwiseNOR, .addition, .substraction:
            return .low
        }
    }
    
    static func convertStringOperatorToArithmeticOperator(`operator`: String) -> DecimalOperator.Arithmetic? {
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
