
var result = ""
while true {
    var input = readLine()!.split(separator: " ").map { Int($0)! }
    input.removeFirst()
    input = Array(Set(input)).sorted()
    if input == [] { break }
    
    var selected = [Int](repeating: 0, count: 6)

 
    func backTracking(_ idx: Int, _ sidx: Int) {
        if sidx == 6 {
            result.append(selected.map { String($0) }.joined(separator: " ") + "\n")
            return
        }
        
        if idx == input.count {
            return
        }
        
        selected[sidx] = input[idx]
        backTracking(idx+1, sidx+1)
        backTracking(idx+1, sidx)
    }
    backTracking(0,0)
    result += "\n"
}
result.popLast()
print(result)


