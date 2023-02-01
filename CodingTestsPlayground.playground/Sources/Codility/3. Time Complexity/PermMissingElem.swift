import Foundation

/*

 // (Time Complexity) PermMissingElem
 //  https://app.codility.com/programmers/lessons/3-time_complexity/perm_missing_elem/
 
 An array A consisting of N different integers is given. The array contains integers in the range [1..(N + 1)], which means that exactly one element is missing.

 Your goal is to find that missing element.

 Write a function:

 public func solution(_ A : inout [Int]) -> Int
 that, given an array A, returns the value of the missing element.

 For example, given array A such that:

   A[0] = 2
   A[1] = 3
   A[2] = 1
   A[3] = 5
 
 the function should return 4, as it is the missing element.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..100,000];
 the elements of A are all distinct;
 each element of array A is an integer within the range [1..(N + 1)].
 
 */

/*
 # 문제 요약
 정수 N개를 갖는 배열 A가 주어졌을 때, A는 원소로 1에서 N+1사이의 정수를 갖는데, 딱 하나의 정수가 빠져있게 됩니다. 이 빠진 원소를 찾는 문제.
 
 # 풀이
 배열을 탐색해서 찾는 문제가 아닙니다.
 찾아야하는 값이 빠지지 않은 숫자들은 1~N+1로 숫자가 정해져있기 때문에 N이 주어졌을 때 총합(totalSum)도 정해져 있습니다.
 totalSum과 실제A의 총합(sum)의 차이를 구하면 되는 문제입니다.
 */

public class PermMissingElem {
    
    public class func solution(_ A : [Int]) -> Int {
        let sumA = A.reduce(0, +)
            
        let N = A.count
        let totalSum = (N + 1) * (N + 2) / 2 // 찾는 값이 빠지지 않았을 때의 기대되는 총합
            
        return totalSum - sumA
    }
}
