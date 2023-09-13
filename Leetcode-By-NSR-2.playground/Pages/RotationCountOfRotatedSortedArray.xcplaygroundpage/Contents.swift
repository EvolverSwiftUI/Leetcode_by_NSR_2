import Foundation

// Tip to solve problem:
// get the minVal and return that minVal index.
func getNumberOfTimesRotated_Of_RotatedSortedArray(_ nums: [Int]) -> Int {
    if nums.isEmpty { return 0 }
    
    var rotationCount = 0
    var minVal = Int.max
    
    var left = 0
    var right = nums.count-1
    
    while left <= right {
        let mid = (left+right)/2
        
        if nums[left] <= nums[mid] { // get half sorted portion <--- key point 1
            if nums[left] < minVal {
                minVal = nums[left]
                rotationCount = left
            }
            // now strike-out left portion, move to remaining right portion <--- key point 2
            left = mid+1
        } else {
            if nums[mid] < minVal {
                minVal = nums[mid]
                rotationCount = mid
            }
            // now strike-out right portion, move to remaining left portion<--- key point 3
            right = mid-1
        }
    }
    
    return rotationCount
}


getNumberOfTimesRotated_Of_RotatedSortedArray([3,4,5,1,2]) // 3
getNumberOfTimesRotated_Of_RotatedSortedArray([4,5,1,2,3]) // 2
getNumberOfTimesRotated_Of_RotatedSortedArray([5,1,2,3,4]) // 1
getNumberOfTimesRotated_Of_RotatedSortedArray([1,2,3,4,5]) // 0
