let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var house = [(y: Int, x: Int)]()
var chicken = [(y: Int, x: Int)]()

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    for j in 0..<n {
        if input[j] == 1 {
            house.append((i,j))
        }
        if input[j] == 2 {
            chicken.append((i, j))
        }
    }
}

var num = [Int](0..<chicken.count)
var check = [Bool](repeating: false, count: chicken.count)
var sel = [Int](repeating: 0, count: m)

var result = Int.max

func pick(_ idx: Int) {
    if idx == m {
        var tempResult = 0
        let selectedChicken = sel.map { chicken[$0] }
        for h in house {
            tempResult += getDistance(selectedChicken, h)
        }
        result = min(result, tempResult)
        return
    }
    
    for i in 0..<num.count {
        if !check[i] {
            if idx > 0 && sel[idx-1] > num[i] { continue }
            check[i] = true
            sel[idx] = num[i]
            pick(idx+1)
            check[i] = false
        }
    }
}
        
func getDistance(_ pickedChicken: [(y: Int, x: Int)], _ d: (y: Int, x: Int)) -> Int {
    var minDistance = Int.max
    for i in pickedChicken {
        minDistance = min(minDistance, abs(i.x - d.x) + abs(i.y - d.y))
    }
    return minDistance
}

pick(0)
print(result)
