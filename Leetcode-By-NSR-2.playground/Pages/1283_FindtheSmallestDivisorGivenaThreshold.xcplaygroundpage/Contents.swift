
import Foundation


func smallestDivisor(_ nums: [Int], _ threshold: Int) -> Int {
    
    
    func sumOfDivision(_ nums: [Int], _ divisor: Int) -> Int {
        var sum = 0
        nums.forEach { num in
            sum = sum + Int(ceil(Double(num)/Double(divisor)))
        }
        return sum
    }
    
    var left = 1
    var right = nums.max()!
    
    while left <= right {
        let mid = (left+right)/2
        
        if sumOfDivision(nums, mid) <= threshold {
            right = mid-1
        } else {
            left = mid+1
        }
    }
    
    return left
}

smallestDivisor([1,2,5,9], 6) // 5
smallestDivisor([44,22,33,11,1], 5) // 44
