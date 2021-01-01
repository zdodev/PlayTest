import Foundation
import SwiftSoup

let investingURL = "https://www.investing.com"

if let url = URL(string: investingURL) {
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
