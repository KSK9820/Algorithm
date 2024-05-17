let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var apartment = [Int](repeating: 0, count: 10001)
for i in 1...m {
    let h = readLine()!.split(separator: " ").map { Int($0)! }
    apartment[h[0]] = i
    apartment[h[1]] = i
}

apartment = apartment.filter{ $0 != 0 }

let idx = n % (2 * m)
if idx == 0 {
    print(apartment.last!)
} else {
    print(apartment[idx-1])
}
