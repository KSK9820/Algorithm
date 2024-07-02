let n = Int(readLine()!)!
var ingredient = [(s: Int, t: Int)]()

for _ in 0..<n {
    let food = readLine()!.split(separator: " ").map { Int($0)! }
    ingredient.append((food[0], food[1]))
}

var selected = [(s: Int, t: Int)]()
var check = Array(repeating: false, count: n)
var result = Int.max
func makeFood(_ idx: Int) {
    
    if !selected.isEmpty {
        let sour = selected.reduce(1) { partialResult, value in
            partialResult * value.s
        }
        let bitter = selected.reduce(0) { partialResult, value in
            partialResult + value.t
        }
        result = min(result, abs(sour - bitter))
    }
    for i in idx..<n {
        selected.append(ingredient[i])
        makeFood(i+1)
        selected.removeLast()
    }
}
makeFood(0)
print(result)
