import Foundation

let urlAddress = "https://www.naver.com"
let urlAddress1 = "http://www.naver.com"
let urlAddress2 = "https//www.naver.com"
let urlAddress3 = "htps://www.naver.com"
let urlAddress4 = "https://www.naver.com"

func urlCheck(to invitation: String) {
//    if let range = invitation.range(of: #"\bClue(do)?™?\b"#, options: .regularExpression) {
    if let range = invitation.range(of: #"^https?://"#, options: .regularExpression) {
        print(invitation[range])
    } else {
        print("퍼킹")
    }
}

urlCheck(to: urlAddress)
urlCheck(to: urlAddress1)
urlCheck(to: urlAddress2)
urlCheck(to: urlAddress3)
urlCheck(to: urlAddress4)
