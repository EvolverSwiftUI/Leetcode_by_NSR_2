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
    let n = nums.count
    
    if n == 1 { return 0 } // exception case
    if nums[0] > nums[1] { return 0 } // edge case 1
    if nums[n-1] > nums[n-2] { return n-1 } // edge case 2

    var left = 1
    var right = n-2
    
    while left <= right {
        let mid = (left+right)/2
        if (nums[mid] > nums[mid-1]) && (nums[mid] > nums[mid+1]) {
            return mid
        }
        else if nums[mid] > nums[mid-1] {
            left = mid+1
        }
        else if nums[mid] > nums[mid+1] {
            right = mid-1
        }
        else {
            left = mid+1
        }
    }
    
    return -1
}

findPeakElement_v2([1,2,3,1]) // 2
findPeakElement_v2([1,2,1,3,5,6,4]) //  1 or 5
