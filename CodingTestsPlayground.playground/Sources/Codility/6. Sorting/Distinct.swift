import Foundation

/*
 // (Sorting) Distinct
 // https://app.codility.com/programmers/lessons/6-sorting/distinct/
 
 Write a function

 public func solution(_ A : inout [Int]) -> Int
 that, given an array A consisting of N integers, returns the number of distinct values in array A.

 For example, given array A consisting of six elements such that:

  A[0] = 2    A[1] = 1    A[2] = 1
  A[3] = 2    A[4] = 3    A[5] = 1
 the function should return 3, because there are 3 distinct values appearing in array A, namely 1, 2 and 3.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..100,000];
 each element of array A is an integer within the range [−1,000,000..1,000,000].
 
 */

/*
 # 문제 요약
 배열 내에 고유값이 몇개가 있는지 세는 문제입니다.
 
 # 풀이
 Set의 특성을 이용하면 쉽게 풀수 있습니다.
 
 */

public class Distinct {
    
    public class func solution(_ A : [Int]) -> Int {
        
        return NSSet(array:A).count
    }
}
