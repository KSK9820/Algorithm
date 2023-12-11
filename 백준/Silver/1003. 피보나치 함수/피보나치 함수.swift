
let t = Int(readLine()!)!

var f: [(Int, Int)] = Array(repeating: (0,0), count: 41)
f[0] = (1, 0); f[1] = (0, 1);
for n in 2..<41 {
    f[n] = (f[n-1].0 + f[n-2].0, f[n-1].1 + f[n-2].1)
}



for _ in 0..<t {
    let n = Int(readLine()!)!
    
    print("\(f[n].0) \(f[n].1)")
}
