let k = Int(readLine()!)!
var ab = [(a: Int, b: Int)](repeating: (0,0), count: k+1)
ab[1] = (0,1)

if k != 1 {
    for i in 2...k  {
        ab[i] = (a: ab[i-1].b, b: ab[i-1].a + ab[i-1].b )
    }
}
print("\(ab[k].a) \(ab[k].b)")
