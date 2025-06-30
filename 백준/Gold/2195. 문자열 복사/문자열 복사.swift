let s = readLine()!.map { String($0) }
let p = readLine()!.map { String($0) }

var pidx = 0
var result = 0
while pidx < p.count {
    
    var pmax = 0
    for sidx in s.indices where pidx < p.count {
        if p[pidx] == s[sidx] {
            var ptemp = pidx
            var stemp = sidx
            while ptemp < p.count && stemp < s.count && p[ptemp] == s[stemp] {
                ptemp += 1
                stemp += 1
            }
            pmax = max(pmax,  ptemp)
        }
    }
    pidx = pmax
    result += 1
}

print(result)