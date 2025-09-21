import Foundation

func solution(_ commands:[String]) -> [String] {
    
     func find(_ r: Int, _ c: Int) -> (Int, Int) {
        let (pr, pc) = parent[r][c]
        
        if (pr, pc) != (r, c) {
            parent[r][c] = find(pr, pc)
        }
        
        return parent[r][c]
    }
    
    func union(_ r1: Int, _ c1: Int, _ r2: Int, _ c2: Int) {
        let root1 = find(r1, c1)
        let root2 = find(r2, c2)
        
        if root1 != root2 {
            let value = arr[root1.0][root1.1] != "EMPTY" ? arr[root1.0][root1.1] : arr[root2.0][root2.1]
            parent[root2.0][root2.1] = root1
            arr[root1.0][root1.1] = value
           arr[root2.0][root2.1] = "EMPTY"
        }
    }
    
    var arr = Array(repeating: Array(repeating: "EMPTY", count: 50), count: 50)
    var parent = Array(repeating: Array(repeating: (0,0), count: 50), count: 50)
    var result = [String]()
    
    for y in 0..<50 {
        for x in 0..<50 {
            parent[y][x] = (y,x)
        }
    }
    
    for command in commands {
        let input = command.split(separator: " ").map { String($0) }
        let c = input[0]
        
        switch c {
            case "UPDATE":
                if input.count == 4 {
                    let (r,c) = (Int(input[1])! - 1, Int(input[2])! - 1)
                    let root = find(r, c)
                    
                    arr[root.0][root.1] = input[3]
                } else {
                    for y in 0..<50 {
                        for x in 0..<50 {
                           let root = find(y, x)
                            if arr[root.0][root.1] == input[1] {
                                arr[root.0][root.1] = input[2]
                            }
                        }
                    }
                }
            case "MERGE":
                let (r1, c1, r2, c2) = (Int(input[1])! - 1, Int(input[2])! - 1, Int(input[3])! - 1, Int(input[4])! - 1)
                if (r1, c1) != (r2, c2) {
                    union(r1, c1, r2, c2)
                }
            case "UNMERGE":
                let (r,c) = (Int(input[1])! - 1, Int(input[2])! - 1)
                let root = find(r,c)
                let value = arr[root.0][root.1] 
            
                var unmerge: [(Int, Int)] = []
                for y in 0..<50 {
                    for x in 0..<50 {
                        if find(y,x) == root {
                            unmerge.append((y,x))
                        }
                    }
                }
            
                for u in unmerge {
                    arr[u.0][u.1] = "EMPTY"    
                    parent[u.0][u.1] = u
                }
                
                arr[r][c] = value
            case "PRINT":
                let (r,c) = (Int(input[1])! - 1, Int(input[2])! - 1)
                let root = find(r,c)
            
                result.append(arr[root.0][root.1])
            default:
                break
        }    
    }
    
    return result
}