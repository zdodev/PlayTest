class Token {
    private let priority: DecimalOperatorPrecedence
    
    init(priority: DecimalOperatorPrecedence) {
        self.priority = priority
    }
}

extension Token: Comparable {
    static func < (lhs: Token, rhs: Token) -> Bool {
        lhs.priority < rhs.priority
    }
    
    static func == (lhs: Token, rhs: Token) -> Bool {
        lhs.priority == rhs.priority
    }
}
