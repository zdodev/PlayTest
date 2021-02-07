print("ee")

func test() {
    
}

let a = { coin -> Int  in
    print(coin)
    return 3
}("a3")

let b = test()
print(a)
print(b)

func test2() -> Int {
    8
}

struct Target {
    let a = test2()
}

print(Target().a)
