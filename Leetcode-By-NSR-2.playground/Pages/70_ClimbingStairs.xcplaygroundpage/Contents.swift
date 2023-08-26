import Foundation

var cache: [Int: Int] = [:]

func climbStairs(_ n: Int) -> Int {
    if n <= 1 { return 1 }
    
    if cache[n] != nil {
        return cache[n]!
    } else {
        cache[n] = climbStairs(n-2) + climbStairs(n-1)
        return cache[n]!
    }
}

climbStairs(2) // 2
climbStairs(3) // 3
