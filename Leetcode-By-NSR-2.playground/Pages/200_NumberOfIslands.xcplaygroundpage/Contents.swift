import Foundation

func numIslands(_ grid: [[Character]]) -> Int {
    return 0
}


let grid1: [[Character]] = [
    ["1","1","1","1","0"],
    ["1","1","0","1","0"],
    ["1","1","0","0","0"],
    ["0","0","0","0","0"]
]
numIslands(grid1) // 1


let grid2: [[Character]] = [
    ["1","1","0","0","0"],
    ["1","1","0","0","0"],
    ["0","0","1","0","0"],
    ["0","0","0","1","1"]
]
numIslands(grid2) // 3
