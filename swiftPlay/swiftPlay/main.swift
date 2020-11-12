import Foundation

let urlAddress = "https://www.naver.com"
let urlAddress1 = "http://www.naver.com"
let urlAddress2 = "https//www.naver.com"
let urlAddress3 = "htps://www.naver.com"
let urlAddress4 = "https://www.naver.com"

func isValidUrl(url: String) {
    guard let _ = url.range(of: #"^https?://"#, options: .regularExpression) else {
        print("fail")
        return
    }
//    let a = url.range(of: #"^https?://"#, options: .regularExpression)
//    print(a)
//    print(url[a])
}

