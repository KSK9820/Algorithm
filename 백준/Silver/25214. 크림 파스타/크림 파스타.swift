
let n = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map { Int($0)! }
var arr = [(minimum: Int, maximum: Int)](repeating: (0, 0), count: n)

var result = [Int](repeating: 0, count: n)
for i in 1..<n {
    
    if arr[i-1].minimum > arr[i-1].maximum {
        if input[arr[i-1].minimum] > input[i]   {
            arr[i] = (i, arr[i-1].maximum)
        } else if input[arr[i-1].maximum] > input[i] {
            if result[i-1] > input[i] - input[arr[i-1].minimum] {
                arr[i] = arr[i-1]
            } else {
                arr[i] = (arr[i-1].minimum, i)
            }
        } else {
            arr[i] = (arr[i-1].minimum, i)
        }
    } else {
        if input[i] >= input[arr[i-1].maximum] {
            arr[i] = (arr[i-1].minimum, i)
        } else if input[i] < input[arr[i-1].minimum] {
            arr[i] = (i, arr[i-1].maximum)
        } else {
            arr[i] = arr[i-1]
        }
    }


    let minIndex = arr[i].minimum
    let maxIndex = arr[i].maximum

    if minIndex > maxIndex {
        result[i] = result[i-1]
        continue
    }
    if minIndex <= maxIndex {
        result[i] = (input[maxIndex] - input[minIndex])
    } else {
        if input[minIndex] - input[maxIndex] <= input[i] - input[minIndex] {
            arr[i].maximum = i
        }
        result[i] = (input[arr[i].maximum] - input[arr[i].minimum])
    }
}

print(result.map { String($0) }.joined(separator: " "))
