class RealNumberOperand: Token {
    let value: Double
    
    init(value: Double) {
        self.value = value
        super.init(priority: .low)
    }
}
