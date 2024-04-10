s = list(input())
t = list(input())

while len(s) != len(t):
    if t.pop() == 'B':
        t.reverse()

result = 1 if s == t else 0
print(result)
