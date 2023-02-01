import Foundation

/*
 // (Iterations) BinaryGap
 // https://app.codility.com/programmers/lessons/1-iterations/binary_gap/
 
 A binary gap within a positive integer N is any maximal sequence of consecutive zeros that is surrounded by ones at both ends in the binary representation of N.

 For example, number 9 has binary representation 1001 and contains a binary gap of length 2. The number 529 has binary representation 1000010001 and contains two binary gaps: one of length 4 and one of length 3. The number 20 has binary representation 10100 and contains one binary gap of length 1. The number 15 has binary representation 1111 and has no binary gaps. The number 32 has binary representation 100000 and has no binary gaps.

 Write a function:

 public func solution(_ N : Int) -> Int
 that, given a positive integer N, returns the length of its longest binary gap. The function should return 0 if N doesn't contain a binary gap.

 For example, given N = 1041 the function should return 5, because N has binary representation 10000010001 and so its longest binary gap is of length 5. Given N = 32 the function should return 0, because N has binary representation '100000' and thus no binary gaps.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..2,147,483,647].
 
 */

/*
 # 문제 요약
 바이너리로 바꿨을 때, 1과 1사이에 0이 가장 많이 있는 갯수를 구하는 문제입니다.
 
 # 풀이
 2진 바이너리로 바꿔주는 String(N, radix: 2)를 알면 쉽습니다.
 
 */

public class BinaryGap {
    
    public class func solution(_ N : Int) -> Int {
        let binary: String = String(N, radix: 2) // 2진수로 변환
        var rtn = 0
        var count = 0

        binary.forEach { bin in
            if bin == "1" {
                rtn = rtn < count ? count : rtn
                count = 0
            }
            else {
                count += 1
            }
        }

        return rtn
    }
}
