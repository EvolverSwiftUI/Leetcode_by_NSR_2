import Foundation

func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
    
    var result: [[Int]] = []
    var newInterval = newInterval
    
    for i in 0..<intervals.count {
        if newInterval[1] < intervals[i][0] {
            result.append(newInterval)
            result.append(contentsOf: intervals[i..<intervals.count])
            return result
        } else if newInterval[0] > intervals[i][1] {
            result.append(intervals[i])
        } else {
            let minVal = min(newInterval[0], intervals[i][0])
            let maxVal = max(newInterval[1], intervals[i][1])
            newInterval = [minVal, maxVal]
        }
    }
    
    result.append(newInterval)
    return result
}

insert(
    [[1,3],[6,9]], [2,5]
)
// Output ==> [[1,5],[6,9]]


insert(
    [[1,2],[3,5],[6,7],[8,10],[12,16]],
    [4,8]
)
// Output ==> [[1,2],[3,10],[12,16]]

