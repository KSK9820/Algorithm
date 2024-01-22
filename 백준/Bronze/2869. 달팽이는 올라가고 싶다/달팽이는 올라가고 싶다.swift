let abv = readLine()!.split(separator: " ").map { Int($0)! }
var (a, b, v) = (abv[0], abv[1], abv[2])

if (v-a) % (a - b) > 0 {
    print((v-a) / (a-b) + 2)
} else if (v-a) % (a-b) == 0 {
    print((v-a) / (a-b) + 1)
}
