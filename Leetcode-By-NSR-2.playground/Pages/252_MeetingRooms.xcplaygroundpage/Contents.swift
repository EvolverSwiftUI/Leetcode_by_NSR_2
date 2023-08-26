import Foundation

func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
    if intervals.isEmpty { return true }
    
    var sorted = intervals.sorted { $0[0] < $1[0] }
    print(sorted)
    
    for i in 1..<sorted.count {
        let prevEnd = sorted[i-1][1]
        let currentStart = sorted[i][0]
        
        if prevEnd > currentStart {
            return false
        }
    }
    
    return true
}

canAttendMeetings([[0,30],[5,10],[15,20]]) // false
canAttendMeetings([[7,10],[2,4]]) // true
