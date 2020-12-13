
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
    "1010 + 101 + 111",
    "~ 1010 + 10",
    "1 << 101 >> 1"
]

let binaryExpressionAnalyzer = BinaryExpressionAnalyzer()
let binaryToken = binaryExpressionAnalyzer.convertExpressionToToken(expression: binaryExpressions[2])!
let binaryTokenAnalyzer = BinaryTokenAnalyzer()
let binary = binaryTokenAnalyzer.convertInfixToPostfix(tokenExpression: binaryToken)!
let binaryCalculator = BinaryCalculator()
let result = binaryCalculator.calculate(postfixTokenExpression: binary)
if let re = result as? BinaryOperand {
    print(re.value)
}

//for to in binary! {
//    if let operand = to as? BinaryOperand {
//        print(operand.value)
//    } else if let `operator` = to as? BinaryOperator {
//        print(`operator`.value)
//    }
//}


print(~0b1010 + 0b10)
