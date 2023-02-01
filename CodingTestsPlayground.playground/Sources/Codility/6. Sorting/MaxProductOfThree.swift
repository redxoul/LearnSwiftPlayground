import Foundation

/*
 // (Sorting) MaxProductOfThree
 // https://app.codility.com/programmers/lessons/6-sorting/max_product_of_three/
 
 A non-empty array A consisting of N integers is given. The product of triplet (P, Q, R) equates to A[P] * A[Q] * A[R] (0 ≤ P < Q < R < N).

 For example, array A such that:

   A[0] = -3
   A[1] = 1
   A[2] = 2
   A[3] = -2
   A[4] = 5
   A[5] = 6
 contains the following example triplets:

 (0, 1, 2), product is −3 * 1 * 2 = −6
 (1, 2, 4), product is 1 * 2 * 5 = 10
 (2, 4, 5), product is 2 * 5 * 6 = 60
 Your goal is to find the maximal product of any triplet.

 Write a function:

 public func solution(_ A : inout [Int]) -> Int
 that, given a non-empty array A, returns the value of the maximal product of any triplet.

 For example, given array A such that:

   A[0] = -3
   A[1] = 1
   A[2] = 2
   A[3] = -2
   A[4] = 5
   A[5] = 6
 the function should return 60, as the product of triplet (2, 4, 5) is maximal.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [3..100,000];
 each element of array A is an integer within the range [−1,000..1,000].
 
 */

/*
 # 문제 요약
 Int배열 A가 주어졌을 때, 배열의 숫자 3개를 곱해서 가장 큰 숫자를 반환하는 문제입니다.
 
 # 풀이
 0. 큰 배열에서 timeout이 나지 않으려면 아래와 같은 규칙을 찾아서 풀어야 합니다.
 1. 배열을 (<)로 sorting합니다.
 2. 4가지 케이스를 고려합니다.
    - 모두 음수일 경우(-6, -5, -4, -3, -2, -1)
        → A[N-1] * A[N-2] * A[N-3]
    - 모두 양수일 경우(1, 2, 3, 4, 5, 6)
        → A[N-1] * A[N-2] * A[N-3]
    - 음, 양수 혼합일 경우(-5, -4, -3, -2, -1, 6)
        → A[N-1] * A[0] * A[1]
    - 음, 양수 혼합일 경우(-5, 1, 2, 3, 4, 6)
        → A[N-1] * A[N-2] * A[N-3]
 
 : A[N-1]은 항상 곱해집니다.
 : A[N-1]이 음수일 땐, 모두 음수기 때문에 A[N-2]*A[N-3]을 곱하고
 : A[N-1]이 양수일 땐, A[N-2]*A[N-3]과, A[0]*A[1] 중에 큰수를 곱하면 됩니다.
 
 */

public class MaxProductOfThree {
    
    public class func solution(_ A : [Int]) -> Int
    {
        let sortedA = A.sorted(by: <)
        let n = sortedA.count
        
        let product1 = sortedA[0] * sortedA[1]
        let product2 = sortedA[n-3] * sortedA[n-2]
        let lastProduct = sortedA[n-1]
        
        if lastProduct < 0 {
            return product2 * lastProduct
        }
        else {
            return max(product1, product2) * lastProduct
        }
    }
}

