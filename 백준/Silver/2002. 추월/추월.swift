let n = Int(readLine()!)!
var before = [String]()
var after = [String]()
var car = [String: Bool]()

for _ in 0..<n {
    before.append(readLine()!)
}
for i in 0..<n {
    after.append(readLine()!)
    car.updateValue(false, forKey: after.last!)
}

var count = 0
var bi  = 0
var ai = 0

for b in before {
    for a in after {
        if car[a] == true {
            continue
        }
        if car[b] == false && b != a {
            car[a] = true
            count += 1
        }
        if car[b] == false && b == a {
            car[a] = true
            break
        }
    }
}

print(count)