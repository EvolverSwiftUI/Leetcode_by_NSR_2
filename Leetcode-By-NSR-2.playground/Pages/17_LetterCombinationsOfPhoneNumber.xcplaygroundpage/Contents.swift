import Foundation

func letterCombinations(_ digits: String) -> [String] {
    if digits.isEmpty { return [] }
    
    let dict: [Character: [Character]] = [
        "2": ["a","b","c"],
        "3": ["d","e","f"],
        "4": ["g","h","i"],
        "5": ["j","k","l"],
        "6": ["m","n","o"],
        "7": ["p","q","r","s"],
        "8": ["t","u","v"],
        "9": ["w","x","y","z"]
    ]
    
    var result: [String] = []

    
    for digit in digits {
        let tempArray: [String] = dict[digit]?.map { String($0) } ?? []
        
        if result.isEmpty {
            result = tempArray
        } else {
            result = tempArray.map { char in
                result.map { str in
                    return str + char
                }
            }.flatMap { $0 }
        }
    }
    
    return result
}


letterCombinations("23")    // ["ad","ae","af","bd","be","bf","cd","ce","cf"]
letterCombinations("")      // []
letterCombinations("2")     // ["a","b","c"]
