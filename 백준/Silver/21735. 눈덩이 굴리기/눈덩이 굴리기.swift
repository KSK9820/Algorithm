let nm = readLine()!.split(separator: " ").map { Int($0)! }
var (n, m) = (nm[0], nm[1])

let snow = readLine()!.split(separator: " ").map { Int($0)! }
var nun = Array(repeating: 0, count: n)

var result = 0
func nunsong(time: Int, idx: Int, size: Int) {
    if time == m {
        result = max(result, size)
        return
    }
    if idx == n - 1 {
        result = max(result, size)
        return
    }
    if idx + 1 < n {
        nunsong(time: time + 1, idx: idx + 1, size: size + snow[idx+1])
    }
    if idx + 2 < n {
        nunsong(time: time + 1, idx: idx + 2 , size: size / 2 + snow[idx + 2])
    }
}
nunsong(time: 0, idx: -1, size: 1)
print(result)
