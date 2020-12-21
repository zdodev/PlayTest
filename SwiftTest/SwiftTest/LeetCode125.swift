import Foundation

enum LeetCode125{
    class Solution {
        func isPalindrome(_ s: String) -> Bool {
            var characterList = [Character]()
            for character in s {
                if character.isLetter || character.isNumber {
                    characterList.append(contentsOf: character.lowercased())
                }
            }
            
            while characterList.count > 1 {
                if characterList.removeFirst() != characterList.removeLast() {
                    return false
                }
            }
            
            return true
        }
    }
    
    class Solution3 {
        func isPalindrom(_ s: String) -> Bool {
            let lowerString = s.lowercased()
            let alnumString = lowerString.replacingOccurrences(of: "[^a-z0-9]", with: "", options: .regularExpression)
            let reversedString = String(alnumString.reversed())
            
            return alnumString == reversedString
        }
    }
}
