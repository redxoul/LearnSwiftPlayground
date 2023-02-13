import Foundation

/*
 // (Prefix Sums) PassingCars
 // https://app.codility.com/programmers/lessons/5-prefix_sums/passing_cars/
 
 A non-empty array A consisting of N integers is given. The consecutive elements of array A represent consecutive cars on a road.

 Array A contains only 0s and/or 1s:

 0 represents a car traveling east,
 1 represents a car traveling west.
 The goal is to count passing cars. We say that a pair of cars (P, Q), where 0 ≤ P < Q < N, is passing when P is traveling to the east and Q is traveling to the west.

 For example, consider array A such that:

   A[0] = 0
   A[1] = 1
   A[2] = 0
   A[3] = 1
   A[4] = 1
 We have five pairs of passing cars: (0, 1), (0, 3), (0, 4), (2, 3), (2, 4).

 Write a function:

 class Solution { public int solution(int[] A); }
 that, given a non-empty array A of N integers, returns the number of pairs of passing cars.

 The function should return −1 if the number of pairs of passing cars exceeds 1,000,000,000.

 For example, given:

   A[0] = 0
   A[1] = 1
   A[2] = 0
   A[3] = 1
   A[4] = 1
 the function should return 5, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..100,000];
 each element of array A is an integer that can have one of the following values: 0, 1.
 
 */

/*
 # 문제 요약
 Int배열 A가 주어지고 A의 요소 중 0은 동쪽(서->동)으로, 1은 서쪽(서<-동)으로 이동하는 차량을 의미합니다.
 이럴 때 0차량과 1차량이 마주치는 횟수를 반환하는 문제입니다.
 
 # 풀이
 배열 탐색을 인덱스0부터 하게 되면, 마주치는 카운팅은 1차량(서<-동)을 기준으로 카운팅해야 합니다.
 
 */

public class PassingCars {
    
    public class func solution(_ A : [Int]) -> Int {
        var eastCount = 0
        var sum = 0
        
        // 탐색을 앞에서부터, sum카운트는 1을 기준으로
        for value in A {
            if value == 0 {
                eastCount += 1
            }
            else {
                sum += eastCount
                if sum > 1000000000 {
                    return -1
                }
            }
        }
        
        return sum
    }
}
