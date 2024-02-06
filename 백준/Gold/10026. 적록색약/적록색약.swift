let n = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: "", count: n), count: n)
var visitedThree = Array(repeating: Array(repeating: false, count: n), count: n)
var visitedTwo = Array(repeating: Array(repeating: false, count: n), count: n)
for i in 0..<n {
    arr[i] = readLine()!.map { String($0) }
}

var three = 0
var two = 0

let dx = [0, 1, 0, -1]
let dy = [-1, 0, 1, 0]

for i in 0..<n {
    for j in 0..<n {
        if visitedTwo[i][j] == false {
            dfsTwo(y: i, x: j)
            two += 1
        }
        if visitedThree[i][j] == false {
            dfsThree(y: i, x: j)
            three += 1
        }
    }
}

func dfsThree(y: Int, x: Int ) {
    if visitedThree[y][x] == true { return }
    visitedThree[y][x] = true
    
    let alphabet = arr[y][x]
    
    for d in 0..<4 {
        let newY = y + dy[d]
        let newX = x + dx[d]
        
        if newY < 0 || newY >= n || newX < 0 || newX >= n {
            continue
        }

        if visitedThree[newY][newX] == false && arr[newY][newX] == alphabet {
                dfsThree(y: newY, x: newX)
        }
    }
}

func dfsTwo(y: Int, x: Int ){
    if visitedTwo[y][x] == true { return }
    visitedTwo[y][x] = true

    let alphabet = arr[y][x]
    
    for d in 0..<4 {
        let newY = y + dy[d]
        let newX = x + dx[d]
        
        if newY < 0 || newY >= n || newX < 0 || newX >= n {
            continue
        }
        
        if visitedTwo[newY][newX] == false {
            if arr[newY][newX] == "B" {
                if alphabet == "B" {
                    dfsTwo(y: newY, x: newX)
                }
            } else if alphabet != "B" {
                dfsTwo(y: newY, x: newX)
            }
        }
    }
}
print(three, two)
