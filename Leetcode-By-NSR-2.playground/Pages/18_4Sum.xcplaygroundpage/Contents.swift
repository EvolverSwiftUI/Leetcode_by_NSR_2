import Foundation

// Brute Force Approach:

/*
    TC  - O(n^4)
        - 4 nested loops of length n.
 
    SC  - O(2*newQuadraplet_Count)
        - 1 one Set to store when condition met and 1 for Array to return result.
*/

func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    if nums.isEmpty { return [] }
    
    let length = nums.count
    var set = Set<[Int]>()
    
    for i in 0..<length {
        for j in i+1..<length {
            for k in j+1..<length {
                for l in k+1..<length {
                    let sum = nums[i] + nums[j] + nums[k] + nums[l]
                    
                    if sum == target {
                        let newQuadraplet = [nums[i], nums[j], nums[k], nums[l]].sorted()
                        set.insert(newQuadraplet)
                    }
                }
            }
        }
    }
    
    return Array(set)
}


fourSum([1,0,-1,0,-2,2], 0) // [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
//fourSum([2,2,2,2,2], 8) // [[2,2,2,2]]
