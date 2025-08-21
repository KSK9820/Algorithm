let n = Int(readLine()!)!
var result = 0

if n == 1 {
    result = 1
} else {
    var c = Array(repeating: -1, count: n)
    
    func dfs(row: Int) {
        if row == n { result += 1; return }
        
        for col in 0..<n {
            if isSafe(row: row, col: col) {
                c[row] = col
                dfs(row: row + 1)
            }
        }
    }
    
    func isSafe(row: Int, col: Int) -> Bool {
        for r in 0..<row {
            if c[r] == col { return false }
            if abs(c[r] - col) == abs(r - row) { return false }
        }
        return true
    }
    dfs(row: 0)
}

print(result)
