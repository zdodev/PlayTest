class FruitA {
    var stock: Int = 0
    
    func add(count: Int) {
        stock += count
    }
    
    func subtract(count: Int) {
        stock -= count
    }
}

struct FruitB {
    var stock: Int = 0
    
    mutating func add(count: Int) {
        stock += count
    }
    
    mutating func subtract(count: Int) {
        stock -= count
    }
}

struct ManagerA {
    var fruits = [String: FruitA]()
    
    init() {
        fruits = ["a": FruitA(), "b": FruitA()]
    }
    
    func consumeFruit(name: String, amount: Int) {
        guard let fruit = fruits[name] else {
            return
        }
        
        fruit.subtract(count: amount)
    }
}

struct ManagerB {
//    var fruits = [String: FruitB]()
    var fruits = [String: Int]()
//    var fruitsArray = [FruitB]()
    
    init() {
//        fruits = ["a": FruitB(), "b": FruitB()]
        fruits = ["a": 0, "b": 0]
    }
    
    func consumeFruit(name: String, amount: Int) {
        guard var fruit = fruits[name] else {
            return
        }
        
//        fruit.subtract(count: amount)
        fruit -= 3
    }
}

let a = ManagerA()
a.consumeFruit(name: "a", amount: 3)
print(a.fruits["a"]!.stock)

let b = ManagerB()
b.consumeFruit(name: "a", amount: 3)
//print(b.fruits["a"]!.stock)
print(b.fruits["a"]!)
