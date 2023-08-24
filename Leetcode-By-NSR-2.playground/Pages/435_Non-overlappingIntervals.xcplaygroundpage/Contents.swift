import Foundation

func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
    if intervals.isEmpty { return 0 }
    
    var sorted = intervals.sorted { $0[1] < $1[1] }
    var count = 0
    var currentMin = Int.min
    
    for i in 0..<sorted.count {
        if sorted[i][0] >= currentMin {
            currentMin = sorted[i][1]
        } else {
            count += 1
        }
    }
    
    return count
}

eraseOverlapIntervals([[1,2],[2,3],[3,4],[1,3]]) // 1
eraseOverlapIntervals([[1,2],[1,2],[1,2]]) // 2
eraseOverlapIntervals([[1,2],[2,3]]) // 0
