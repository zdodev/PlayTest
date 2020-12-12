protocol OperandToken {
}

class IntegerOperand: Token, OperandToken {
    let value: Int

    init(value: Int) {
        self.value = value
        super.init(priority: .low)
    }
}

class Operand {
    let value: OperandToken
    
    init(operand: OperandToken) {
        value = operand
    }
    
    func aa() {
    }
}
