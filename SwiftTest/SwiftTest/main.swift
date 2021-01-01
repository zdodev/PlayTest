import Foundation
import SwiftSoup

let requestURL = "https://www.investing.com"

//do {
//   let html = "<html><head><title>First parse</title></head>"
//       + "<body><p>Parsed HTML into a doc.</p></body></html>"
//   let doc: Document = try SwiftSoup.parse(html)
////   return try doc.text()
//    try print(doc.text())
//} catch Exception.Error(let type, let message) {
//    print(message)
//} catch {
//    print("error")
//}

if let url = URL(string: requestURL) {
    let html = try String(contentsOf: url)
    let doc = try parse(html)
    let elements = try doc.select("#navMenu > ul > li:nth-child(1) > a")
    for element in elements {
        print(element)
    }
    print(try elements[0].text())
}

//body > div.generalOverlay.js-general-overlay.displayNone
///html/body/div[3]
//#navMenu > ul > li:nth-child(1) > a
