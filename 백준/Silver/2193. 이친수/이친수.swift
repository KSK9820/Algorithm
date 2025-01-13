let n = Int(readLine()!)!
var pn = [(t: Int, o: Int)](repeating: (-1, -1), count: n+1)
pn[1] = (t: 1, o: 1)
if n > 1 {
    for i in 2...n {
        pn[i].t = pn[i-1].t * 2 - pn[i-1].o
        pn[i].o = pn[i-1].t - pn[i-1].o
    }
}
print(pn[n].t)
