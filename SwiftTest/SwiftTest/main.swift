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

let group1 = [1, 2, 3]
let group2 = [1, 3, 4]

print(group1)
print(group2)

var dic: [Int?: String] = [:]
dic[nil] = "nil"
dic[1] = "1"

print(dic[nil])
print(dic[1])
