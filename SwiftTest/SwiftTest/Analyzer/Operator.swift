class Operator: Token {
    enum Arithmetic {
        case addition
        case substraction
        case multiplication
        case division
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
}
