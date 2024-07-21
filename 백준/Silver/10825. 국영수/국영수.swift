let n = Int(readLine()!)!
var arr = [(name: String, k: Int, e: Int, m: Int)]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    arr.append((String(input[0]), Int(input[1])!, Int(input[2])!, Int(input[3])!))
}

arr.sort {
    if $0.k == $1.k {
        if $0.e == $1.e {
            if $0.m == $1.m {
                return $0.name < $1.name
            } else {
                return $0.m > $1.m
            }
        } else {
            return $0.e < $1.e
        }
    } else {
        return $0.k > $1.k
    }
}

for i in arr.indices {
    print(arr[i].name)
}
