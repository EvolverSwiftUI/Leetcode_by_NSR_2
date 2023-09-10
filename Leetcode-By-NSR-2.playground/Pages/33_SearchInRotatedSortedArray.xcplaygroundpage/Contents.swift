import Foundation

func search(_ nums: [Int], _ target: Int) -> Int {
    if nums.isEmpty { return -1 }
    
    var left = 0
    var right = nums.count-1
    
    while left <= right {
        let mid = (left+right)/2
        
        if target == nums[mid] { return mid }
        
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
    
    return -1
}

search([4,5,6,7,0,1,2], 0) // 4
search([4,5,6,7,0,1,2], 3) // -1
search([1], 0) // -1
