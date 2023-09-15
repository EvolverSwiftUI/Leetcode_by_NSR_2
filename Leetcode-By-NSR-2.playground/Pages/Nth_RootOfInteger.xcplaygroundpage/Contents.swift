
import Foundation

func get_Nth_RootOfInteger(_ num: Int, _ n: Int) -> Int {
    var left = 1
    var right = num
    
    while left <= right {
        let mid = (left+right)/2
        let temp = Int(pow(Double(mid), Double(n)))
        
        if temp == num {
            return mid
        }
        else if temp < num {
            left = mid+1
        }
        else {
            right = mid-1
        }
    }
    
    return -1
}

get_Nth_RootOfInteger(81, 4) // 3
get_Nth_RootOfInteger(11, 5) // -1
