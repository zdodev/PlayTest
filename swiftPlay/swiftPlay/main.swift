struct Singleton {
    static let singleton = Singleton()
    var a = 199
}

var a = Singleton.singleton
var b = Singleton.singleton

a.a = 100

withUnsafePointer(to: &a) {
    print($0)
}

withUnsafePointer(to: &b) {
    print($0)
}

withUnsafePointer(to: &a.a) {
    print($0)
}

withUnsafePointer(to: &b.a) {
    print($0)
}

print(a.a, b.a)
