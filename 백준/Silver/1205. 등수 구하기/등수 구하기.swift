
let nsp = readLine()!.split(separator: " ").map { Int($0)! }
let (n,s,p) = (nsp[0], nsp[1], nsp[2])

if n == 0 {
    print(1)
} else {
    let rank = readLine()!.split(separator: " ").map { Int($0)! }
    var rankingList: [(score: Int, count: Int, rank: Int)] = [(rank[0], 1, 1)]
    
    for i in 1..<n {
        if rankingList.last!.score == rank[i] {
            rankingList[rankingList.count - 1].count += 1
        } else {
            rankingList.append((rank[i], 1, rankingList.last!.rank + rankingList.last!.count))
        }
    }
    
    //if 분기 다시 해야함
    if n == p {
        if rankingList.last!.score >= s {
            print(-1)
        } else {
            if rankingList[0].score < s {
                print(1)
            } else {
                for i in 0..<rankingList.count {
                    if rankingList[i].score == s {
                        print(rankingList[i].rank)
                        break
                    } else if rankingList[i].score < s {
                        print(rankingList[i-1].rank + rankingList[i-1].count)
                        break
                    }
                }
            }
        }
    } else {
        if rankingList[0].score < s {
            print(1)
        } else if rankingList.last!.score > s {
            print(rankingList.last!.rank + rankingList.last!.count)
        } else {
            for i in 0..<rankingList.count {
                if rankingList[i].score == s {
                    print(rankingList[i].rank)
                    break
                } else if rankingList[i].score < s {
                    print(rankingList[i-1].rank + rankingList[i-1].count)
                    break
                }
            }
        }
    }
}
