
import Foundation

func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
    
    func noOfDaysToCompleteTask(_ weights: [Int], _ capacity: Int) -> Int {
        var days = 1
        var load = 0
        
        weights.forEach { weight in
            if load+weight > capacity {
                days += 1
                load = weight
            } else {
                load += weight
            }
        }
        
        return days
    }
    
    var left = weights.max()!
    var right = weights.reduce(0, +)
    // so range below, on which we do binary search
    // [10,11,12.....55] <---- its in sorted order alredy.
    // but not on weights array, so no need to do sort the weights array.
    
    while left <= right {
        let mid = (left+right)/2
        
        let requiredDays = noOfDaysToCompleteTask(weights, mid)
        if requiredDays <= days {
            right = mid-1
        } else {
            left = mid+1
        }
    }
    
    return left
}

shipWithinDays([1,2,3,4,5,6,7,8,9,10], 5) // 15
shipWithinDays([3,2,2,4,1,4], 3) // 6
shipWithinDays([1,2,3,1,1], 4) // 3
