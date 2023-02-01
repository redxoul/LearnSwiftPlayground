import Foundation

/*
 // (Prefix Sums) MinAvgTwoSlice
 // https://app.codility.com/programmers/lessons/5-prefix_sums/min_avg_two_slice/
 
 A non-empty array A consisting of N integers is given. A pair of integers (P, Q), such that 0 ≤ P < Q < N, is called a slice of array A (notice that the slice contains at least two elements). The average of a slice (P, Q) is the sum of A[P] + A[P + 1] + ... + A[Q] divided by the length of the slice. To be precise, the average equals (A[P] + A[P + 1] + ... + A[Q]) / (Q − P + 1).

 For example, array A such that:

     A[0] = 4
     A[1] = 2
     A[2] = 2
     A[3] = 5
     A[4] = 1
     A[5] = 5
     A[6] = 8
 contains the following example slices:

 slice (1, 2), whose average is (2 + 2) / 2 = 2;
 slice (3, 4), whose average is (5 + 1) / 2 = 3;
 slice (1, 4), whose average is (2 + 2 + 5 + 1) / 4 = 2.5.
 The goal is to find the starting position of a slice whose average is minimal.

 Write a function:

 public func solution(_ A : inout [Int]) -> Int
 that, given a non-empty array A consisting of N integers, returns the starting position of the slice with the minimal average. If there is more than one slice with a minimal average, you should return the smallest starting position of such a slice.

 For example, given array A such that:

     A[0] = 4
     A[1] = 2
     A[2] = 2
     A[3] = 5
     A[4] = 1
     A[5] = 5
     A[6] = 8
 the function should return 1, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [2..100,000];
 each element of array A is an integer within the range [−10,000..10,000].
 
 */

/*
 # 문제 요약
 Int배열 A가 주어졌을 때,
 A배열의 연속된 숫자로 된 부분집합(A[P], A[P+1],..., A[Q])을 'Slice'이라고 합니다.
 0<=P<Q<N, 조각은 최소 2개의 원소.
 평균이 가장 작은 조각의 시작 위치를 반환하는 문제입니다.
 
 # 풀이
 수학적 사고(?)가 조금 필요한 문제입니다.
 1. a≤b일 때, a와 b의 평균은 a이상이 된다.
 2. (a+b) ≤ (c+d)일 때, (a, b)와 (c, d)의 평균은 (a+b)이상이 된다.
    → 결국, 원소가 4개인 그룹(a, b, c, d)은 (a, b)와 (c, d)로 나눴을 때, 각각의 평균의 작은값 이상이 된다.
    → 2개인 그룹이 작은 값이 되므로 '4개의 그룹은 고려할 필요가 없어'집니다.
 3. 예외로 원소가 3개인 그룹에서 2개인 그룹과 1개인 그룹을 확인해야 하지만, 문제 조건에서 그룹 원소는 최소 2개 이상.
    → [원소가 2개, 3개인 그룹만 비교]합니다.
 
 */

public class MinAvgTwoSlice {
    
    public class func solution(_ A: [Int]) -> Int {
        var minAvg: Float = Float(A[0] + A[1]) / 2.0
        var minStart = 0
        
        for idx in 0..<A.count {
            // 3원소 체크
            if idx+2 < A.count {
                let threeAvg = Float(A[idx] + A[idx+1] + A[idx+2]) / 3.0
                
                if threeAvg < minAvg {
                    minAvg = threeAvg
                    minStart = idx
                }
            }
            
            // 2원소 체크
            if idx+1 < A.count {
                let twoAvg = Float(A[idx] + A[idx+1]) / 2.0
                
                if twoAvg < minAvg {
                    minAvg = twoAvg
                    minStart = idx
                }
            }
            
            // 맨 마지막까지는 돌지 않도록 체크
            if idx+1 == A.count {
                break
            }
        }
        
        return minStart
    }
}
