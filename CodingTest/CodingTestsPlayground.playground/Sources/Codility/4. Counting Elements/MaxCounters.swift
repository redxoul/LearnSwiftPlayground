import Foundation

/*
 // (Counting Elements) MaxCounters
 // https://app.codility.com/programmers/lessons/4-counting_elements/max_counters/
 
 You are given N counters, initially set to 0, and you have two possible operations on them:

 increase(X) − counter X is increased by 1,
 max counter − all counters are set to the maximum value of any counter.
 A non-empty array A of M integers is given. This array represents consecutive operations:

 if A[K] = X, such that 1 ≤ X ≤ N, then operation K is increase(X),
 if A[K] = N + 1 then operation K is max counter.
 For example, given integer N = 5 and array A such that:

     A[0] = 3
     A[1] = 4
     A[2] = 4
     A[3] = 6
     A[4] = 1
     A[5] = 4
     A[6] = 4
 the values of the counters after each consecutive operation will be:

     (0, 0, 1, 0, 0)
     (0, 0, 1, 1, 0)
     (0, 0, 1, 2, 0)
     (2, 2, 2, 2, 2)
     (3, 2, 2, 2, 2)
     (3, 2, 2, 3, 2)
     (3, 2, 2, 4, 2)
 The goal is to calculate the value of every counter after all operations.

 Write a function:

 public func solution(_ N : Int, _ A : inout [Int]) -> [Int]
 that, given an integer N and a non-empty array A consisting of M integers, returns a sequence of integers representing the values of the counters.

 Result array should be returned as an array of integers.

 For example, given:

     A[0] = 3
     A[1] = 4
     A[2] = 4
     A[3] = 6
     A[4] = 1
     A[5] = 4
     A[6] = 4
 the function should return [3, 2, 2, 4, 2], as explained above.

 Write an efficient algorithm for the following assumptions:

 N and M are integers within the range [1..100,000];
 each element of array A is an integer within the range [1..N + 1].
 
 */

/*
 # 문제 요약
 Int N과 Int배열 A가 주어지고,
 N은 반환해야할 배열(result)의 크기, A의 i번째 원소 a는 result[a-1]의 숫자를 +1시켜줄 것을 나타냅니다.
 N보다 큰 a가 나왔을 때는 result 전체가 지금까지 가장 컸던 MaxCount로 전부 채워주게 됩니다.
 
 # 풀이
 반복문을 최소화하여 풀어야하는 문제입니다.
 반복문(for) 안에서 반복문이 돌아가지 않게 해야합니다.
 
 */

public class MaxCounters {
    
    public class func solution(_ N : Int, _ A : [Int]) -> [Int] {
        
        var result = Array(repeating: 0, count: N)
        var maxValue = 0
        var maxCount = 0
        
        A.forEach {
            let index = $0-1
            if $0 <= N {
                if result[index] <= maxValue {
                    result[index] = maxValue
                }
                result[index] += 1
                
                if result[index] > maxCount {
                    maxCount = result[index]
                }
            }
            else {
                maxValue = maxCount
            }
        }
        
        // index가 N보다 클 때, 최대값을 저장놨다가, 마지막에 map으로 비교해서 넣어줍니다.
        return result.map { $0 < maxValue ? maxValue : $0 }
    }
}
