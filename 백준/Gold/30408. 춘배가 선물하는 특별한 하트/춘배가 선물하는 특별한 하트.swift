let nm = readLine()!.split(separator: " ").map { Int($0)! }
var (n, m) = (nm[0], nm[1])

var visited = Set<Int>()
visited.insert(n)

var flag = true
while n > 1 {
    if flag {
        flag = n % 2 == 0 ? true : false
    }
    
    if flag {
        if n % 2 == 0 {
            n /= 2
            visited.insert(n)
        }
    } else {
        n /= 2
        visited.insert(n)
        visited.insert(n+1)
    }
    
}

visited.contains(m) ? print("YES") : print("NO")