import Foundation


// Brute Force Approach:
func minDays(_ bloomDay: [Int], _ m: Int, _ k: Int) -> Int {
    
    func isNotContainsRequiredNumberOfFlowers() -> Bool {
        let requiredFlowersCount = m * k
        let givenFlowersCount = bloomDay.count
        return givenFlowersCount < requiredFlowersCount
    }
    
    // failure edge case:
    if isNotContainsRequiredNumberOfFlowers() {
        return -1
    }
    
    // So now we have passed the basic need
    // and Let's dive into problem solving as below way
    
    var bouquets = 0
    var adjacentCount = 0
    var minDays = Int.max
    
    bloomDay.forEach { day in
        for item in bloomDay {
            if item <= day {
                adjacentCount += 1
            } else {
                bouquets += adjacentCount / k
                adjacentCount = 0
            }
        }
        bouquets += adjacentCount / k
        if bouquets >= m {
            minDays = min(minDays, day)
        }
        bouquets = 0
        adjacentCount = 0
    }
    
    if bloomDay.contains(minDays) {
        return minDays
    }
    
    return -1
}

minDays([1,10,3,10,2], 3, 1) // 3
minDays([1,10,3,10,2], 3, 2) // -1
minDays([7,7,7,7,12,7,7], 2, 3) // 12


// Optimal Approach:
func minDays_v2(_ bloomDay: [Int], _ m: Int, _ k: Int) -> Int {
    
    func isNotContainsRequiredNumberOfFlowers() -> Bool {
        let requiredFlowersCount = m * k
        let givenFlowersCount = bloomDay.count
        return givenFlowersCount < requiredFlowersCount
    }
    
    // failure edge case:
    if isNotContainsRequiredNumberOfFlowers() {
        return -1
    }
    
    // So now we have passed the basic need
    // and Let's dive into problem solving as below way
    
    func possible(_ arr: [Int], _ day: Int, _ m: Int, _ k: Int) -> Bool {
        var adjacentCount = 0
        var bouquets = 0

        for item in arr {
            if item <= day {
                adjacentCount += 1
            } else {
                bouquets += adjacentCount / k
                adjacentCount = 0
            }
        }
        bouquets += adjacentCount / k
        
        return bouquets >= m
    }

    let mini = bloomDay.min()!
    let maxi = bloomDay.max()!
    
    var left = mini
    var right = maxi

    while left <= right {
        let mid = (left+right)/2
        
        if possible(bloomDay, mid, m, k) {
            right = mid-1
        } else {
            left = mid + 1
        }
    }
    
    return left
}

minDays_v2([1,10,3,10,2], 3, 1) // 3
minDays_v2([1,10,3,10,2], 3, 2) // -1
minDays_v2([7,7,7,7,12,7,7], 2, 3) // 12
