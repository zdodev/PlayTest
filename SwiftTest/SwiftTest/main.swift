import Foundation

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
let date = Date(timeIntervalSince1970: 1620982800)
print(dateFormatter.string(from: date))


let date1 = Date(timeIntervalSince1970: 1620986400)
print(dateFormatter.string(from: date1))
