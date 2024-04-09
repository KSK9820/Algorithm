let nmr = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, r) = (nmr[0], nmr[1], nmr[2])

var arr = Array(repeating: Array(repeating: 0, count: m), count: n)
for i in 0..<n {
    arr[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

var op = readLine()!.split(separator: " ").map { Int($0)! }
for o in op {
    switch o {
    case 1:
        arr = one()
    case 2:
        arr = two()
    case 3:
        arr = three()
    case 4:
        arr = four()
    case 5:
        arr = five()
    case 6:
        arr = six()
    default:
        break
    }
}

print(arr.map { $0.map { String($0) }.joined(separator: " ") }.joined(separator: "\n"))

func one() -> [[Int]] {
    var result = [[Int]]()
    let n = arr.count
    for i in (0..<n).reversed() {
        result.append(arr[i])
    }
    return result
}

func two() -> [[Int]] {
    var result = [[Int]]()
    let n = arr.count
    for i in 0..<n {
        result.append(arr[i].reversed())
    }
    return result
}

func three() -> [[Int]] {
    var result = [[Int]]()
    let n = arr.count
    let m = arr[0].count
    for i in (0..<m) {
        var temp = [Int]()
        for j in (0..<n).reversed() {
            temp += [arr[j][i]]
        }
        result.append(temp)
    }
    return result
}

func four() -> [[Int]] {
    var result = [[Int]]()
    let n = arr.count
    let m = arr[0].count
    
    for i in(0..<m).reversed() {
        var temp = [Int]()
        for j in (0..<n).reversed() {
            temp += [arr[j][i]]
        }
        result.append(temp.reversed())
    }
    return result
}

func five() -> [[Int]] {
    let n = arr.count
    let m = arr[0].count
    let midn = n/2
    let midm = m/2
    var result = arr
    
    //1->2
    for i in 0..<midn {
        for j in midm..<m {
            result[i][j] = arr[i][j-midm]
        }
    }
    //2->3
    for i in midn..<n {
        for j in midm..<m {
            result[i][j] = arr[i-midn][j]
        }
    }
    //3->4
    for i in midn..<n {
        for j in 0..<midm {
            result[i][j] = arr[i][j+midm]
        }
    }
    //4->1
    for i in 0..<midn {
        for j in 0..<midm {
            result[i][j] = arr[i+midn][j]
        }
    }
    
    return result
}

func six() -> [[Int]] {
    let n = arr.count
    let m = arr[0].count
    let midn = n/2
    let midm = m/2
    var result = arr
    
    //1->4
    for i in midn..<n {
        for j in 0..<midm {
            result[i][j] = arr[i-midn][j]
        }
    }
    //4->3
    for i in midn..<n {
        for j in midm..<m {
            result[i][j] = arr[i][j-midm]
        }
    }
    //3->2
    for i in 0..<midn{
        for j in midm..<m {
            result[i][j] = arr[i+midn][j]
        }
    }
    //2->1
    for i in 0..<midn {
        for j in 0..<midm {
            result[i][j] = arr[i][j+midm]
        }
    }
    return result
}
