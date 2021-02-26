import Foundation

struct AAA {
    var name: String
    
//    mutating func chnageName(_ name: String) {
//        self.name = name
//    }
}

var aaa = AAA(name: "abc")

withUnsafePointer(to: aaa) {
    print($0)
}

withUnsafePointer(to: aaa) {
    print($0)
}

withUnsafePointer(to: aaa) {
    print($0)
}

let a = "abc" - "bcd"
