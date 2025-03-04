let n = Int(readLine()!)!
var result = [0,1,2]
if n <= 2 {
    print(result[n])
} else {
    for i in 3...n {
        result.append((result[i-2] + result[i-1]) % 10007)
    }
    print(result[n])
}

