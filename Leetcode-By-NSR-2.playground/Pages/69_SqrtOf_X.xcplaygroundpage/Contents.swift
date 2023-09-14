import Foundation

// brute force approach
// O(n)
func mySqrt(_ x: Int) -> Int {
    var answer = 0
    for i in 0...x {
        if (i*i) <= x {
            answer = i
        } else {
            break
        }
    }
    return answer
}

mySqrt(25) // 5
mySqrt(30) // 5
mySqrt(36) // 6



// optimal approach
// O(log^n)
func mySqrt_v2(_ x: Int) -> Int {
    if x == 0 { return 0 }
    
    var answer = 0
    var left = 0
    var right = x
    
    while left <= right {
        let mid = (left+right)/2
        let temp = mid * mid
        
        if temp <= x {
            answer = mid
            left = mid+1
        }else {
            right = mid-1
        }
    }
    
    return answer
}

mySqrt_v2(25) // 5
mySqrt_v2(30) // 5
mySqrt_v2(36) // 6
