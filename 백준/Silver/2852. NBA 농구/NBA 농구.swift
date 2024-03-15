
import Foundation
let n = Int(readLine()!)!

// 지금 스코어
var nowScore = [0,0]
// 역전된 상황 시간
var reversedTime = [0,0]
// 지속 시간
var winningTime = [0,0]

var record = [(Int, Int)]()
var whoseWin = -1

for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    let time = input[1].split(separator: ":").map { Int($0)! }
    
    let whosewin = Int(input[0])! - 1
    let now = time[0] * 60 + time[1]
    record.append((whosewin, now))
}


// 첫판
whoseWin = record[0].0
nowScore[record[0].0] += 1
reversedTime[record[0].0] = record[0].1
var flag = false
for i in 1...n {
    if i == n{
        if whoseWin == -1 {
            break
        }
        record.append((whoseWin, 48*60))
    }    
    nowScore[record[i].0] += 1

    // 승리자에 변화가 없는 경우
    if winner() == -1 {
        winningTime[whoseWin] += record[i].1 - reversedTime[whoseWin]
        flag = true
        whoseWin = -1
    } else if whoseWin == winner() {
        if flag == false {
            winningTime[winner()] += record[i].1 - reversedTime[winner()]
            reversedTime[winner()] = record[i].1
        } else {
            whoseWin = winner()
            reversedTime[record[i].0] = record[i].1
            flag = false
        }
    } else {
        if flag == false {
            winningTime[winner()] += record[i].1 - reversedTime[abs(winner()-1)]
            reversedTime[winner()] = record[i].1
        } else {
            whoseWin = winner()
            reversedTime[record[i].0] = record[i].1
            flag = false
        }
    }
   
    
}

print(convert(winningTime[0]))
print(convert(winningTime[1]))

func winner() -> Int {
    if nowScore[0] > nowScore[1] {
        return 0
    } else if nowScore[0] == nowScore[1]{
        return -1
    } else {
        return 1
    }
}

func convert(_ time: Int) -> String {
    let m = time / 60
    let s = time % 60
    
    return String(format: "%02d", m) + ":" + String(format: "%02d", s)
}


