let board = readLine()!.map { String($0) }
var result = ""

var index = 0
while true {
    if index + 3 < board.count {
        if board[index...index+3].joined() == "XXXX" {
            result.append("AAAA")
            index += 4
            continue
        }
    }
    if index + 1 < board.count {
        if board[index...index+1].joined() == "XX" {
            result.append("BB")
            index += 2
            continue
        }
    }
    if index < board.count && board[index] == "." {
        result.append(".")
        index += 1
        continue
    }
    break
}
if result.count != board.count {
    print(-1)
} else {
    print(result)
}
