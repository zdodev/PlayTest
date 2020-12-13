
let expressions = [
    "12 + 23 - 34",
    "12 + 23 * 34 - 45",
    "12.23 + 34 * -45"
]

//let a = DecimalExpressionAnalyzer()
//let b = DecimalTokenAnalyzer()
//let c = a.convertExpressionToToken(expression: expressions[2])
//let d = b.convertInfixToPostfix(tokenExpression: c!)
//let e = DecimalCalculator()
//let f = e.calculate(postfixTokenExpression: d!)

//if let k = f as? RealNumberOperand {
//    print(k.value, 12.23 + 34 * -45)
//}
//
let binaryExpressions = [
    "1010 + 101",
    "101010",
    "10101010"
]

let binaryExpressionAnalyzer = BinaryExpressionAnalyzer()
let binaryToken = binaryExpressionAnalyzer.convertExpressionToToken(expression: binaryExpressions[0])!
let binaryTokenAnalyzer = BinaryTokenAnalyzer()
let binary = binaryTokenAnalyzer.convertInfixToPostfix(tokenExpression: binaryToken)
print(binary)
