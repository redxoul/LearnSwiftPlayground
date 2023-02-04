import Foundation

// 집합 파라메터
// 인자 값으로 특정 형(type)의 집합 값을 사용할 수 있습니다.

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)

// inout 파라메터
// 인자 값을 직접 변경하는 파라미터입니다.
// 선언을 위해 파라미터 앞에 inout 이라는 키워드를 사용합니다.
// inout 파라미터는 기본 값을 갖을 수 없고, 집합 파라미터는 inout으로 선언될 수 없습니다.
// inout 파라미터를 사용하는 것은 함수의 반환 값을 사용하지 않고 함수 scope 밖에 영향을 줄 수 있는 또 하나의 방법입니다.

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
