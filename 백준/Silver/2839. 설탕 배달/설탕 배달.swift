let n = Int(readLine()!)!
var result = 0
var left = 0
if [1,2,4].contains(n) {
    result = -1
} else {
    for i in (0...n/5).reversed() {
        if a(five: i) {
            break
        }
    }
}
print(result)

func a(five: Int) -> Bool {
    result = five
    left = n - five * 5
    if left % 3 != 0 {
        result = -1
        return false
    } else {
        result = five + left / 3
        return true
    }
}
