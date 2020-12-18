protocol Calculatable {
    var fileName: String { get set }
    func add()
}

class decimalClass: Calculatable {
    var fileName: String = "file"
    
    func add() {
        print("decimal 더하기...")
    }
    func sub() {
        print("decimal 빼기...")
    }
    func mul() {
        print("decimal 빼기...")
    }
    func div() {
        print("더좋은 나누셈")
    }
}

class binaryClass: Calculatable {
    var fileName: String = "file"

    func add() {
        print("binary 더하기...")
    }
}

var a: Calculatable = decimalClass()
a.add()

a = binaryClass()
a.add()
