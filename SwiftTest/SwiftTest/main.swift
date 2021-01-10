class Solution {
    func reverseString(_ s: inout [Character]) -> [Character] {
        var (leftIndex, rightIndex) = (0, s.count - 1)
        while leftIndex < rightIndex {
            (s[leftIndex], s[rightIndex]) = (s[rightIndex], s[leftIndex])
            leftIndex += 1
            rightIndex -= 1
        }
        return s
    }
}
