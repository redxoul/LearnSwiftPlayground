import Foundation

/*
 // (Greedy algorithms) TieRopes
 // https://app.codility.com/programmers/lessons/16-greedy_algorithms/tie_ropes/
 
 There are N ropes numbered from 0 to N − 1, whose lengths are given in an array A, lying on the floor in a line. For each I (0 ≤ I < N), the length of rope I on the line is A[I].

 We say that two ropes I and I + 1 are adjacent. Two adjacent ropes can be tied together with a knot, and the length of the tied rope is the sum of lengths of both ropes. The resulting new rope can then be tied again.

 For a given integer K, the goal is to tie the ropes in such a way that the number of ropes whose length is greater than or equal to K is maximal.

 For example, consider K = 4 and array A such that:

     A[0] = 1
     A[1] = 2
     A[2] = 3
     A[3] = 4
     A[4] = 1
     A[5] = 1
     A[6] = 3
 The ropes are shown in the figure below.



 We can tie:

 rope 1 with rope 2 to produce a rope of length A[1] + A[2] = 5;
 rope 4 with rope 5 with rope 6 to produce a rope of length A[4] + A[5] + A[6] = 5.
 After that, there will be three ropes whose lengths are greater than or equal to K = 4. It is not possible to produce four such ropes.

 Write a function:

 public func solution(_ K : Int, _ A : inout [Int]) -> Int
 that, given an integer K and a non-empty array A of N integers, returns the maximum number of ropes of length greater than or equal to K that can be created.

 For example, given K = 4 and array A such that:

     A[0] = 1
     A[1] = 2
     A[2] = 3
     A[3] = 4
     A[4] = 1
     A[5] = 1
     A[6] = 3
 the function should return 3, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..100,000];
 K is an integer within the range [1..1,000,000,000];
 each element of array A is an integer within the range [1..1,000,000,000].
 
 */

/*
 # 문제 요약
 0~N-1까지 번호가 매겨진 N개의 로프가 있으며, 길이는 배열A에 일직선으로 바닥에 놓여있습니다.
 각 0<=i<N에 대해 로프 i의 길이는 A[i]
 두 개의 로프 i와 i+1은 '인접해있다'고 합니다.
 두 개의 인접한 로프는 매듭으로 묶을 수 있으며, 묶인 로프의 길이는 두 길이의 합.
 그 묶은 로프는 다시 묶을 수 있습니다.
 정수 K가 주어지고, 길이가 K보다 크거나 같은 로프의 수가 최대가 되도록 묶는게 목표입니다.
 
 예)K=4, A=[1, 2, 3, 4, 1, 1, 3]
 A[1] + A[2] = 5 를 묶기 위해 1, 2 로프를 묶음
 A[3] = 4
 A[4] + A[5] + A[6] = 5 를 묶기 위해 4, 5, 6 로프를 묶음
 이렇게 4보다 크거나 같은 로프를 3개를 묶을 수 있음 -> 3 반환.
 
 N: [1..100,000] 범위의 정수
 K: [1...1,000,000,000] 범위의 정수
 A배열 각 요소는 [1...1,000,000,000] 범위의 정수
 
 # 풀이
 '탐욕 알고리즘(Greedy algorithm)'으로 A를 차례대로 순회하면서, K와 비교하며 카운트하면 됩니다.
 
 */

public class TieRopes {
    
    public class func solution(_ K: Int, _ A: [Int]) -> Int {
        var count = 0
        var adjacentRope = 0
        
        for a in A {
            adjacentRope += a
            if adjacentRope >= K {
                count += 1
                adjacentRope = 0
            }
        }
        
        return count
    }
}
