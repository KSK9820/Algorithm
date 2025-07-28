
let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var result = 0

for i in 0..<n{
    var l = i + 1
    var r = n - 1
    
    while l < r {
        let sum = a[i] + a[l] + a[r]
        
        if sum < 0 {
            l += 1
        } else if sum >  0 {
            r -= 1
        } else {
            if a[l] == a[r] {
                result += (r-l) * (r-l + 1) / 2
                break
            } else {
                let (s,e) = (l,r)
                
                while l + 1 < r && a[l] == a[l + 1] { l += 1 }
                while l < r - 1 && a[r] == a[r - 1] { r -= 1 }
                
                result += (l - s + 1) * (e - r + 1)
                l += 1
                r -= 1
            }
        }
    }
}
print(result)
