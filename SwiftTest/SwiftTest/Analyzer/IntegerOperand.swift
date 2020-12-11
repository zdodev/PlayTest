class IntegerOperand: Token {
    let value: Int
    
    init(operand: Int) {
        self.value = operand
        super.init(priority: .low)
    }
}
