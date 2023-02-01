import Foundation

/*
 // (Time Complexity) TapeEquilibrium
 // https://app.codility.com/programmers/lessons/3-time_complexity/tape_equilibrium/
 
 A non-empty array A consisting of N integers is given. Array A represents numbers on a tape.

 Any integer P, such that 0 < P < N, splits this tape into two non-empty parts: A[0], A[1], ..., A[P − 1] and A[P], A[P + 1], ..., A[N − 1].

 The difference between the two parts is the value of: |(A[0] + A[1] + ... + A[P − 1]) − (A[P] + A[P + 1] + ... + A[N − 1])|

 In other words, it is the absolute difference between the sum of the first part and the sum of the second part.

 For example, consider array A such that:

   A[0] = 3
   A[1] = 1
   A[2] = 2
   A[3] = 4
   A[4] = 3
 We can split this tape in four places:

 P = 1, difference = |3 − 10| = 7
 P = 2, difference = |4 − 9| = 5
 P = 3, difference = |6 − 7| = 1
 P = 4, difference = |10 − 3| = 7
 Write a function:

 public func solution(_ A : inout [Int]) -> Int
 that, given a non-empty array A of N integers, returns the minimal difference that can be achieved.

 For example, given:

   A[0] = 3
   A[1] = 1
   A[2] = 2
   A[3] = 4
   A[4] = 3
 the function should return 1, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [2..100,000];
 each element of array A is an integer within the range [−1,000..1,000].
 
 */

/*
 # 문제요약
 테이프(숫자 배열) 중간 어딘가를 끊었을 때, 테이프 앞 뒤의 차이가 가장 작은 숫자를 찾는 문제.
 
 # 풀이
 앞은 0, 뒤는 배열 총합에서 시작해서 for를 돌면서 갭을 찾아가는 문제입니다.
 for 마지막 index에서는 계산 멈춰야 100%가 나옵니다.
 
 */


public class TapeEquilibrium {
    
    public class func solution(_ A : [Int]) -> Int {
        var rtn = 100000
        var front = 0
        var back = A.reduce(0, +)
        
        for (index, value) in A.enumerated() {
            if index == A.count-1 {
                break
            }

            front += value
            back -= value
            let gap = abs(back-front)
            
            if rtn > gap {
                rtn = gap
            }
        }
            
        return rtn
    }
}
