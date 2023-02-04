import Foundation

// Array(repeating repeatedValue: Element, count: Int)
// 같은 값을 N개를 포함하는 배열을 생성할 때 유용한 생성자입니다.

Array(repeating: 1, count: 5)


/*
 // sort와 sorted
 Array의 정렬에는 sort와 sorted가 있습니다.
 sort는 mutating함수로 원본의 배열을 정렬시켜 새 배열을 반환시켜주지 않습니다.
 sorted는 새로운 정렬된 배열을 반환해줍니다.
 
 */

var originalArray = [3, 4, 1, 10, 9, 0]
let sortedArray = originalArray.sorted()
print(originalArray) // [3, 4, 1, 10, 9, 0]
originalArray.sort()
print(originalArray) // [0, 1, 3, 4, 9, 10]
