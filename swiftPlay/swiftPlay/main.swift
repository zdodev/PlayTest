protocol myDelegate {
    func myDelegatePrintFunciton(number: Int)
}

class MyDelegateClass {
    var delegate: myDelegate?
    
    func execute(number: Int) {
        print("execute 기능 실행")
        delegate?.myDelegatePrintFunciton(number: number)
    }
}

class MyController {
    var myClass: MyDelegateClass!
    
    init() {
        myClass = MyDelegateClass()
        myClass.delegate = self
    }
    
    func move(number: Int) {
        print("move 기능 실행")
        myClass.execute(number: number)
    }
}

extension MyController: myDelegate {
    func myDelegatePrintFunciton(number: Int) {
        print("my number is \(number)")
    }
}

let myController = MyController()
myController.move(number: 5)
