import Foundation

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ r:Int, _ c:Int, _ k:Int) -> String {
    // var dir = [(0,1,"d"), (-1,0,"l"), (1,0,"r"), (0,-1,"u")]
    // d(아래) l(왼) rl r(오) u(위) 
    
    let dis = abs(x-r) + abs(y-c) 
    if dis > k { return "impossible" }
    if (k - dis) % 2 == 1 { return "impossible" }
    
    var result = ""
    let dirs: [(dx: Int, dy: Int, ch: String)] = [
        (1, 0, "d"),
        (0, -1, "l"),
        (0, 1, "r"),
        (-1, 0, "u")
    ]
    
    var curx = x
    var cury = y
    var curd = k
    
    for _ in 0..<k {
        var stop = false
        
        for d in dirs {
            let newx = curx + d.dx
            let newy = cury + d.dy
            
            if newx < 1 || newy < 1 || newx > n || newy > m { continue }
            let rd = abs(newx - r) + abs(newy - c)
            let rc = curd - 1
            
            if rd <= rc && (rd - rc) % 2 == 0 {
                result += d.ch
                curx = newx
                cury = newy 
                curd = rc
                stop = true
                break 
            }
        }
        
        if !stop { 
            return "impossible"
        }
    }

    
    return result
}