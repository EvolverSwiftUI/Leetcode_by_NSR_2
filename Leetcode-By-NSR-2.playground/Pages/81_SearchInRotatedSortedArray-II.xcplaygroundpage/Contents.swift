import Foundation

func search(_ nums: [Int], _ target: Int) -> Bool {
    if nums.isEmpty { return false }
    
    var left = 0
    var right = nums.count-1
    
    while left <= right {
        let mid = (left+right)/2
        
        if target == nums[mid] { return true }
        
        if nums[mid] == nums[left] && nums[mid] == nums[right] {
            left += 1
            right -= 1
            continue
        }
        
        if nums[left] <= nums[mid] { // figure out the sorted half portion <-- key point
            // left half
            if target >= nums[left] && target <= nums[mid] {
                // lies here, there by remove right half
                right = mid-1
            } else {
                left = mid+1
            }
        } else {
            // right half
            if target >= nums[mid] && target <= nums[right] {
                // lies here, there by remove left half
                left = mid+1
            } else {
                right = mid-1
            }
        }
    }
    
    return false
}

search([2,5,6,0,0,1,2], 0) // true
search([2,5,6,0,0,1,2], 3) // false
