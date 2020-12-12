
let expressions = [
    "12 + 23 - 34",
    "12 + 23 * 34 - 45",
    "12.23 + 34 * -45"
]

//for expression in expressions {
//    let a = expression.split(separator: " ")
//    if let b = Int(a[0]) {
//        print(b)
//    } else if let c = Double(a[0]) {
//        print(c)
//    }
//}

let a = ExpressionAnalyzer()
let b = TokenAnalyzer()
let c = a.convertExpressionToToken(expression: expressions[2])
let d = b.convertInfixToPostfix(tokenExpression: c!)
let e = Calculator()
let f = e.calculate(postfixTokenExpression: d!)

if let k = f as? RealNumberOperand {
    print(k.value, 12.23 + 34 * -45)
}

//if let c = w {
//    for d in c {
//        print(d)
//        if let e = d as? IntegerOperand {
//            print(e.value)
//        } else if let f = d as? RealNumberOperand {
//            print(f.value)
//        } else if let g = d as? Operator {
//            print(g.value.rawValue)
//        }
//    }
//}
