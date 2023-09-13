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
