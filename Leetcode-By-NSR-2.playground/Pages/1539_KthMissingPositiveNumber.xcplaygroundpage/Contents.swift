
import Foundation

// brute force approach:
// TC - O(n)
// SC - O(1)
func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
    var k = k
    
    for num in arr {
        if num <= k {
            k += 1 // shifting k
        } else {
            break
        }
    }
    
    return k
}

findKthPositive([2,3,4,7,11], 5) // 9
findKthPositive([1,2,3,4], 2) // 6



// optimal approach:
// TC - O(log^n)
// SC - O(1)
func findKthPositive_v2(_ arr: [Int], _ k: Int) -> Int {
    var left = 0
    var right = arr.count-1
    
    while left <= right {
        let mid = (left+right)/2
        let missing = arr[mid]-(mid+1)
        
        if missing < k {
            left = mid+1
        } else {
            right = mid-1
        }
    }
    
    return right + 1 + k
}

findKthPositive_v2([2,3,4,7,11], 5) // 9
findKthPositive_v2([1,2,3,4], 2) // 6
