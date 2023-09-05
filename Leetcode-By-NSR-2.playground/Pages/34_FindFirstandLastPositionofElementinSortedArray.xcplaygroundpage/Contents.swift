import Foundation

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.isEmpty { return [-1, -1] }

    var result: [Int] = []
    
    for (index,num) in nums.enumerated() {
        if num == target {
            result.append(index)
        }
    }
    
    if result.isEmpty {
        return [-1, -1]
    } else if result.count == 1 {
        return [result.first!, result.first!]
    }

    return [result.first!, result.last!]
}

searchRange([5,7,7,8,8,10], 8) //[3,4]
searchRange([5,7,7,8,8,10], 6) //[-1,-1]
searchRange([], 0) //[-1,-1]
