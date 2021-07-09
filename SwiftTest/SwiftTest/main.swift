import Foundation

let dateInterval = DateInterval(start: Date(), duration: 100)
print(dateInterval)

// +20 seconds
let date = Date().addingTimeInterval(20)
print(date)

let tomorrow = Date().addingTimeInterval(60 * 60 * 24)
print(tomorrow)

 
