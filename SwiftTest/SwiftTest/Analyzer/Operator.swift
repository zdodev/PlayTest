class Operator: Token {
    let value: Character
    
    init(value: Character, priority: OperatorPrecedence) {
        self.value = value
        super.init(priority: priority)
    }
    
    static func getOperatorPrecedence(`operator`: Character) -> OperatorPrecedence {
        switch `operator` {
        case "*", "/":
            return .high
        case "+", "-":
            return .middle
        default:
            return .low
        }
    }
}
