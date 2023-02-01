import Foundation

/*
 // (Prefix Sums) CountDiv
 // https://app.codility.com/programmers/lessons/5-prefix_sums/count_div/
 
 Write a function:

 public func solution(_ A : Int, _ B : Int, _ K : Int) -> Int
 that, given three integers A, B and K, returns the number of integers within the range [A..B] that are divisible by K, i.e.:

 { i : A ≤ i ≤ B, i mod K = 0 }
 For example, for A = 6, B = 11 and K = 2, your function should return 3, because there are three numbers divisible by 2 within the range [6..11], namely 6, 8 and 10.

 Write an efficient algorithm for the following assumptions:

 A and B are integers within the range [0..2,000,000,000];
 K is an integer within the range [1..2,000,000,000];
 A ≤ B.
 
 */

/*
 # 문제 요약
 Int A, B, K가 주어졌을 때, A~B 사이에서 K로 나뉠 수 있는 숫자의 갯수를 찾는 문제입니다.
 
 # 풀이
 반복문을 쓰기보다는 단순계산으로 찾는 것이 효율이 좋습니다.
 0~B 범위에서 찾은 값에서 0~A 범위에서 찾은 값을 빼고,
 A가 K로 나누어 떨어질 떄는 +1카운트 됩니다.
 
 */

public class CountDiv {
    
    public class func solution(_ A : Int, _ B: Int, _ K: Int) -> Int {
        let count = B/K - A/K

        return A % K == 0 ? count + 1 : count
    }
}
