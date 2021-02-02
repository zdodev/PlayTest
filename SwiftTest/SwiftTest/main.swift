
let ab: Int? = 4

var a: Any = ab

if a is Int {
    print("ee")
    var b = a as! Int
    print(b)
}

print("asdf\(a)")
