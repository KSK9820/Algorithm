
var result = ""
for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    var dp = Array(repeating: Array(repeating:0, count: 7), count: n+1)
    dp[0][1] = 1
    
    for i in 1...n {
        let input = readLine()!.split(separator: " ").map { String($0) }
    
        dp[i] = calculate(arr: dp[i-1], input: input)
    }
    result += dp[n][0] == 1 ? "LUCKY\n" : "UNLUCKY\n"
}

print(result)

func calculate(arr: [Int], input: [String]) -> [Int] {
    let (o1, v1, o2, v2) = (input[0], input[1], input[2], input[3])
    
    var result = Array(repeating: 0, count: 7)
    for i in 0...6 where arr[i] == 1 {
        var temp = 0
        if o1 == "*" {
            temp = (i * Int(v1)!) % 7
        } else {
            temp = (i + Int(v1)!) % 7
        }
        result[temp] = 1
        
        if o2 == "*" {
            temp = (i * Int(v2)!) % 7
        } else {
            temp = (i + Int(v2)!) % 7
        }
        result[temp] = 1
    }
    
    return result
}

