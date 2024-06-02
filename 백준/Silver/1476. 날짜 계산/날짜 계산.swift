let esm = readLine()!.split(separator: " ").map { Int($0)! }
let (e,s,m) = (esm[0], esm[1], esm[2])

var year = 0

var (E, S, M) = (0, 0, 0)
while true {
    year += 1
    E += 1; S += 1; M += 1
    if E == e && S == s && M == m { break }
    E %= 15; S %= 28; M %= 19
}

print(year)