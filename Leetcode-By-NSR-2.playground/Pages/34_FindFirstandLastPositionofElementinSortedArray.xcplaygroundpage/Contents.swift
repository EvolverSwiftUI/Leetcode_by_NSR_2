import Foundation

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.isEmpty { return [-1, -1] }

    var result: [Int] = [-1, -1]
    
    for (index,num) in nums.enumerated() {
        if num == target {
            if result[0] == -1 { // first time, so fill at first index
                result[0] = index
            }
            result[1] = index // anytime fill at last index
        }
    }

    return result
}

searchRange([5,7,7,8,8,10], 8) //[3,4]
searchRange([5,7,7,8,8,10], 6) //[-1,-1]
searchRange([], 0) //[-1,-1]
