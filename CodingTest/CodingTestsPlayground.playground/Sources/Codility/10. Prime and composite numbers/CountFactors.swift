import Foundation

/*
 // (Prime and composite numbers) CountFactors
 // https://app.codility.com/programmers/lessons/10-prime_and_composite_numbers/count_factors/
 
 A positive integer D is a factor of a positive integer N if there exists an integer M such that N = D * M.

 For example, 6 is a factor of 24, because M = 4 satisfies the above condition (24 = 6 * 4).

 Write a function:

 public func solution(_ N : Int) -> Int

 that, given a positive integer N, returns the number of its factors.

 For example, given N = 24, the function should return 8, because 24 has 8 factors, namely 1, 2, 3, 4, 6, 8, 12, 24. There are no other factors of 24.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..2,147,483,647].
 
 */

/*
 # 문제 요약
 N의 약수의 갯수를 반환하는 문제입니다.
 
 # 풀이
 약수는 항상 루트N을 기준으로 대칭으로 존재(x2)합니다.
 약수(10)의 제곱이 N(100)일 때는 홀수개(+1)입니다.
 
 */

public class CountFactors {
    
    public class func solution(_ N: Int) -> Int {
        if N == 1 {
            return 1
        }
        var countFactors = 0
        
        let sqrtN = Int(sqrt(Double(N)))
        
        for idx in 1...sqrtN {
            if idx*idx == N {
                countFactors += 1
            }
            else if N%idx == 0 {
                countFactors += 2
            }
        }

        return countFactors
    }
}
