import Foundation

/*
 // (Maximum slice problem) MaxProfit
 // https://app.codility.com/programmers/lessons/9-maximum_slice_problem/max_profit/
 
 An array A consisting of N integers is given. It contains daily prices of a stock share for a period of N consecutive days. If a single share was bought on day P and sold on day Q, where 0 ≤ P ≤ Q < N, then the profit of such transaction is equal to A[Q] − A[P], provided that A[Q] ≥ A[P]. Otherwise, the transaction brings loss of A[P] − A[Q].

 For example, consider the following array A consisting of six elements such that:

   A[0] = 23171
   A[1] = 21011
   A[2] = 21123
   A[3] = 21366
   A[4] = 21013
   A[5] = 21367
 If a share was bought on day 0 and sold on day 2, a loss of 2048 would occur because A[2] − A[0] = 21123 − 23171 = −2048. If a share was bought on day 4 and sold on day 5, a profit of 354 would occur because A[5] − A[4] = 21367 − 21013 = 354. Maximum possible profit was 356. It would occur if a share was bought on day 1 and sold on day 5.

 Write a function,

 public func solution(_ A : inout [Int]) -> Int

 that, given an array A consisting of N integers containing daily prices of a stock share for a period of N consecutive days, returns the maximum possible profit from one transaction during this period. The function should return 0 if it was impossible to gain any profit.

 For example, given array A consisting of six elements such that:

   A[0] = 23171
   A[1] = 21011
   A[2] = 21123
   A[3] = 21366
   A[4] = 21013
   A[5] = 21367
 the function should return 356, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..400,000];
 each element of array A is an integer within the range [0..200,000].

 
 */

/*
 # 문제 요약
 주식의 값이 시간 흐름대로 들어있는 배열 A가 주어집니다.,
 한번 사고, 한번 팔았을 때, 최대 수익이 나는 금액을 반환하는 문제입니다.
 
 # 풀이
 최대 이익은 최소값일 때 사고, 이후 최소값과 차이가 많이 나는 케이스를 찾으면 해결할 수 있습니다.
 '다이나믹 프로그래밍'을 이용해서 for문을 한번만 도는 것이 중요합니다.
 
 */

public class MaxProfit {
    
    public class func solution(_ A: [Int]) -> Int {
        var maxProfit = 0
        var cheapest = A.first ?? 0
        
        for current in A {
            cheapest = min(cheapest, current)
            maxProfit = max(maxProfit, current-cheapest)
        }

        return maxProfit
    }
}
