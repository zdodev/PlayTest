
protocol Pay {
    func payment()
}

class Cash: Pay {
    func payment() {
        print("Cash..")
    }
}

class Card: Pay {
    func payment() {
        print("Card")
    }
}

class Mobile: Pay {
    func payment() {
        print("Mobile")
    }
}

class PaymentService {
    enum PayType {
        case card
        case cash
        case mobile
    }
    
    private let pay: Pay
    
    init(_ type: PayType) {
        switch type {
        case .card:
            self.pay = Card()
        case .cash:
            self.pay = Cash()
        case .mobile:
            self.pay = Mobile()
        }
    }
    
    func payment() {
        pay.payment()
    }
}

let paymentService = PaymentService(.mobile)
paymentService.payment()

let typep = PaymentService.PayType.cash

