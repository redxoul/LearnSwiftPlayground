import Foundation

/*
 // [Set]
 Set(집합)은 Array와 유사하지만 같은 값을 또 넣을 수 없다는 특징이 있는 Collection Type입니다.
 Set에 저장되기 위해서는 반드시 타입이 Hashable 프로토콜을 따라야 합니다.
 기본적 사용법은 Array와 유사합니다.
 아래는 Set에만 있는 Operator로 두 배열간의 집합을 쉽게 처리해줍니다.
 
 */

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted() // 합집합
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

oddDigits.intersection(singleDigitPrimeNumbers).sorted() // 교집합
// []

oddDigits.subtracting(singleDigitPrimeNumbers).sorted() // 차집합
// [1, 9]

oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted() // 대칭차(두 집합의 상대 여집합의 합)
// [1, 2, 9]


/*
 Set의 동등비교를 위해서는 == 연산자를
 맴버 여부를 확인하기 위해서는 아래 연산자들을 사용합니다.
 isSubset(of:)          -> 부분집합인지 확인. 동일한 Set일 때도 true
 isStrictSubset(of:)    -> 진부분집합인지 확인. 동일하지 않은 Set일 때만 true
 isSuperset(of:)        -> 상위집합인지 확인. 동일한 Set일 때도 true
 isStrictSuperset(of:)  -> 진상위집합인지 확인. 동일하지 않은 Set일 때만 true
 isDisjoint(with:)      -> 두집합이 겹치는 원소가 없을 때 true
 */

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
houseAnimals.isSubset(of: houseAnimals)

houseAnimals.isStrictSubset(of: farmAnimals)
houseAnimals.isStrictSubset(of: houseAnimals)

farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isSuperset(of: farmAnimals)

farmAnimals.isStrictSuperset(of: houseAnimals)
farmAnimals.isStrictSuperset(of: farmAnimals)

farmAnimals.isDisjoint(with: cityAnimals)

