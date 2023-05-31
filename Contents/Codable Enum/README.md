# Codable Enum

## Codable
<img src="https://github.com/sustainable-git/Development/assets/81242125/fb04aa04-9c2e-476a-a9c1-0a1cf3a79c2b">

- Swift 에서 `Codable`은 외부의 값을 받아들일 수 있는 값이다.
- 여기서 외부의 값이란 대표적으로 XML 또는 JSON이 있다.
- 대부분의 개발 과정에서 서버에서 값을 받아올 때 JSON을 받게 되고, 우리는 이 값을 struct로 변환해서 사용한다.

```swift
struct User: Codable {
    var name: String
    var age: Int
}
```

```swift
do {
    let user = try JSONDecoder().decode(User.self, from: data)
    print(user.name)
}
```

- 이 방법은 쉽고 직관적이지만 큰 문제가 있다.
- 바로 서버에서 보내주는 값과 `Codable` 객체가 완벽하게 동일한 타입의 property를 가지지 않으면 decode 할 수 없다는 것이다.

<br>

## 예시

- 우리나라는 나이를 만 나이와 연 나이로 두 가지를 사용하고 있다.
- 이에 서버는 우리에게 만 나이는 문자로, 연 나이를 숫자로 준다고 생각해보자
    - ex) 만 나이 : 만 28세, 연 나이 : 29
- `age` 가 "29"인 `Int` 가 아닌 "만 28세" 라는 `String` 이 들어온다면 decode 되지 않는다.
- 이 두 값을 동시에 받기 위해 `age` 를 `Any` 타입으로 변경하려고 할 수 있지만, `Any` type의 property를 가지면 객체가 `Codable`을 채택할 수 없다.

```swift
struct User: Codable { // Type 'User' does not conform to protocol 'Decodable'
    var name: String
    var age: Any
}
```

<br>

## Codable Enum

- 위 문제는 `Codable`을 채택한 enum을 사용하면 쉽게 해결할 수 있다.
- enum을 사용하면 여러가지 입력을 처리할 수 있다.
- 서버에서 korean의 경우와 global의 경우를 다르게 제공한다면 enum을 이용해 쉽게 `Codable` 객체로 변환할 수 있다..

```swift
import Foundation

enum User: Codable {
    case korean(name: String, age: String)
    case global(name: String, age: Int)
}

let koreanData = Data("""
{
    "korean": {
        "name": "sustainable-git",
        "age": "만 28세"
    }
}
""".utf8)
let globalData = Data("""
{
    "global": {
        "name": "sustainable-git",
        "age": 29
    }
}
""".utf8)

do {
    let koreanUser = try JSONDecoder().decode(User.self, from: koreanData)
    let globalUser = try JSONDecoder().decode(User.self, from: globalData)
    print(koreanUser) // korean(name: "hermione", age: "만 28세")
    print(globalUser) // global(name: "hermione", age: 29)
}
```

- 하지만, 서버는 그렇게 쉽게 우리가 원하는 방식으로 data를 제공하지 않을지도 모른다.
- 또한, enum 객체로 받는 것보다 struct 객체로 받아서 사용하는게 우리에겐 더 익숙하다.
- 이런 경우에는 struct와 enum을 동시에 사용하면서 enum의 init 과정에서 decode logic을 customize하면 문제를 해결할 수 있다.

```swift
import Foundation

struct User: Codable {
    var name: String
    var age: Age
}

enum Age: Codable {
    case number(Int)
    case string(String)
    
    init(from decoder: Decoder) throws {
        if let number = try? decoder.singleValueContainer().decode(Int.self) {
            self = .number(number)
            return
        }
        if let string = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(string)
            return
        }
        throw AgeError.invalidValue
    }
    
    enum AgeError: Error {
        case invalidValue
    }
}

let koreanData = Data("""
{
    "name": "sustainable-git",
    "age": 29
}
""".utf8)
let globalData = Data("""
{
    "name": "sustainable-git",
    "age": "만 28세"
}
""".utf8)

do {
    let koreanUser = try JSONDecoder().decode(User.self, from: koreanData)
    let globalUser = try JSONDecoder().decode(User.self, from: globalData)
    print(koreanUser) // User(name: "sustainable-git", age: SwiftTest.Age.number(29))
    print(globalUser) // User(name: "sustainable-git", age: SwiftTest.Age.string("만 28세"))
}

```
