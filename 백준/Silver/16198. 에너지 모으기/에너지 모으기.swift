let n = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map { Int($0)! }
var selected = [Int]()
var check = Array(repeating: false, count: n)
var result = -1

func dfs(idx: Int) {
    if selected.count == n-2 {
        result = max(result, calculate(selected))
        return
    }
    
    for i in 1..<n-1 {
        if !check[i] {
            check[i] = true
            selected.append(i)
            dfs(idx: idx+1)
            check[i] = false
            selected.popLast()
        }
    }
}


func calculate(_ arr: [Int]) -> Int {
    var check = Array(repeating: false, count: n)
    var left = 0
    var right = 0
    var energy = 0
    for i in arr {
        check[i] = true
        for j in (0..<i).reversed() {
            if !check[j] {
                left = j
                break
            }
        }
        for j in i..<n {
            if !check[j] {
                right = j
                break
            }
        }
        energy += array[left] * array[right]
    }
    return energy
}

dfs(idx: 1)
print(result)


