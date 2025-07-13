import Foundation 
let nml = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m,L) = (nml[0], nml[1], nml[2])
if n == 0 {
    print(Int(ceil(Double(L) / Double(m + 1))))
} else {
    let h = [0] + readLine()!.split(separator: " ").map { Int($0)! }.sorted() + [L]
    var l = 1
    var r = 0
    
    for i in 1...n+1 {
        r = max(r, h[i] - h[i-1])
    }
    
    while l <= r {
        var c = 0
        let mid = (l + r) / 2
        
        for i in 1..<h.count {
            let gap = h[i] - h[i-1]
            
            if gap > mid {
                c += (gap-1) / mid
            }
        }
        
        if c <= m {
            r = mid - 1
        } else {
            l = mid + 1
        }
    }
    
    print(l)
    
}
