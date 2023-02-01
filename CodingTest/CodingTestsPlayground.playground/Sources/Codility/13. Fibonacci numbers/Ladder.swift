import Foundation

/*
 // (Fibonacci numbers) Ladder
 // https://app.codility.com/programmers/lessons/13-fibonacci_numbers/ladder/
 
 You have to climb up a ladder. The ladder has exactly N rungs, numbered from 1 to N. With each step, you can ascend by one or two rungs. More precisely:

 with your first step you can stand on rung 1 or 2,
 if you are on rung K, you can move to rungs K + 1 or K + 2,
 finally you have to stand on rung N.
 Your task is to count the number of different ways of climbing to the top of the ladder.

 For example, given N = 4, you have five different ways of climbing, ascending by:

 1, 1, 1 and 1 rung,
 1, 1 and 2 rungs,
 1, 2 and 1 rung,
 2, 1 and 1 rungs, and
 2 and 2 rungs.
 Given N = 5, you have eight different ways of climbing, ascending by:

 1, 1, 1, 1 and 1 rung,
 1, 1, 1 and 2 rungs,
 1, 1, 2 and 1 rung,
 1, 2, 1 and 1 rung,
 1, 2 and 2 rungs,
 2, 1, 1 and 1 rungs,
 2, 1 and 2 rungs, and
 2, 2 and 1 rung.
 The number of different ways can be very large, so it is sufficient to return the result modulo 2P, for a given integer P.

 Write a function:

 public func solution(_ A : inout [Int], _ B : inout [Int]) -> [Int]
 that, given two non-empty arrays A and B of L integers, returns an array consisting of L integers specifying the consecutive answers; position I should contain the number of different ways of climbing the ladder with A[I] rungs modulo 2B[I].

 For example, given L = 5 and:

     A[0] = 4   B[0] = 3
     A[1] = 4   B[1] = 2
     A[2] = 5   B[2] = 4
     A[3] = 5   B[3] = 3
     A[4] = 1   B[4] = 1
 the function should return the sequence [5, 1, 8, 0, 1], as explained above.

 Write an efficient algorithm for the following assumptions:

 L is an integer within the range [1..50,000];
 each element of array A is an integer within the range [1..L];
 each element of array B is an integer within the range [1..30].
 
 */

/*
 # 문제 요약
 
 사다리를 올라야 합니다.
 사다리는 N개의 rung(가로대, 발판)이 있고 1~N까지 숫자가 메겨져있습니다.
 한 걸음으로 1 또는 2단계 위 rung에 설 수 있습니다.
 만약 내가 K번째에 rung 있다면, K+1나 K+2로 이동할 수 있습니다.
 마지막에 N번(꼭대기)의 rung에 서야합니다.
 사다리에 오르는 다양한 방법의 수를 세야 합니다.
 예를 들어 N=4가 주어지면 방법은 [1, 1, 1, 1], [1, 1, 2], [1, 2, 1], [2, 1, 1], [2, 2]
 이렇게 5가지 방법이 있습니다.
 다른 방법의 수는 매우 클 수 있으므로, 주어진 정수 P에 대해 결과를 2^B[i]로 나눈 나머지(modulo, %)로 값을 구함
 비어있지 않은 배열 A, B에 L정수들이 들어있고, 연속적인 answer를 지정하는 L정수로 구성된 배열을 반환합니다.
 위치 i에는 A[i] rung갯수 modulo 2^B[i]로 사다리를 오르는 방법이 포함되어야 합니다.
 L: 1...50,000
 A: [1...L]     // A: 사다리의 갯수
 B: [1...30]    // B: 너무 값이 커질 수 있으니 이를 방지해주기 위한 값
 
 # 풀이
 
 N = 1 [1] → 1
 N = 2 [1, 1], [2] → 2
 N = 3 [1, 1, 1], [1, 2], [2, 1] → 3
 N = 4 [1, 1, 1, 1], [1, 1, 2], [1, 2, 1], [2, 1, 1], [2, 2] → 5
 N = 5 [1, 1, 1, 1, 1], [1, 1, 1, 2], [1, 1, 2, 1], [1, 2, 1, 1], [2, 1, 1, 1], [1, 2, 2], [2, 1, 2], [2, 2, 1] → 8
 -> 경우의 수가 피보나치 수열을 따릅니다
 
 1) 피보나치 수열(Fibonacci numbers) 로 A의 최대값만큼 구해줍니다.
 피보나치 수를 구한 값에 (2^B최대값)만큼 %연산을 해주어야 100% 나옵니다(안해주면 37%)
 2) 구한 피보나치 수열을 2^B[i]로 %연산을 해줍니다.
 
 * 2제곱을 해줄 때 pow함수가 Codility사이트에선 컴파일이 안 됩니다.
 → 비트시프트연산자 로 (1<<제곱할수) 해주어야 제곱 처리가능합니다.
 
 */

public class Ladder {
    
    public class func solution(_ A: [Int], _ B: [Int]) -> [Int] {
        var rtn:[Int] = []

        // 1) 피보나치 수열(Fibonacci numbers) 로 A의 최대값만큼 구해줍니다.
        var fibArr = [0, 1, 2]
        
        if A.count > 2 {
            let powMaxB = (1 << B.max()!)    // 시프트연산자로 B의 최대값만큼 2제곱
            for idx in 3...A.max()! {
                fibArr.append((fibArr[idx-2]+fibArr[idx-1])%powMaxB)
            }
        }

        // 2) 구한 피보나치 수열을 2^B[i]로 %연산을 해줍니다.
        for idx in 0..<A.count {
            let powB = (1 << B[idx]) // 시프트연산자로 B[i]값 만큼 2제곱
            rtn.append(fibArr[A[idx]]%powB)
        }

        return rtn
    }
}
