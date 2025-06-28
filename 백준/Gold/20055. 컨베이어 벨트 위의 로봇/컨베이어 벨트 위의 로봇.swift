

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n,k) = (nk[0], nk[1])

var arr = readLine()!.split(separator: " ").map { Int($0)! }
var r = Array(repeating: false, count: n)
var result = 0


while true {
    result += 1
    // 회전
    arr.insert(arr.removeLast(), at: 0)
    r.insert(r.removeLast(), at: 0)
    
    // n칸에 도착한 로봇 제거
    if r[n-1] == true { r[n-1] = false }
    
    // 로봇 이동: 가장 먼저 올라간 순서니까 n에 근접한 순서부터
    for i in (0..<n-1).reversed() {
        if r[i] && !r[i+1] && arr[i+1] > 0 {
            arr[i+1] -= 1
            r[i] = false
            r[i+1] = true
            
            if i+1 == n-1 { r[i+1] = false }
        }
    }
   
    // 0번째 추가
    if arr[0] > 0 && r[0] == false {
        arr[0] -= 1
        r[0] = true
    }
    
    if arr.filter({ $0 == 0 }).count >= k { print(result); break }
}
