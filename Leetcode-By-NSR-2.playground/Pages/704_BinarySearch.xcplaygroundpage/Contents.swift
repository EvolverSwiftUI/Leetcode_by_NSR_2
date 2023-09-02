import Foundation

func search(_ nums: [Int], _ target: Int) -> Int {
    if nums.isEmpty { return -1 }
    
    var left = 0
    var right = nums.count-1
    
    while left < right {
        let mid = (left + right) / 2
        let midValue = nums[mid]
        if target == midValue {
            return mid
        } else if target < midValue {
            right = mid-1
        } else {
            left = mid + 1
        }
    }
    
    return -1
}


search([-1,0,3,5,9,12], 9) // 4
search([-1,0,3,5,9,12], 2) // -1
