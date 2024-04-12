
let nm = readLine()!.split(separator: " ").map { Int64($0)! }
let (n, m) = (nm[0], nm[1])

var result: Int64 = 1
if n>=m { result = 0 }
else {
    for i in 2...n {
        result = (result * i) % m
    }
}
print(result)
 
