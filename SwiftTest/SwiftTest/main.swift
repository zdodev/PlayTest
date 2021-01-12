var str1 = ""
var str2 = "1"

let str3 = ""
let str4 = "a"

let a = MemoryLayout<String>.size
print(a)

struct St {
    var a = 1
    var b = 2
    var c = 3
}

let b = St()

print(MemoryLayout.size(ofValue: b))
