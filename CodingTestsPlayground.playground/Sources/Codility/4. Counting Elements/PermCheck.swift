import Foundation

/*
 // (Counting Elements) PermCheck
 // https://app.codility.com/programmers/lessons/4-counting_elements/perm_check/
 
 A non-empty array A consisting of N integers is given.

 A permutation is a sequence containing each element from 1 to N once, and only once.

 For example, array A such that:

     A[0] = 4
     A[1] = 1
     A[2] = 3
     A[3] = 2
 is a permutation, but array A such that:

     A[0] = 4
     A[1] = 1
     A[2] = 3
 is not a permutation, because value 2 is missing.

 The goal is to check whether array A is a permutation.

 Write a function:

 public func solution(_ A : inout [Int]) -> Int
 that, given an array A, returns 1 if array A is a permutation and 0 if it is not.

 For example, given array A such that:

     A[0] = 4
     A[1] = 1
     A[2] = 3
     A[3] = 2
 the function should return 1.

 Given array A such that:

     A[0] = 4
     A[1] = 1
     A[2] = 3
 the function should return 0.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..100,000];
 each element of array A is an integer within the range [1..1,000,000,000].
 
 */

/*
 # 문제 요약
 Int 배열 A가 주어졌을 때, [1, 2, 3, 4] 처럼 순열인지 체크하는 문제입니다.
 
 # 풀이
 예시같이 숫자가 빠진 케이스 외에도 같은 숫자가 여러번 들어간 배열일 수도 있습니다.
 Set으로 중복을 제거한 후 체크해야 합니다.
 */

public class PermCheck {
    
    public class func solution(_ A : [Int]) -> Int {
        let sortedA = Set(A).sorted(by: <)
        
        return A.count == sortedA.count && A.count == sortedA.last ? 1 : 0
    }
}
