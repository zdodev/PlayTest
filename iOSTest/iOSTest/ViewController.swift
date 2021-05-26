import UIKit

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var aaa = AAA(name: "aaa")
        withUnsafePointer(to: aaa) {
            print($0)
        }
        aaa.changeName("bbb")
        withUnsafePointer(to: aaa) {
            print($0)
        }
        aaa.changeName("ccc")
        withUnsafePointer(to: aaa) {
            print($0)
        }
        aaa.changeName("ddd")
        withUnsafePointer(to: aaa) {
            print($0)
        }
        aaa.changeName("eee")
        withUnsafePointer(to: aaa) {
            print($0)
        }
        aaa.changeName("fff")
        withUnsafePointer(to: aaa) {
            print($0)
        }
    }
}

struct AAA {
    var name: String
    
    mutating func changeName(_ name: String) {
        self.name = name
    }
}
