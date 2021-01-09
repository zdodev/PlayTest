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

//let queue = DispatchQueue(label: "serial")
//
//let task: (String, String) -> Void = { task, item in
//    (1...3).forEach { index in
//        print("\(task)", item, "Index: \(index)")
//    }
//}
//
//queue.async {
//    // task1
//    print("register 1")
//    print("Serial 1", Thread.current)
//    task("task 1", "🍕")
//    task("task 1", "⚽️")
//}
//print(":---:")
//
//queue.async {
//    // task2
//    print("register 2")
//    print("Serial 3", Thread.current)
//    task("task 2", "🍕")
//    task("task 2", "⚽️")
//}
//print(":---:")
//
//queue.async {
//    // task3
//    print("register 3")
//    print("Serial 5", Thread.current)
//    task("task 3", "🍕")
//    task("task 3", "⚽️")
//}


//DispatchQueue.global().async {
//    for index in 1...10 {
//        print(index)
//    }
//}

//let queue = DispatchQueue(label: "MyQueue")
//
//DispatchQueue.global().async {
//    print("Task1 Done")
//}
//print("Task1 queued")

//queue.sync {
//    print("Task2 Done")
//}
//print("Task2 queued")

var a: Int?

let group = DispatchGroup()

// avoid deadlocks by not using .main queue here

for index in 0...9 {
    group.enter()
    DispatchQueue.global().async {
        a = 1
        print("\(index) ee")
        group.leave()
    }

}
// wait ...
group.wait()

//print(a) // you could also `return a` here


//let group = DispatchGroup()
//group.enter()
//DispatchQueue.global().async() {
//    print("ee")
//    group.leave()
//}
group.notify(queue: DispatchQueue.global()) {
    print("ee")
}
