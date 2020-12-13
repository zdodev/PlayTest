
let expressions = [
    "12 + 23 - 34",
    "12 + 23 * 34 - 45",
    "12.23 + 34 * -45"
]

let a = ExpressionAnalyzer()
let b = TokenAnalyzer()
let c = a.convertExpressionToToken(expression: expressions[2])
let d = b.convertInfixToPostfix(tokenExpression: c!)
let e = Calculator()
let f = e.calculate(postfixTokenExpression: d!)

if let k = f as? RealNumberOperand {
    print(k.value, 12.23 + 34 * -45)
}

let binaryExpressions = [
    "1010",
    "101010",
    "10101010"
]
