import Foundation

func findMin(_ nums: [Int]) -> Int {
    
    var minVal = Int.max
    var left = 0
    var right = nums.count-1
    
    while left <= right {
        let mid = (left+right)/2
        if nums[left] <= nums[mid] {
            minVal = min(minVal, nums[left])
            left = mid+1
        } else {
            minVal = min(minVal, nums[mid])
            right = mid-1
        }
    }
    
    return minVal
}

findMin([3,4,5,1,2])        // 1
findMin([4,5,6,7,0,1,2])    // 0
findMin([11,13,15,17])      // 11
