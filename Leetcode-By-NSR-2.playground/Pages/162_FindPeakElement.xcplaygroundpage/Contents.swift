import Foundation

// brute force approach:
func findPeakElement(_ nums: [Int]) -> Int {
    for i in nums.indices {
        if (i == nums.indices.first || nums[i-1] < nums[i])
            && (i == nums.indices.last || nums[i] > nums[i+1]) {
            
            return i
        }
    }
    
    return -1
}

findPeakElement([1,2,3,1]) // 2
findPeakElement([1,2,1,3,5,6,4]) //  1 or 5



// optimal approach:
func findPeakElement_v2(_ nums: [Int]) -> Int {
    return -1
}

findPeakElement_v2([1,2,3,1]) // 2
findPeakElement_v2([1,2,1,3,5,6,4]) //  1 or 5
