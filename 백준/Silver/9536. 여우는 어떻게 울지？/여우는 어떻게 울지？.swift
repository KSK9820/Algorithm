for _ in 0..<Int(readLine()!)! {
    let sound = readLine()!.split(separator: " ").map { String($0) }
    var animal = [String:String]()
    while true {
        let input = readLine()!.split(separator: " ").map { String($0) }
        if input.joined(separator: " ") == "what does the fox say?" { break }
        animal[input[2]] = input[0]
    }
    
    var result = ""
    for i in sound {
        if (animal[i] == nil) {
            result.append("\(i) ")
        }
    }
    print(result)
}

