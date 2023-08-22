import Foundation

func merge(_ intervals: [[Int]]) -> [[Int]] {
    if intervals.isEmpty { return [] }
    
    var sorted = intervals.sorted { $0[0] < $1[0] }
    var result: [[Int]] = [sorted.first!]
    
    for i in 1..<sorted.count {
        let prevStart = result.last![0]
        let prevEnd = result.last![1]
        print(prevStart)
        print(prevEnd)

        let currentStart = sorted[i][0]
        let currentEnd = sorted[i][1]
        print(currentStart)
        print(currentEnd)

        if prevEnd >= currentStart && prevEnd <= currentEnd {
            result.removeLast()
            let mergedInterval = [prevStart, currentEnd]
            result.append(mergedInterval)
        } else if prevEnd < currentStart {
            let newInterval = [currentStart, currentEnd]
            result.append(newInterval)
        }
    }
    
    return result
}

merge([[1,3],[2,6],[8,10],[15,18]]) // [[1,6],[8,10],[15,18]]
merge([[1,4],[4,5]]) // [[1,5]]
merge([[1,4],[0,4]]) // [[0,4]]
