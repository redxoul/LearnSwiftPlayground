import Foundation

/*
 // (Maximum slice problem) MaxSliceSum
 // https://app.codility.com/programmers/lessons/9-maximum_slice_problem/max_slice_sum/
 
 A non-empty array A consisting of N integers is given. A pair of integers (P, Q), such that 0 ≤ P ≤ Q < N, is called a slice of array A. The sum of a slice (P, Q) is the total of A[P] + A[P+1] + ... + A[Q].

 Write a function:

 object Solution { def solution(a: Array[Int]): Int }

 that, given an array A consisting of N integers, returns the maximum sum of any slice of A.

 For example, given array A such that:

 A[0] = 3  A[1] = 2  A[2] = -6
 A[3] = 4  A[4] = 0
 the function should return 5 because:

 (3, 4) is a slice of A that has sum 4,
 (2, 2) is a slice of A that has sum −6,
 (0, 1) is a slice of A that has sum 5,
 no other slice of A has sum greater than (0, 1).
 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..1,000,000];
 each element of array A is an integer within the range [−1,000,000..1,000,000];
 the result will be an integer within the range [−2,147,483,648..2,147,483,647].

 */

/*
 # 문제 요약
 Int 배열 A가 주어지고,
 A를 (P, Q)인덱스로 잘랐을 때의 최대합(=최대부분합)을 구하는 문제입니다.
 
 # 풀이
 MaxProfit과 유사한 문제입니다.
 '카데인 알고리즘'을 이용해서 풀어야합니다.
 
 */

public class MaxSliceSum {
    
    public class func solution(_ A: [Int]) -> Int {
        var currentSum = 0
        var maxSum = Int.min
        
        for value in A {
            currentSum = max(currentSum+value, value)
            maxSum = max(currentSum, maxSum)
        }

        return maxSum
    }
}
