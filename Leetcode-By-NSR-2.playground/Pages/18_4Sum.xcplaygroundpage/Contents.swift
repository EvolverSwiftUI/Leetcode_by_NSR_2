import Foundation

// Brute Force Approach
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
fourSum([2,2,2,2,2], 8) // [[2,2,2,2]]


// Better Approach
/*
     TC  - O(n^3*log^n)
         - 4 nested loops of length n.

     SC  - O(2*newQuadraplet_Count)
         - 1 one Set to store when condition met and 1 for Array to return result.
*/

func fourSum_v2(_ nums: [Int], _ target: Int) -> [[Int]] {
    if nums.isEmpty { return [] }
    
    let length = nums.count
    var set = Set<[Int]>()
    
    for i in 0..<length {
        for j in i+1..<length {
            var hashSet = Set<Int>()
            for k in j+1..<length {
                let fouth = target - (nums[i] + nums[j] + nums[k])
                if hashSet.contains(fouth) {
                    let newQuadraplet = [nums[i], nums[j], nums[k], fouth].sorted()
                    set.insert(newQuadraplet)
                }
                hashSet.insert(nums[k])
            }
        }
    }
    
    return Array(set)
}

fourSum_v2([1,0,-1,0,-2,2], 0) // [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
fourSum_v2([2,2,2,2,2], 8) // [[2,2,2,2]]



// Optimal Approach:
/*
     TC  - O(n^3)
         - 3 nested loops of length n.

     SC  - O(newQuadraplet_Count)
         - Array to return result.
*/

func fourSum_v3(_ nums: [Int], _ target: Int) -> [[Int]] {
    if nums.count < 4 { return [] }
    
    var nums = nums.sorted()
    let length = nums.count
    var result: [[Int]] = []
    
    for i in 0..<length {
        if i > 0 && nums[i] == nums[i-1] { continue }
        for j in i+1..<length {
            if j != i+1 && nums[j] == nums[j-1] { continue }
            var k = j+1
            var l = length-1
            while k < l {
                let sum = nums[i] + nums[j] + nums[k] + nums[l]
                if sum == target {
                    let newQuadraplet = [nums[i], nums[j], nums[k], nums[l]]
                    result.append(newQuadraplet)
                    k += 1
                    l -= 1
                    while k < l && nums[k] == nums[k-1] { k += 1 }
                    while k < l && nums[l] == nums[l+1] { l -= 1 }
                } else if sum < target {
                    k += 1
                } else {
                    l -= 1
                }
            }
        }
    }
    
    return result
}

fourSum_v3([1,0,-1,0,-2,2], 0) // [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
fourSum_v3([2,2,2,2,2], 8) // [[2,2,2,2]]
