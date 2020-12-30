import Foundation

// NSObject를 상속하여 오버라이드하는 방식

class Bar: NSObject {
    override var description: String {
        return "Bar Description"
    }
    
    override var debugDescription: String {
        return "Debug Bar Description"
    }
}

// 프로토콜을 채택하는 방식

class Foo: CustomStringConvertible, CustomDebugStringConvertible {
    let name = "Lucas"
    let age = 25
    
    var description: String {
        return "Foo Description"
    }
    
    var debugDescription: String {
        return "Debug Foo Description"
    }
//    var debugDescription: String {
//        let className = type(of: self)
//        let address = "\(Unmanaged.passUnretained(self as AnyObject).toOpaque())"
//        return "<\(className): \(address)>"
//    }
}

extension CustomDebugStringConvertible {
//    var debugDescription: String {
//        let className = type(of: self)
//        let address = "\(Unmanaged.passUnretained(self as AnyObject).toOpaque())"
//        var description = "<\(className): \(address), {"
//        let mirror = Mirror(reflecting: self)
//        description += mirror.children.compactMap {
//            let (label, value) = $0
//            guard let propertyName = label else {
//                return nil
//            }
//            return "\(propertyName): \(value)"
//        }.joined(separator: ", ")
//        description += "}>"
//
//        return description
//    }
}

let bar = Bar()
let foo = Foo()

print(bar)
debugPrint(bar)

print(foo)
debugPrint(foo)
