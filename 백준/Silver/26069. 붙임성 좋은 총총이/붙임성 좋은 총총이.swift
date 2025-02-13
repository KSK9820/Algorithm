var dance = Set<String>()
dance.insert("ChongChong")

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { String($0) }
    if dance.contains(input[0]) || dance.contains(input[1]) {
        dance.insert(input[0])
        dance.insert((input[1]))
    }
}
print(dance.count)
