func add(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    method(a, b)
}


func sub1(a: Int, b: Int) -> Int {
    return a - b
}

//var c: Int = 10
//c = 20
//c = 30

func sub2(a: Int, b: Int, method: (Int, Int) -> Int) -> Int {
    let c = 10
    return a - b - c
    return sub1(a: a, b: b)
    return method(a, b)
}

print(sub2(a: 5, b: 3, method: sub1))
