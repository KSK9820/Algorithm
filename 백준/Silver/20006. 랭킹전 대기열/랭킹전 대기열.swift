
var pm = readLine()!.split(separator: " ").map { Int($0)! }
let (p, m) = (pm[0], pm[1])

var game = [[(l: Int, n: String)]]()
for _ in 0..<p {
    let ln = readLine()!.split(separator: " ").map { String($0) }
    let (l,n) = (ln[0], ln[1])
    
    var flag = false
    for i in game.indices {
        if game[i].count < m && abs(game[i][0].l - Int(l)!) <= 10 {
            game[i].append((Int(l)!, n))
            flag = true
            break
        }
    }
    if !flag {
        game.append([(Int(l)!, n)])
    }
}
var result = ""
for i in game.indices {
    if game[i].count == m {
        result += "Started!\n"
    } else {
        result += "Waiting!\n"
    }
    
    game[i].sort { $0.n < $1.n }
    game[i].forEach {
        result += "\($0.l) \($0.n)\n"
    }
        
}

print(result)