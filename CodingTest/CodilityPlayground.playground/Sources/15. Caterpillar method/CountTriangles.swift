import Foundation

/*
 // (Caterpillar method) CountTriangles
 // https://app.codility.com/programmers/lessons/15-caterpillar_method/count_triangles/
 
 An array A consisting of N integers is given. A triplet (P, Q, R) is triangular if it is possible to build a triangle with sides of lengths A[P], A[Q] and A[R]. In other words, triplet (P, Q, R) is triangular if 0 ≤ P < Q < R < N and:

 A[P] + A[Q] > A[R],
 A[Q] + A[R] > A[P],
 A[R] + A[P] > A[Q].
 For example, consider array A such that:

   A[0] = 10    A[1] = 2    A[2] = 5
   A[3] = 1     A[4] = 8    A[5] = 12
 There are four triangular triplets that can be constructed from elements of this array, namely (0, 2, 4), (0, 2, 5), (0, 4, 5), and (2, 4, 5).

 Write a function:

 public func solution(_ A : inout [Int]) -> Int
 that, given an array A consisting of N integers, returns the number of triangular triplets in this array.

 For example, given array A such that:

   A[0] = 10    A[1] = 2    A[2] = 5
   A[3] = 1     A[4] = 8    A[5] = 12
 the function should return 4, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..1,000];
 each element of array A is an integer within the range [1..1,000,000,000].
 
 */

/*
 # 문제 요약
 N개의 정수로 된 배열 A가 주어집니다.
 길이가 A[P], A[Q], A[R]인 삼각형을 만들 수 있다면 triplet(P, Q, R)을 삼각형이라 합니다.
 0<=P<Q<R<N 일 때,
 A[P]+A[Q]>A[R] 이고
 A[Q]+A[R]>A[P] 이면서
 A[R]+A[P]>A[Q] 일 때 삼각형의 조건이 됩니다.
 
 예)
 A=[10, 2, 5, 1, 8, 12] 이면,
 (0, 2, 4), (0, 2, 5), (0, 4, 5), (2, 4, 5) 삼각형이 나옴 -> 4를 반환
 N: [0...10,000] 범위의 정수
 A의 원소는 [1...1,000,000,000] 범위 내 정수
 
 # 풀이
 원소의 수가 3개 미만일 때 예외처리를 해주어야 합니다.
 A를 정렬을 해서 찾으면, 삼각형 3가지 조건 중에서
 (p + r > q), (q + r > p)는 무조건 맞기 떄문에 (p + q > r) 인 경우만 찾으면 됩니다.
 for문은 p로 한번만 돌고, 그 안에서는 while로 q, r을 찾아가야 합니다.
 1) r까지 체크했는데 조건이 맞지 않으면 그 다음은 체크할 필요가 없습니다.
 2) r까지 (p + q > r)조건이 맞다면, q부터 r사이 모든 케이스가 맞습니다.
 3) 2)가 맞다면 q+1~r사이, q+2~r사이도 모두 맞습니다.
 
 */

public class CountTriangles {
    
    public class func solution(_ A: [Int]) -> Int {
        var countTri = 0
        
        if A.count < 3 {
            return countTri
        }
        
        let sortA = A.sorted(by: < )
        // 1, 2, 5, 8, 10 ,12
        // 정렬을 하고나면 p < q < r일 때,
        // (p + r > q), (q + r > p)는 무조건 맞기 떄문에 (p + q > r) 인 경우만 찾으면 됨
        
        for p in 0..<A.count-2 {
            var q = p+1
            var r = q+1
            
            while q < A.count-1 {
                if r<A.count && sortA[p]+sortA[q]>sortA[r] {
                    r += 1
                }
                else {
                    // 1) r까지 체크했는데 조건이 맞지 않으면 그 다음은 체크할 필요가 없음
                    // 2) r까지 (p + q > r)조건이 맞다면, q부터 r사이 모든 케이스가 맞음.
                    // 3) 2)가 맞다면 q+1~r사이, q+2~r사이도 모두 맞음
                    countTri += r-q-1
                    q += 1
                }
            }
        }
        
        return countTri
    }
}
