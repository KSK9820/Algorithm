from dataclasses import dataclass
import sys

sys.setrecursionlimit(10**5)

@dataclass
class Coord:
    y: int
    x: int


n, l, r = map(int, input().split())
ddang = []
for i in range(n):
    ddang.append(list(map(int, input().split())))
visited = [[False for _ in range(n)] for _ in range(n)]
mx = [-1, 0, 1, 0]
my = [0, -1, 0, 1]

def dfs(y,  x, union: list):
    for d in range(4):
        newx = x + mx[d]
        newy = y + my[d]
        if newx < 0 or newx >= n or newy < 0 or newy >= n:
            continue
        if visited[newy][newx] == True:
            continue
        dif = abs(ddang[y][x]-ddang[newy][newx])
        if dif >= l and dif <= r:
            visited[newy][newx] = True
            union.append(Coord(newy, newx))
            dfs(newy, newx, union)
    return union

day = 0 
while True:
    visited = [[False for _ in range(n)] for _ in range(n)]
    unions: list[list[Coord]] = []
    for i in range(n):
        for j in range(n):
            if visited[i][j] == False:
                visited[i][j] = True
                result = dfs(i,j,[Coord(i, j)])
                if len(result) !=  1:
                    unions.append(result)
    if unions == []:
        print(day)
        break
    else:
        day += 1
    for union in unions:
        if union:
            total = sum(ddang[u.y][u.x] for u in union)
        for u in union:
            ddang[u.y][u.x] = total // len(union)
      
        
