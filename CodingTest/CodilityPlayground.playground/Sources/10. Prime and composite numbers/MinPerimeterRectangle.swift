import Foundation

/*
 // (Prime and composite numbers) MinPerimeterRectangle
 // https://app.codility.com/programmers/lessons/10-prime_and_composite_numbers/min_perimeter_rectangle/
 
 An integer N is given, representing the area of some rectangle.

 The area of a rectangle whose sides are of length A and B is A * B, and the perimeter is 2 * (A + B).

 The goal is to find the minimal perimeter of any rectangle whose area equals N. The sides of this rectangle should be only integers.

 For example, given integer N = 30, rectangles of area 30 are:

 (1, 30), with a perimeter of 62,
 (2, 15), with a perimeter of 34,
 (3, 10), with a perimeter of 26,
 (5, 6), with a perimeter of 22.
 Write a function:

 public func solution(_ N : Int) -> Int

 that, given an integer N, returns the minimal perimeter of any rectangle whose area is exactly equal to N.

 For example, given an integer N = 30, the function should return 22, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..1,000,000,000].
 
 */

/*
 # 문제 요약
 Int N이 주어지고, N(30)의 약수((1, 30), (2, 15)...)를 직사각형의 가로세로라고 했을 때,
 둘레의 최소값을 구하는 문제입니다.
 
 # 풀이
 약수들의 가운데일수록 최소값인 규칙을 이용하여 푸는 문제입니다.
 CountFactors문제에서 reverse()로 탐색하면 빠릅니다.
 
 */

public class MinPerimeterRectangle {
    
    public class func solution(_ N: Int) -> Int {
        if N == 1 {
            return 4
        }
        var perimeter = 0
        
        let sqrtN = Int(sqrt(Double(N)))
        
        for idx in (1...sqrtN).reversed() {
            if idx*idx == N {
                perimeter = (idx+idx)*2
                break
            }
            else if N%idx == 0 {
                perimeter = (idx+(N/idx))*2
                break
            }
        }

        return perimeter
    }
}
