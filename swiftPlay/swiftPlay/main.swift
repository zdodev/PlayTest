struct StructureSingleton {
    static let singleton = StructureSingleton()
    var number = 100
}

var firstStructureSingleton = StructureSingleton.singleton
var secondStructureSingleton = StructureSingleton.singleton

withUnsafePointer(to: &firstStructureSingleton) {
    print("첫 번째 구조체 주소: \($0)")
}

withUnsafePointer(to: &secondStructureSingleton) {
    print("두 번째 구조체 주소: \($0)")
}

withUnsafePointer(to: &firstStructureSingleton.number) {
    print("첫 번째 구조체의 프로퍼티 주소: \($0)")
}

withUnsafePointer(to: &secondStructureSingleton.number) {
    print("두 번째 구조체의 프로퍼티 주소: \($0)")
}

class ClassSingleton {
    static let singleton = ClassSingleton()
    var number = 100
}

var firstClassSingleton = ClassSingleton.singleton
var secondClassSingleton = ClassSingleton.singleton

withUnsafePointer(to: &firstClassSingleton) {
    print("첫 번째 클래스 주소: \($0)")
}

withUnsafePointer(to: &secondClassSingleton) {
    print("두 번째 클래스 주소: \($0)")
}

withUnsafePointer(to: &firstClassSingleton.number) {
    print("첫 번째 클래스의 프로퍼티 주소: \($0)")
}

withUnsafePointer(to: &secondClassSingleton.number) {
    print("두 번째 클래스의 프로퍼티 주소: \($0)")
}
