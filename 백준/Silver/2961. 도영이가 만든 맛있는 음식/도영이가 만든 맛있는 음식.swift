let n = Int(readLine()!)!
var ingredient = [(s: Int, b: Int)]()

for _ in 0..<n {
    let food = readLine()!.split(separator: " ").map { Int($0)! }
    ingredient.append((food[0], food[1]))
}

var selected = [(s: Int, b: Int)]()
var check = Array(repeating: false, count: n)
var result = Int.max
func makeFood(_ idx: Int) {
    
    if !selected.isEmpty {
        let sour = selected.reduce(1) { partialResult, value in
            partialResult * value.s
        }
        let bitter = selected.reduce(0) { partialResult, value in
            partialResult + value.b
        }
        result = min(result, abs(sour - bitter))

    }
    for i in idx..<n {
        if !check[i] {
            check[i] = true
            selected.append(ingredient[i])
            makeFood(idx+1)
            selected.removeLast()
            check[i] = false
        }
    }
}
makeFood(0)
print(result)
