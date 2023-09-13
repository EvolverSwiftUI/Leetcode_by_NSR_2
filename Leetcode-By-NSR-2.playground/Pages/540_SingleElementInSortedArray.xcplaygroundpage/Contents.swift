import Foundation

// brute forch approach
// TC: O(n)
func singleNonDuplicate(_ nums: [Int]) -> Int {
    if nums.count == 1 { return nums.first! } //exception case, if array contain single element
    
    for i in 0..<nums.count {
        if i == 0 { // edge case 1 - if it is first element
            if nums[i] != nums[i+1] {
                return nums[i]
            }
        } else if i == nums.count - 1 { // edge case 2 - if it is last element
            if nums[i] != nums[i-1] {
                return nums[i]
            }
        } else { // the elements between first and last
            if nums[i] != nums[i-1] && nums[i] != nums[i+1] {
                return nums[i]
            }
        }
    }
    
    return -1
}

singleNonDuplicate([1,1,2,3,3,4,4,8,8]) // 2
singleNonDuplicate([3,3,7,7,10,11,11]) // 10

// optimal approach
// O(log^n)
func singleNonDuplicate_v2(_ nums: [Int]) -> Int {
    let n = nums.count
    
    if n == 1 { return nums[0] } // exception case: having single element
    if nums[0] != nums[1] { return nums[0] } // edge case 1: leftmost element check
    if nums[n-1] != nums[n-2] { return nums[n-1] } // edge case 2: rightmost element check
    
    var left = 1
    var right = n-2
    
    while left <= right {
        let mid = (left+right)/2
        
        if (nums[mid] != nums[mid-1]) && (nums[mid] != nums[mid+1]) {
            // we got target element
            return nums[mid]
        }
        else if (mid % 2 == 1 && nums[mid] == nums[mid-1]) || (mid % 2 == 0 && nums[mid] == nums[mid+1]) {
            // we in left side of target element, so strikeoff left portion
            left = mid + 1
        }
        else {
            // we in right side of target element, so strikeoff right portion
            right = mid - 1
        }
    }
    
    return -1
}

singleNonDuplicate_v2([1,1,2,3,3,4,4,8,8]) // 2
singleNonDuplicate_v2([3,3,7,7,10,11,11]) // 10
