import Foundation

/*
 // (Caterpillar method) CountDistinctSlices
 // https://app.codility.com/programmers/lessons/15-caterpillar_method/count_distinct_slices/
 
 An integer M and a non-empty array A consisting of N non-negative integers are given. All integers in array A are less than or equal to M.

 A pair of integers (P, Q), such that 0 ≤ P ≤ Q < N, is called a slice of array A. The slice consists of the elements A[P], A[P + 1], ..., A[Q]. A distinct slice is a slice consisting of only unique numbers. That is, no individual number occurs more than once in the slice.

 For example, consider integer M = 6 and array A such that:

     A[0] = 3
     A[1] = 4
     A[2] = 5
     A[3] = 5
     A[4] = 2
 There are exactly nine distinct slices: (0, 0), (0, 1), (0, 2), (1, 1), (1, 2), (2, 2), (3, 3), (3, 4) and (4, 4).

 The goal is to calculate the number of distinct slices.

 Write a function:

 public func solution(_ M : Int, _ A : inout [Int]) -> Int
 that, given an integer M and a non-empty array A consisting of N integers, returns the number of distinct slices.

 If the number of distinct slices is greater than 1,000,000,000, the function should return 1,000,000,000.

 For example, given integer M = 6 and array A such that:

     A[0] = 3
     A[1] = 4
     A[2] = 5
     A[3] = 5
     A[4] = 2
 the function should return 9, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..100,000];
 M is an integer within the range [0..100,000];
 each element of array A is an integer within the range [0..M].
 
 */

/*
 # 문제 요약
 정수 M과 양의정수로 이루어진 비어있지 않은 A배열이 주어집니다.
 A의 모든 정수는 M보다 작거나 같습니다.
 0<=P<=Q<N 인 정수쌍 (P, Q)는 A의 한 조각을 의미할 때,
 조각은 원소 A[P], A[P+1],...,A[Q]로 구성되며, 구별되는 조각은 고유한 숫자로만 구성됩니다.
 즉, 조각 내에서 중복된 숫자가 없다고 할 때 조각의 갯수를 반환하면 됩니다.
 예)
 M=6, A:[3, 4, 5, 5, 2] 일 떄,
 (0, 0), (0, 1), (0, 2), (1, 1), (1, 2), (2 ,2), (3, 3), (3, 4), (4, 4)
 -> 9개 조각이 있음
 조각이 1,000,000,000 이상일 때는 1,000,000,000을 반환합니다.
 
 N: [1...100,000] 범위의 정수
 M: [0...100,000] 범위의 정수
 A: [0...M] 범위의 정수 배열
 
 # 풀이
 *캐터필러 알고리즘을 사용하여 풀어야 하는 문제입니다.
 : 기본적으로는 선형 탐색이지만, 임의의 크기 영역을 두고 탐색하면서 영역의 앞과 뒤(Front, Back)을 기록하면서 나아가는 것이 특징입니다.
 
 (3)
 // 4추가
 (3), (3,4), (4) → +2
 // 5추가
 (3), (3,4), (4), (3,4,5), (4,5), (5) → +3
 
 // 3이 추가된다면?
 (3), (3,4), (4), (3,4,5), (4,5), (5), (4, 5, 3), (5,3), (3) → +3
 // (3이 아니라) 4가 추가됐다면?
 (3), (3,4), (4), (3,4,5), (4,5), (5), (5,4), (4) → +2
 // (3, 4가 아니라) 5가 추가됐다면?
 (3), (3,4), (4), (3,4,5), (4,5), (5), (5) → +1
 
 */

public class CountDistinctSlices {
    
    public class func solution(_ M: Int, _ A: [Int]) -> Int {
        var slices = 0
        var check: Set<Int> = Set()
        let N = A.count
        var front = 0
        
        for end in 0..<N {
            while front < N && !check.contains(A[front]) {
                slices += front-end+1
                check.update(with: A[front])
                front += 1
                
                if slices >= 1000000000 {
                    return 1000000000
                }
            }
            
            check.remove(A[end])    // 앞에서 체크한 것을 삭제
            if slices >= 1000000000 {
                return 1000000000
            }
        }
        
        return slices
    }
}
