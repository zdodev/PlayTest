import Foundation

let text = "aa\nbb\ncc\ndd"
var separated = text.components(separatedBy: "\n")
//var separated = text.split(separator: "\n")
separated.removeFirst()
let c = separated.reduce("") {
    if $0 == "" {
        return String($1)
    }
    return $0 + "\n" + $1
}
print(c)
