import Foundation

/*
 // (Sorting) Triangle
 // https://app.codility.com/programmers/lessons/6-sorting/triangle/
 
 An array A consisting of N integers is given. A triplet (P, Q, R) is triangular if 0 ≤ P < Q < R < N and:

 A[P] + A[Q] > A[R],
 A[Q] + A[R] > A[P],
 A[R] + A[P] > A[Q].
 For example, consider array A such that:

   A[0] = 10    A[1] = 2    A[2] = 5
   A[3] = 1     A[4] = 8    A[5] = 20
 Triplet (0, 2, 4) is triangular.

 Write a function:

 public func solution(_ A : inout [Int]) -> Int

 that, given an array A consisting of N integers, returns 1 if there exists a triangular triplet for this array and returns 0 otherwise.

 For example, given array A such that:

   A[0] = 10    A[1] = 2    A[2] = 5
   A[3] = 1     A[4] = 8    A[5] = 20
 the function should return 1, as explained above. Given array A such that:

   A[0] = 10    A[1] = 50    A[2] = 5
   A[3] = 1
 the function should return 0.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..100,000];
 each element of array A is an integer within the range [−2,147,483,648..2,147,483,647].
 
 */

/*
 # 문제 요약
 0<=P<Q<R<N 인 조건일 때 (P, Q, R)은 삼각형의 각 면을 표현합니다. 아래 조건일 때 삼각형이 됩니다.
 A[P]+A[Q] > A[R]
 A[Q]+A[R] > A[P]
 A[R]+A[P] > A[Q]
 삼각형 조건이 되면 1, 안되면 0을 반환하는 문제입니다.
 
 # 풀이
 내림차순으로 sorting하고 찾으면 쉽습니다.
 sorting을 한 후 가장 큰 수가 니머지 두 수의 합보다 작은지만 체크하면 됩니다.
 
 */

public class Triangle {
    
    public class func solution(_ A : [Int]) -> Int {
        
        let sortedA = A.sorted(by: >)
        let n = sortedA.count
        
        for idx in 0..<n {
            if idx+2 < n {
                if sortedA[idx] < sortedA[idx+1]+sortedA[idx+2] {
                    return 1
                }
            }
        }
        
        return 0
    }
    
}
