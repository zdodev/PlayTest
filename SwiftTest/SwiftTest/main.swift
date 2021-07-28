import Foundation

let str = "2021-07-26 12:06:06"

let dateFormmatter = DateFormatter()
dateFormmatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
let date = dateFormmatter.date(from: str)!

dateFormmatter.dateFormat = "yyyy-MM-dd"
let date1 = dateFormmatter.string(from: date)

print(date)
print(date1)
