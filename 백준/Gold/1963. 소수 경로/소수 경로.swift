import Foundation

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()

    mutating func enqueue(_ new: T) {
        input.append(new)
    }

    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        return output.popLast()
    }
}


func eratosthenes(_ num: Int) -> [Bool] {
    var isPrime = [Bool](repeating: true, count: num+1)
    
    if num >= 0 { isPrime[0] = false }
    if num >= 1 { isPrime[1] = false }
    
    let sqrtLimit = Int(sqrt(Double(num)))
    for i in 2...sqrtLimit {
        if isPrime[i] {
            var j = i * i
            while j <= num {
                isPrime[j] = false
                j += i
            }
        }
    }
    
    return isPrime
}

var result = ""
var prime = eratosthenes(10000)
for _ in 0..<Int(readLine()!)! {
    let ab = readLine()!.split(separator: " ").map { String($0) }
    let (a,b) = (ab[0].map { Int(String($0))! } , ab[1].map { Int(String($0))! })
    
    var q = Queue<(n: [Int], c: Int)>()
    var v = Array(repeating: false, count: 10000)
    q.enqueue((a, 0))
    v[makeNum(a)] = true
    
    while true {
        guard let now = q.dequeue() else { result += "Impossible\n"; break }
        if now.n == b { result += "\(now.c)\n"; break }
        
        for i in 0..<4 {
            for j in 0...9 where j != now.n[i] {
                if i == 0 && j == 0 { continue }
                var new = now.n
                new[i] = j
                
                let newnumber = makeNum(new)
                if !prime[newnumber] || v[newnumber] { continue }
                v[newnumber] = true
                
                q.enqueue((new, now.c + 1))
            }
        }
    }
}
print(result)

func makeNum(_ n: [Int]) -> Int {
    return n[0] * 1000 + n[1] * 100 + n[2] * 10 + n[3]
}
