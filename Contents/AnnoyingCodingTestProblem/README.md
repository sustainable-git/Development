# AnnoyingCodingTestProblem

## BaekJoon 11729 - 하노이 탑 이동 순서

- 성공 code
```swift 
import Foundation

let K = Int(readLine()!)!

func hanoi(n: Int, from: Int, sub: Int, to: Int) {
    if n == 1 {
        print("\(from) \(to)")
    } else {
        hanoi(n: n-1, from: from, sub: to, to: sub)
        print("\(from) \(to)")
        hanoi(n: n-1, from: sub, sub: from, to: to)
    }
}

print(1<<K - 1)
hanoi(n: K, from: 1, sub: 2, to: 3)
```

- 시간초과 code

```swift
import Foundation

let K = Int(readLine()!)!

func hanoi(n: Int, from: Int, sub: Int, to: Int) {
    if n == 1 {
        print(from, to)
    } else {
        hanoi(n: n-1, from: from, sub: to, to: sub)
        print(from, to)
        hanoi(n: n-1, from: sub, sub: from, to: to)
    }
}

print(1<<K - 1)
hanoi(n: K, from: 1, sub: 2, to: 3)
```

- 결론
    - print 문도 시간 초과에 문제가 될 수 있다
    - 아니... 단순 print 문에 걸리는 시간까지도 고려해야 하냐? 너무한다 진짜

<br>

## 프로그래머스 - 짝지어 제거하기

- 성공 code
```swift
func solution(_ s:String) -> Int{
    var stackString = ""
    
    for char in s {
        if stackString.last == char {
            _ = stackString.popLast()
        } else {
            stackString.append(char)
        }
    }

    return stackString.count == 0 ? 1 : 0
}
```

- 시간초과 code
```swift
func solution(_ s:String) -> Int{
    var stack: [String] = []

    for char in s.map({ String($0) }) {
        if stack.last == char {
            _ = stack.popLast()
        } else {
            stack.append(char)
        }
    }

    return stack.count == 0 ? 1 : 0
}
```

- 결론
    - String을 Array로 바꾸는 mapping에도 상당한 시간이 걸릴 수 있다.
