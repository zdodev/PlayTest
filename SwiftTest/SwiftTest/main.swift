import Foundation

let date = Date()
let s = date.description

let dateFormatter = DateFormatter()
let date1 = dateFormatter.date(from: s)
let date2 = dateFormatter.string(from: date)

