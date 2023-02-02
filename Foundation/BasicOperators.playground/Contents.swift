import Foundation

// Playground for Basic Operators

/*
 [튜플(tuple)과 비교연산자]
 
 같은 타입의 값을 갖는 두 개의 튜플을 비교할 수 있습니다.
 튜플의 비교는 왼쪽에서 오른쪽 방향으로 이뤄지고 한번에 한개의 값만 비교합니다.
 이 비교를 다른 두 값을 비교하게 될 때까지 수행합니다.
 */

(1, "zebra") < (2, "apple")
// true, 1이 2보다 작고; zebra가 apple은 비교하지 않기 때문
(3, "apple") < (3, "bird")
// true 왼쪽 3이 오른쪽 3과 같고; apple은 bird보다 작기 때문
(4, "dog") == (4, "dog")
// true 왼쪽 4는 오른쪽 4와 같고 왼쪽 dog는 오른쪽 dog와 같기 때문

// 튜플은 비교 연산자가 해당 값을 비교할 수 있는 경우에만 비교를 수행할 수 있습니다.
("blue", -1) < ("purple", 1)        // 비교가능, 결과 : true
//("blue", false) < ("purple", true)  // 에러, Boolean 값은 < 연산자로 비교할 수 없기 때문에


/*
 [XOR 연산자 (^)]
 
 XOR 연산자에는 같은 수를 2번 연산하면 없어지는 속성이 있습니다.
 게다가 그 같은 수 2번의 위치는 꼭 붙어있지 않아도 상관이 없습니다.
 */

3^5^5   // 3
3^5^5^3 // 0
3^3^5   // 5


// [범위 연산자]
// - 닫힌 범위 연산자: (a...b)의 형태
 
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

// - 반 닫힌 범위 연산자: (a..<b)의 형태
let names = ["Anna", "Alex", "Brian", "Jack"]
for i in 0..<names.count {
    print("Person \(i + 1) is called \(names[i])")
}

// - 단방향 범위 연산자: [a..] [..a]의 형태
for name in names[2...] {
    print(name) // Brian, Jack
}

for name in names[...2] {
    print(name) // Anna, Alex, Brian
}

for name in names[..<2] {
    print(name) // Anna, Alex
}

let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true

