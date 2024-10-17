let n = Int(readLine()!)!
var input =  Array(1...n)
var output = [Int]()

func enqueue(_ element: Int) {
    input.append(element)
}

func dequeue() -> Int {
    if output.isEmpty {
        output = input.reversed()
        input = []
        
    }
    return output.removeLast()
}

while input.count + output.count != 1 {
    dequeue()
    let card = dequeue()
    enqueue(card)
}
input.count == 1 ? print(input[0]) : print(output[0])
