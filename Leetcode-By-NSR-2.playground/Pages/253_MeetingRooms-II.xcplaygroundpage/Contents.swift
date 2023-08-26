import Foundation

func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    if intervals.isEmpty { return 0 }
    
    var startTimes: [Int] = []
    var endTimes: [Int] = []
    
    for i in intervals {
        startTimes.append(i[0])
        endTimes.append(i[1])
    }
    
    startTimes.sort()
    endTimes.sort()
    
    var result = 0
    var count = 0
    var start = 0
    var end = 0
    
    while start < intervals.count {
        
        if startTimes[start] < endTimes[end] {
            count += 1
            start += 1
        } else {
            count -= 1
            end += 1
        }
        
        result = max(result, count)
    }
    
    return result
}


minMeetingRooms([[0,30],[5,10],[15,20]]) // 2
minMeetingRooms([[7,10],[2,4]]) // 1
