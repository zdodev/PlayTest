
// 버튼 재사용성의 문제
class Button {
    private let dialer: Dialer
    
    init(dialer: Dialer) {
        self.dialer = dialer
    }
}

class Dialer {
    
}

class Button1 {
    let token: Int = {
        Int.random(in: 1...10)
    }()
    let buttonListener: ButtonListener
    
    init(buttonListener: ButtonListener) {
        self.buttonListener = buttonListener
    }
    
    func press() {
        buttonListener.buttonPressed(token: token)
    }
}

protocol ButtonListener {
    func buttonPressed(token: Int)
}

class Dialer1: ButtonListener {
    func buttonPressed(token: Int) {
        print("이잉, \(token)")
    }
}

let dialer = Dialer1()

let button = Button1(buttonListener: dialer)
button.press()
