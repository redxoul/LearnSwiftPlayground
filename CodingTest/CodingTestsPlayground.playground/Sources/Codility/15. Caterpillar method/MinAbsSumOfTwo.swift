import Foundation

/*
 // (Caterpillar method) MinAbsSumOfTwo
 // https://app.codility.com/programmers/lessons/15-caterpillar_method/min_abs_sum_of_two/
 
 Let A be a non-empty array consisting of N integers.

 The abs sum of two for a pair of indices (P, Q) is the absolute value |A[P] + A[Q]|, for 0 ≤ P ≤ Q < N.

 For example, the following array A:

   A[0] =  1
   A[1] =  4
   A[2] = -3
 has pairs of indices (0, 0), (0, 1), (0, 2), (1, 1), (1, 2), (2, 2).
 The abs sum of two for the pair (0, 0) is A[0] + A[0] = |1 + 1| = 2.
 The abs sum of two for the pair (0, 1) is A[0] + A[1] = |1 + 4| = 5.
 The abs sum of two for the pair (0, 2) is A[0] + A[2] = |1 + (−3)| = 2.
 The abs sum of two for the pair (1, 1) is A[1] + A[1] = |4 + 4| = 8.
 The abs sum of two for the pair (1, 2) is A[1] + A[2] = |4 + (−3)| = 1.
 The abs sum of two for the pair (2, 2) is A[2] + A[2] = |(−3) + (−3)| = 6.

 Write a function:

 public func solution(_ A : inout [Int]) -> Int
 that, given a non-empty array A consisting of N integers, returns the minimal abs sum of two for any pair of indices in this array.

 For example, given the following array A:

   A[0] =  1
   A[1] =  4
   A[2] = -3
 the function should return 1, as explained above.

 Given array A:

   A[0] = -8
   A[1] =  4
   A[2] =  5
   A[3] =-10
   A[4] =  3
 the function should return |(−8) + 5| = 3.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..100,000];
 each element of array A is an integer within the range [−1,000,000,000..1,000,000,000].

 
 */

/*
 # 문제 요약
 비어있지 않은 N개의 정수로 구성된 배열 A이 주어집니다.
 0<=P<=Q<N 일 때, 한 쌍의 (P, Q)의 absSum은 |A[P]+A[Q]| 입니다.
 
 예) A=[1, 4, -3]
 (0, 0): |1+1| = 2
 (0, 1): |1+4| = 5
 (0, 2): |1-3| = 2
 (1, 1): |4+4| = 8
 (1, 2): |4-3| = 1
 (2, 2): |-3-3| = 6
 -> 최소 absSum인 1을 반환
 
 N: [1...100,000] 범위의 정수
 A의 각 원소는 [-1,000,000,000...1,000,000,000] 범위의 정수
 
 # 풀이
 원소가 1개일 때 예외처리를 해주어야 합니다.
 A를 절대값 순으로 정렬하면 찾기 쉽습니다.
 정렬 후에는 같은 인덱스 숫자들은 첫 인덱스만 보면 됩니다.
 붙어 있는 인자들끼리의 absSum이 가장 작을 것입니다.
 
 */

public class MinAbsSumOfTwo {
    
    public class func solution(_ A: [Int]) -> Int {
            // 원소가 1개일 때 체크
        if A.count == 1 {
            return abs(A[0]+A[0])
        }
        
        // 절대값 순으로 정렬
        let sortA = A.sorted(by: { abs($0) < abs($1) })
        
        // 같은 인덱스 숫자들은 절대값으로 가장 작은 숫자의 합만 체크하면 됨
        var minAbsSum = abs(sortA[0]+sortA[0])
        
        // 정렬 후엔 붙어있는 인자들끼리의 absSum이 가장 작을 것
        for idx in 0..<sortA.count-1 {
            minAbsSum = min(minAbsSum, abs(sortA[idx]+sortA[idx+1]))
        }
        
        return minAbsSum
    }
}
