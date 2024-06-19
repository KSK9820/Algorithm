func mergeSort(_ array: [Int], _ s: Int, _ e: Int) {
    if array.count <= 1 { return }
    
    if s < e {
        let m = (s + e) / 2
        mergeSort(array, s, m)
        mergeSort(array, m + 1, e)
        merge(s, m, e)
    }
}

func merge(_ s: Int, _ m: Int, _ e: Int) {
    var i = s
    var j = m + 1
    
    var sortedArray = [Int]()
    
    while i <= m && j <= e {
        if arr[i] <= arr[j] {
            sortedArray.append(arr[i])
            i += 1
        } else {
            sortedArray.append(arr[j])
            j += 1
        }
    }
    
    while i <= m {
        sortedArray.append(arr[i])
        i += 1
    }
    
    while j <= e {
        sortedArray.append(arr[j])
        j += 1
    }
    
    i = s
    var t = 0
    while i <= e {
        arr[i] = sortedArray[t]
        count += 1
        if count == k {
            answer = sortedArray[t]
            break
        }
        i += 1
        t += 1
    }
}
                           

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n,k) = (nk[0], nk[1])
var arr = readLine()!.split(separator: " ").map { Int($0)! }

var count = 0
var answer = -1
mergeSort(arr, 0, n-1)
print(answer)