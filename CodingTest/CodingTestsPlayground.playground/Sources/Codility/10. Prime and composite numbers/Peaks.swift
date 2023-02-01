import Foundation

/*
 // (Prime and composite numbers)  Peaks
 // https://app.codility.com/programmers/lessons/10-prime_and_composite_numbers/peaks/
 
 A non-empty array A consisting of N integers is given.

 A peak is an array element which is larger than its neighbors. More precisely, it is an index P such that 0 < P < N − 1,  A[P − 1] < A[P] and A[P] > A[P + 1].

 For example, the following array A:

     A[0] = 1
     A[1] = 2
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
 has exactly three peaks: 3, 5, 10.

 We want to divide this array into blocks containing the same number of elements. More precisely, we want to choose a number K that will yield the following blocks:

 A[0], A[1], ..., A[K − 1],
 A[K], A[K + 1], ..., A[2K − 1],
 ...
 A[N − K], A[N − K + 1], ..., A[N − 1].
 What's more, every block should contain at least one peak. Notice that extreme elements of the blocks (for example A[K − 1] or A[K]) can also be peaks, but only if they have both neighbors (including one in an adjacent blocks).

 The goal is to find the maximum number of blocks into which the array A can be divided.

 Array A can be divided into blocks as follows:

 one block (1, 2, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2). This block contains three peaks.
 two blocks (1, 2, 3, 4, 3, 4) and (1, 2, 3, 4, 6, 2). Every block has a peak.
 three blocks (1, 2, 3, 4), (3, 4, 1, 2), (3, 4, 6, 2). Every block has a peak. Notice in particular that the first block (1, 2, 3, 4) has a peak at A[3], because A[2] < A[3] > A[4], even though A[4] is in the adjacent block.
 However, array A cannot be divided into four blocks, (1, 2, 3), (4, 3, 4), (1, 2, 3) and (4, 6, 2), because the (1, 2, 3) blocks do not contain a peak. Notice in particular that the (4, 3, 4) block contains two peaks: A[3] and A[5].

 The maximum number of blocks that array A can be divided into is three.

 Write a function:

 public func solution(_ A : inout [Int]) -> Int

 that, given a non-empty array A consisting of N integers, returns the maximum number of blocks into which A can be divided.

 If A cannot be divided into some number of blocks, the function should return 0.

 For example, given:

     A[0] = 1
     A[1] = 2
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

 N is an integer within the range [1..100,000];
 each element of array A is an integer within the range [0..1,000,000,000].
 
 */

/*
 # 문제 요약
 p:peak 봉우리. A[p]는 양옆(p-1, p+1)의 높이보다 높은 지점을 의미합니다.
 A배열을 동일한 원소수를 갖는 블록으로 나눠야하고, 각 블록은 1개 이상의 peak을 가지고 있어야 합니다.
 이 때 최대 peak을 반환하고, 일부 블록으로 나누는게 안되면 0을 반환하는 문제입니다.
 
 # 풀이
 flags 문제와 앞부분은 동일한 문제입니다.
 peaks 총 갯수(peakCount)의 역순으로 탐색해야 합니다.
 배열의 총 갯수가 해당 peakCount로 나뉘어 떨어지는지를 우선 체크하고
 탐색중인 peaks총갯수(peakCount)와 peak이 포함된 블록갯수가 일치하면 리턴합니다.
 
 */

public class peaks {
    
    public class func solution(_ A: [Int]) -> Int {
        // p:peak 봉우리. A[p]는 양옆(p-1, p+1)의 높이보다 높은 지점
        // A배열을 동일한 원소수를 갖는 블록으로 나눠야하고, 각 블록은 1개 이상의 peak을 가지고 있어야 함.
        // 일부 블록으로 나누는게 안되면 0을 반환
        
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
            } // peak의 갯수가 구해짐
            
            // count가 0, 1이라면 바로 리턴
            if peaks.count < 2 {
                return peaks.count
            }
            
            for peakCount in (2...peaks.count).reversed() {
                // peak 총갯수에서 역순으로 탐색
                if A.count%peakCount == 0 {
                    // 1. 일단 배열 총 갯수가 해당 peakCount로 나누어 떨어져야 함
                    let block = A.count/peakCount   // 블록당 요소갯수
                    var blockCheck = 0   // peak이 포함된 블록의 갯수
                    for peak in peaks {
                        let start = blockCheck*block
                        let end = (blockCheck+1)*block
                        if peak >= start && peak < end {
                            blockCheck += 1
                        }
                    }
                    if blockCheck == peakCount {
                        return peakCount
                    }
                }
                
            }
            
            return 1
        }
    }
}
