func task1(_ doing: ((Int, Int), Int) -> Int) -> Int {
    doing((1, 2), 3)
}

let result1 = task1 { (a, b) -> Int in
    a.0 + a.1 + b
}

print(result1)

func task2(_ doing: ((Int, Int), Int) -> Int) -> Int {
    doing((1, 2), 3)
}

let result2 = task2 { a, b -> Int in
    a.0 + a.1 + b
}

print(result2)
