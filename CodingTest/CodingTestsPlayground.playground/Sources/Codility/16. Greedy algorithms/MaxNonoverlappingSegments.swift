import Foundation

/*
 // (Greedy algorithms) MaxNonoverlappingSegments
 // https://app.codility.com/programmers/lessons/16-greedy_algorithms/max_nonoverlapping_segments/
 
 Located on a line are N segments, numbered from 0 to N − 1, whose positions are given in arrays A and B. For each I (0 ≤ I < N) the position of segment I is from A[I] to B[I] (inclusive). The segments are sorted by their ends, which means that B[K] ≤ B[K + 1] for K such that 0 ≤ K < N − 1.

 Two segments I and J, such that I ≠ J, are overlapping if they share at least one common point. In other words, A[I] ≤ A[J] ≤ B[I] or A[J] ≤ A[I] ≤ B[J].

 We say that the set of segments is non-overlapping if it contains no two overlapping segments. The goal is to find the size of a non-overlapping set containing the maximal number of segments.

 For example, consider arrays A, B such that:

     A[0] = 1    B[0] = 5
     A[1] = 3    B[1] = 6
     A[2] = 7    B[2] = 8
     A[3] = 9    B[3] = 9
     A[4] = 9    B[4] = 10
 The segments are shown in the figure below.



 The size of a non-overlapping set containing a maximal number of segments is 3. For example, possible sets are {0, 2, 3}, {0, 2, 4}, {1, 2, 3} or {1, 2, 4}. There is no non-overlapping set with four segments.

 Write a function:

 public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int
 that, given two arrays A and B consisting of N integers, returns the size of a non-overlapping set containing a maximal number of segments.

 For example, given arrays A, B shown above, the function should return 3, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..30,000];
 each element of arrays A and B is an integer within the range [0..1,000,000,000];
 A[I] ≤ B[I], for each I (0 ≤ I < N);
 B[K] ≤ B[K + 1], for each K (0 ≤ K < N − 1).
 
 */

/*
 # 문제 요약
 선위에 존재하는 0~N-1까지 번호가 매겨진 N개의 세그먼트가 있고, 위치는 A, B배열로 주어집니다.
 각 i(0<=i<N)의 위치는 A[i]~B[i]의 위치입니다.
 세그먼트는 끝부분을 기준으로 정렬되는데, 이는 0<=k<N-1일 때, B[k]<=B[k+1]
 
 I≠J인 두 세그먼트 I, J는 공통점을 하나 이상공유할 때 'Overlapping(중첩)'이라고 합니다.
 A[I] ≤ A[J] ≤ B[I] or A[J] ≤ A[I] ≤ B[J] 인 경우 Overlapping.
 세그먼트 집합에 두개의 겹치는 세그먼트가 없다면 Overlapping되지 않는다고 합니다.
 목표는 최대 세그먼트 수를 포함하는 Overlapping되지 않는 세트의 크기를 찾는 것 입니다.
 예)A=[1, 3, 7, 9, 9], B=[5, 6, 8, 9, 10]
 {0, 2, 3}, {0, 2, 4}, {1, 2, 3}, {1, 2, 4} 세트가 있을 때,
 -> 3 반환
 N: [0...30,000] 범위의 정수
 A, B 각 요소는 [0...1,000,000,000] 범위의 정수
 A[i]<=B[i], 0<=i<N
 B[k]<=B[k+1], 0<=k<N=1
 
 
 # 풀이
 '탐욕 알고리즘(Greedy algorithm)'을 써서 찾는 문제이기 때문에
 A[0]부터 선형 탐색을 하면서 그 때 그때의 최선의 선택(마지막 찾은 끝지점(lastEnd)이 현재의 시작점(start)과 겹치는지)를 판단해서 카운트해주면 됩니다.
 
 */

public class MaxNonoverlappingSegments {
    public class func solution(_ A: [Int], _ B: [Int]) -> Int {
        if A.count < 2 {
            return A.count
        }
        
        let line = Array(zip(A, B))

        var count = 0
        var lastEnd = -1
        for (start, end) in line {
            if start > lastEnd {
                count += 1
                lastEnd = end
            }
        }
        
        return count
    }
}
