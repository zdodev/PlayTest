struct AA {
    var member = 3
    
    mutating func bb() {
        member = 4
    }
}

func test(_ a: inout AA) {
    a.bb()
}

var b = AA()
print(b.member)
test(&b)
print(b.member)

