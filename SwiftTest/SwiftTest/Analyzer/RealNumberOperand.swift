class RealNumberOperand: Token {
    let operand: Int
    
    init(operand: Int) {
        self.operand = operand
        super.init(priority: .low)
    }
}
