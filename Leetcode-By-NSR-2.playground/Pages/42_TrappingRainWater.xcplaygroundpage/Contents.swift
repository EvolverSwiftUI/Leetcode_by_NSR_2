
import Foundation

func trap(_ height: [Int]) -> Int {
    if height.isEmpty { return 0 }
    
    func getPrefixMax(_ arr: [Int]) -> [Int] {
        var temp: [Int] = Array(repeating: 0, count: arr.count)
        
        for (index, element) in arr.enumerated() {
            if index == 0 {
                temp[0] = arr[0]
            } else {
                let max = max(temp[index-1], element)
                temp[index] = max
            }
        }
        
        return temp
    }
    
    func getSuffixMax(_ arr: [Int]) -> [Int] {
        var temp: [Int] = Array(repeating: 0, count: arr.count)
        
        for index in stride(from: arr.count-1, through: 0, by: -1) {
            if index == arr.count-1 {
                temp[index] = arr[index]
            } else {
                let max = max(temp[index+1], arr[index])
                temp[index] = max
            }
        }
        
        return temp
    }
    
    
    var answer = 0
    
    let prefixMax: [Int] = getPrefixMax(height)
    print(prefixMax)
    let suffixMax: [Int] = getSuffixMax(height)
    print(suffixMax)


    for (index, value) in height.enumerated() {
        let leftBlockage = prefixMax[index]
        let rightBlockage = suffixMax[index]
        let yourBlockage = min(leftBlockage, rightBlockage)
        let contribution = yourBlockage - value
        if contribution > 0 {
            answer += contribution
        }
    }
    
    
    return answer
}

trap([0,1,0,2,1,0,1,3,2,1,2,1]) // 6
trap([4,2,0,3,2,5]) // 9
