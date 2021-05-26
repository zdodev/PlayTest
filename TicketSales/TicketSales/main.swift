import Foundation

struct Invitation {
    let when: Date
}

struct Ticket {
    private var fee: Int = 1
    
    func getFee() -> Int {
        fee
    }
}

class Bag {
    private var amount: Int
    private var invitation: Invitation?
    private var ticket: Ticket?
    
    init(amount: Int) {
        self.amount = amount
    }
    
    init(invitation: Invitation, amount: Int) {
        self.invitation = invitation
        self.amount = amount
    }
    
    func hold(ticket: Ticket) -> Int {
        if hasInvitation() {
            setTicket(ticket: ticket)
            return 0
        } else {
            setTicket(ticket: ticket)
            minusAmount(amount: ticket.getFee())
            return ticket.getFee()
        }
    }
    
    private func hasInvitation() -> Bool {
        invitation != nil
    }
    
    private func setTicket(ticket: Ticket) {
        self.ticket = ticket
    }
    
    private func minusAmount(amount: Int) {
        self.amount -= amount
    }
}

class Audience {
    private var bag: Bag
    
    init(bag: Bag) {
        self.bag = bag
    }
    
    func buy(ticket: Ticket) -> Int {
        bag.hold(ticket: ticket)
    }
}

class TicketOffice {
    private var amount: Int = 0
    private var tickets: [Ticket]

    init(amount: Int, tickets: [Ticket]) {
        self.amount = amount
        self.tickets = tickets
    }
    
    func sellTicketTo(audience: Audience) {
        plusAmount(amount: amount)
    }

    func getTicket() -> Ticket? {
        tickets.first
    }
    
    private func plusAmount(amount: Int) {
        self.amount += amount
    }
}

class TicketSeller {
    private let ticketOffice: TicketOffice
    
    init(ticketOffice: TicketOffice) {
        self.ticketOffice = ticketOffice
    }
    
    func sellTo(audience: Audience) {
        ticketOffice.sellTicketTo(audience: audience)
    }
}

class Theater {
    private let ticketSeller: TicketSeller
    
    init(ticketSeller: TicketSeller) {
        self.ticketSeller = ticketSeller
    }
    
    func enter(audience: Audience) {
        ticketSeller.sellTo(audience: audience)
    }
}
