import Foundation
//import SwiftSoup
//
//let investingURL = "https://www.investing.com"
//
//if let url = URL(string: investingURL) {
//    let html = try String(contentsOf: url)
//    let doc = try parse(html)
//    let elements = try doc.select("#navMenu > ul > li:nth-child(1) > a")
//    for element in elements {
//        print(element)
//    }
//    print(try elements[0].text())
//}

//body > div.generalOverlay.js-general-overlay.displayNone
///html/body/div[3]
//#navMenu > ul > li:nth-child(1) > a

struct Point: CustomStringConvertible {
    var description: String = "(x, y)"
    
    var x: Int
    var y: Int
}

let point = Point(x: 10, y: 20)

print(point.description) // X, 직접 프로퍼티에 접근하지 마라.
print(point)

struct Point2<T: CustomStringConvertible> {
    var description: String = "포인트2"
    var x: T
    var y: T
}

let point2 = Point2(x: 3, y: 4)
print(point2)
let e = Int(3)
print(3.description)

class LinkedList {
    var node: LinkedList
    var data: Int
    
    init(_ node: LinkedList, _ data: Int) {
        self.node = node
        self.data = data
    }
}
