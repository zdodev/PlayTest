protocol Coffee {
    var taste: String { get }
}

struct Americano: Coffee {
    let taste = "americano"
}

struct Latte: Coffee {
    let taste = "latte"
}

struct VendingMachine {
    func makeCoffee(coffee: Coffee) -> String {
        coffee.taste
    }
}

struct Button {
    let vendingMachine = VendingMachine() 
    
    func pressAmericanoButton() -> String {
        vendingMachine.makeCoffee(coffee: Americano())
//        let coffee = vendingMachine.makeCoffee(coffee: <#T##Coffee#>)
    }
    
    func pressLatteButton() -> String {
        vendingMachine.makeCoffee(coffee: Latte())
    }
}

var button = Button()
let coffee = button.pressAmericanoButton()
print(coffee)
