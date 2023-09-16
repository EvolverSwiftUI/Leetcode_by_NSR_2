import Foundation

func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
    
    var left = 1
    var right = piles.max()!
    
    while left <= right {
        let mid = (left+right)/2
        
        var totalHours = 0
        for i in 0..<piles.count {
            totalHours += Int(ceil(Double(piles[i])/Double(mid)))
        }
        
        if totalHours <= h {
            right = mid-1
        } else {
            left = mid+1
        }
    }
    return left
}

minEatingSpeed([3,6,7,11], 8) // 4
minEatingSpeed([30,11,23,4,20], 5) // 30
minEatingSpeed([30,11,23,4,20], 6) // 23
