import Foundation

func reverseStringExceptSpecialCharacters(_ str: String) -> String {
    if str.isEmpty { return "" }
    
    var sChars: [Character] = Array(str) // String -> [Character], it makes life easy
    var left = 0
    var right = str.count-1
    
    while left <= right {
        if (sChars[left].isChar && sChars[right].isChar) { // if both pointers point to chars, then do swap
            let temp = sChars[left]
            sChars[left] = sChars[right]
            sChars[right] = temp
            left += 1
            right -= 1
        } else if sChars[left].isChar == false { // if left pointer not point to char, just increase to next index
            left += 1
        } else { // if right pointer not point to char, just decrease to next index
            right -= 1
        }
    }
    
    return String(sChars) // [Character] -> String
}

reverseStringExceptSpecialCharacters("abcd!efghi$jkl") // "lkji!hgfed$cba"
reverseStringExceptSpecialCharacters("Hell@ W@r!d") // "drWl@ l@e!H"


extension Character {
    var isChar: Bool {
        return (self >= "a" && self <= "z") || (self >= "A" && self <= "Z")
    }
}
