class Operator: Token {
    let `operator`: Character
    
    init(`operator`: Character, priority: OperatorPrecedence) {
        self.operator = `operator`
        super.init(priority: priority)
    }
}
