typealias Edge = (s: Int, d: Int, w: Int)
var result = ""

for _ in 0..<Int(readLine()!)! {
    let nmw = readLine()!.split(separator: " ").map { Int($0)! }
    let (n,m,w) = (nmw[0], nmw[1], nmw[2])
    
    var arr = [Edge]()
    for _ in 0..<m {
        let set = readLine()!.split(separator: " ").map { Int($0)! }
        arr.append((set[0], set[1], set[2]))
        arr.append((set[1], set[0], set[2]))
    }
    for _ in 0..<w {
        let set = readLine()!.split(separator: " ").map { Int($0)! }
        arr.append((set[0], set[1], set[2] * -1))
    }
    
    var dis = Array(repeating: 10001, count: n+1)
    func bellmanford(s: Int, edges: [Edge], n: Int) -> Bool {
        dis[s] = 0
        
        for _ in 0..<n-1 {
            for edge in edges {
                if dis[edge.s] + edge.w < dis[edge.d] {
                    dis[edge.d] = dis[edge.s] + edge.w
                }
            }
        }
        
        
        for edge in edges {
            if dis[edge.s] + edge.w < dis[edge.d] {
                return true
            }
        }
        return false
    }
    
    
    if bellmanford(s: 1, edges: arr, n: m) {
        result += "YES\n"
    } else {
        result += "NO\n"
    }
}
print(result)


