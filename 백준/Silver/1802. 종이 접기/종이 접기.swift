var result = ""
for _ in 0..<Int(readLine()!)! {
    let paper = readLine()!.map { Int(String($0))! }
    if paper.count == 1 { result += "YES\n"; continue }
    
    result += foldable(0, paper.count - 1) ? "YES\n" : "NO\n"

    func foldable(_ s: Int, _ e: Int) -> Bool {
        if s == e { return true }
        let m = (s + e) / 2
        
        for i in s..<m {
            if paper[i] == paper[e - i] { return false }
        }
        
        return foldable(s, m - 1) && foldable(m + 1, e)
    }
}
print(result)

