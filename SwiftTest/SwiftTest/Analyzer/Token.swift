class Token: Comparable {
    static func < (lhs: Token, rhs: Token) -> Bool {
        lhs.priority < rhs.priority
    }
    
    static func == (lhs: Token, rhs: Token) -> Bool {
        lhs.priority == rhs.priority
    }
    
    let priority: OperatorPrecedence
    
    init(priority: OperatorPrecedence) {
        self.priority = priority
    }
}
