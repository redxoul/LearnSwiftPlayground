import Foundation

/*
 // (Caterpillar method) AbsDistinct
 // https://app.codility.com/programmers/lessons/15-caterpillar_method/abs_distinct/
 
 A non-empty array A consisting of N numbers is given. The array is sorted in non-decreasing order. The absolute distinct count of this array is the number of distinct absolute values among the elements of the array.

 For example, consider array A such that:

   A[0] = -5
   A[1] = -3
   A[2] = -1
   A[3] =  0
   A[4] =  3
   A[5] =  6
 The absolute distinct count of this array is 5, because there are 5 distinct absolute values among the elements of this array, namely 0, 1, 3, 5 and 6.

 Write a function:

 public func solution(_ A : inout [Int]) -> Int
 that, given a non-empty array A consisting of N numbers, returns absolute distinct count of array A.

 For example, given array A such that:

   A[0] = -5
   A[1] = -3
   A[2] = -1
   A[3] =  0
   A[4] =  3
   A[5] =  6
 the function should return 5, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..100,000];
 each element of array A is an integer within the range [−2,147,483,648..2,147,483,647];
 array A is sorted in non-decreasing order.
 
 */

/*
 # 문제 요약
 N개의 숫자로 비어있지 않은 배열 A이 주어지고, 이는 감소하지 않는 순서로 정렬되어 있습니다.
 이 배열의 절대고유갯수는 배열의 요소들 사이에서 구별되는 절대값의 수를 구해야 합니다.
 예) A:[-5, -3, -1, 0, 3, 6]
 
 이 배열의 요소들 가운데 5개의 고유한 절대값 '0, 1, 3, 5, 6' 이 있기 때문에 절대고유갯수는 5 입니다.
 N: [1...100,000] 사이의 정수
 A배열 각 요소는 −2,147,483,648..2,147,483,647 범위
 
 # 풀이
 A배열을 map으로 절대값 배열로 바꿔 set에 넣으면 해결됩니다.
 
 */

public class AbsDistinct {
    
    public class func solution(_ A : [Int]) -> Int {
        let setA = Set(A.map({ (a: Int) -> Int in
            return a<0 ? -a : a
        }))
        
        return setA.count
    }
}
