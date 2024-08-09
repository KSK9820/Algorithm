let n = Int(readLine()!)!
var result = 0
var five = 0
var two = 0
if n == 0 {
    print(0)
} else {
    for i in 1...n {
        var number = i
        while number % 5 == 0 {
            number = number / 5
            five += 1
        }
        while number % 2 == 0 {
            number = number / 2
            two += 1
        }
    }
    print(min(two, five))
}
