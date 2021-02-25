import Foundation

struct Test {
    var p1: Int
    var p2: Int
    
    mutating func method(_ pa: Int) {
        p1 = pa
    }
}

var numbers = [1, 2, 3, 4, 5]
var firstCopy = numbers
var secondCopy = numbers

// The storage for 'numbers' is copied here
//numbers[0] = 100
//numbers[1] = 200
//numbers[2] = 300
// 'numbers' is [100, 200, 300, 4, 5]
// 'firstCopy' and 'secondCopy' are [1, 2, 3, 4, 5]

var a = Test(p1: 3, p2: 4)
var b = a

withUnsafePointer(to: a) {
    print("value \(a) has address \($0)")
}

b.p1 = 3

withUnsafePointer(to: b) {
    print("value \(b) has address \($0)")
}
