protocol Judge {
    mutating func requireWitnessAttendance(witness: Witness)
    func demandTestimony()
}

protocol Witness {
    func testify()
}

struct King: Judge {
    private var witness: Witness?
    
    mutating func requireWitnessAttendance(witness: Witness) {
        self.witness = witness
    }
    
    func demandTestimony() {
        guard let witness = witness else {
            return
        }
        
        witness.testify()
    }
}

struct Rabbit: Witness {
    func testify() {
        print("I am innocent.")
    }
}

var king = King()
let rabbit = Rabbit()
king.requireWitnessAttendance(witness: rabbit)
king.demandTestimony()
