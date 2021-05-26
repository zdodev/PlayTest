struct High {
    let highMount: Int
}

protocol MiddleComponent {
    var middleMount: Int { get set }
}

struct FirstMiddle: MiddleComponent {
    var middleMount: Int
    var high: High
}

struct SecondMiddle: MiddleComponent {
    var middleMount: Int
    var high: High
}

struct Low {
    let lowMount: Int
    var middle: MiddleComponent
}

let low = Low(lowMount: 5, middle: FirstMiddle(middleMount: 5, high: High(highMount: 5)))
print(low)
