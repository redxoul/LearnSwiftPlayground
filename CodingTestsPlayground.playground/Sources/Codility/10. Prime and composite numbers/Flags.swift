import Foundation

/*
 // (Prime and composite numbers)  Flags
 // https://app.codility.com/programmers/lessons/10-prime_and_composite_numbers/flags/
 
 A non-empty array A consisting of N integers is given.

 A peak is an array element which is larger than its neighbours. More precisely, it is an index P such that 0 < P < N − 1 and A[P − 1] < A[P] > A[P + 1].

 For example, the following array A:

     A[0] = 1
     A[1] = 5
     A[2] = 3
     A[3] = 4
     A[4] = 3
     A[5] = 4
     A[6] = 1
     A[7] = 2
     A[8] = 3
     A[9] = 4
     A[10] = 6
     A[11] = 2
 has exactly four peaks: elements 1, 3, 5 and 10.

 You are going on a trip to a range of mountains whose relative heights are represented by array A, as shown in a figure below. You have to choose how many flags you should take with you. The goal is to set the maximum number of flags on the peaks, according to certain rules.



 Flags can only be set on peaks. What's more, if you take K flags, then the distance between any two flags should be greater than or equal to K. The distance between indices P and Q is the absolute value |P − Q|.

 For example, given the mountain range represented by array A, above, with N = 12, if you take:

 two flags, you can set them on peaks 1 and 5;
 three flags, you can set them on peaks 1, 5 and 10;
 four flags, you can set only three flags, on peaks 1, 5 and 10.
 You can therefore set a maximum of three flags in this case.

 Write a function:

 public func solution(_ A : inout [Int]) -> Int

 that, given a non-empty array A of N integers, returns the maximum number of flags that can be set on the peaks of the array.

 For example, the following array A:

     A[0] = 1
     A[1] = 5
     A[2] = 3
     A[3] = 4
     A[4] = 3
     A[5] = 4
     A[6] = 1
     A[7] = 2
     A[8] = 3
     A[9] = 4
     A[10] = 6
     A[11] = 2
 the function should return 3, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..400,000];
 each element of array A is an integer within the range [0..1,000,000,000].
 
 */

/*
 # 문제 요약
 비어있지 않은 Int 배열 A가 주어지며, 산의 높이를 의미합니다.
 p:peak 봉우리. A[p]는 양옆(p-1, p+1)의 높이보다 높은 지점을 의미합니다.
 (0 <P< N-1 일 때, A[P-1]<A[P]>A[P+1])
 K개의 깃발을 가져갈 때, A[p]봉우리와 A[q]봉우리의 거리|q-p|가 K보다 같거나 커야 한다고 할 때,
 봉우리에 꽂을 Flag 갯수를 반환하는 문제입니다.
 
 # 풀이
 [ x:봉우리가 아닌 지점, p:봉우리 일 때 ]
 x p x (3 = 2 + 1 + (1-1)(1-1))
 x p x p x (5 = 2 + 2 + (2-1)(2-1))
 x p x x p x x p x (9 = 2 + 3 + (3-1)(3-1))
 x p x x x p x x x p x x x p x (15 = 2 + 4 + (4-1)(4-1))
 x p x x x x p x x x x p x x x x p x x x x p x (23 = 2 + 5 + (5-1)(5-1))
 ...
 
 [ peak이 n개일 때의 ‘최소 배열 크기' ]
 = 2 + n + (n-1)(n-1)
 = 2 + n + n제곱 - n - n + 1
 = 3 - n + n제곱
 = 3 + n(n-1)
 
 최소 배열 크기를 만족하는 peak갯수를 역순reversed()으로 찾아갑니다.
 현재 찾아낸 flags 갯수가 다음에 탐색할 peak수보다 크거나 같으면 탐색 중지시킵니다.
 
 */


//(아직 93% 답)
//(large_anti_slow 미통과. got 317 expected 316)

public class Flags {
    
    public class func solution(_ A: [Int]) -> Int {
        // p:peak 봉우리. A[p]는 양옆(p-1, p+1)의 높이보다 높은 지점
        // K개의 깃발을 가져갈 때, A[p]봉우리와 A[q]봉우리의 거리|q-p|가 K보다 같거나 커야 함
        if A.count < 3 {
            // count가 3개 미만이면 peak이 없음
            return 0
        }
        else {
            var peaks:[Int] = []    // peak의 인덱스를 먼저 구함
            for i in 1..<A.count-1 {
                if A[i-1] < A[i] && A[i] > A[i+1] {
                    peaks.append(i)
                }
            }
            
            // count가 0, 1이라면 바로 리턴
            if peaks.count < 2 {
                return peaks.count
            }
            
            var rtn = 0
            
            for peakCount in (1...peaks.count).reversed() {
                if (peaks[peaks.count-1]-peaks[0]+3) >=  (3+peakCount*(peakCount-1)) {
                    // 배열갯수가 해당peak갯수의 최소조건을 일치
                    // 최소조건이 맞았으니, 실제 peakCount만큼 flag들을 떨어뜨려놓을 수 있는지 체크
                    var flags = 1   // 1개는 기본
                    var beforeFlag = peaks[0]   // 0번째가 기본 flag
                    // 2번쨰부터 이전 flag와 거리가 peakCount만큼인지를 체크
                    for peakIdx in 1..<peaks.count {
                        if (peaks[peakIdx]-beforeFlag) >= peakCount {
                            flags += 1
                            beforeFlag = peaks[peakIdx]
                        }
                    }
                    
                    rtn = rtn<flags ? flags : rtn
                    if flags >= peakCount-1 {
                        return rtn
                    }
                }
            }
            
            return rtn
        }
    }
}
