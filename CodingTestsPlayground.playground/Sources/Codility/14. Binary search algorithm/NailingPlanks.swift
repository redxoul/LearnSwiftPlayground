import Foundation

/*
 // (Binary search algorithm) NailingPlanks
 // https://app.codility.com/programmers/lessons/14-binary_search_algorithm/nailing_planks/
 
 You are given two non-empty arrays A and B consisting of N integers. These arrays represent N planks. More precisely, A[K] is the start and B[K] the end of the K−th plank.

 Next, you are given a non-empty array C consisting of M integers. This array represents M nails. More precisely, C[I] is the position where you can hammer in the I−th nail.

 We say that a plank (A[K], B[K]) is nailed if there exists a nail C[I] such that A[K] ≤ C[I] ≤ B[K].

 The goal is to find the minimum number of nails that must be used until all the planks are nailed. In other words, you should find a value J such that all planks will be nailed after using only the first J nails. More precisely, for every plank (A[K], B[K]) such that 0 ≤ K < N, there should exist a nail C[I] such that I < J and A[K] ≤ C[I] ≤ B[K].

 For example, given arrays A, B such that:

     A[0] = 1    B[0] = 4
     A[1] = 4    B[1] = 5
     A[2] = 5    B[2] = 9
     A[3] = 8    B[3] = 10
 four planks are represented: [1, 4], [4, 5], [5, 9] and [8, 10].

 Given array C such that:

     C[0] = 4
     C[1] = 6
     C[2] = 7
     C[3] = 10
     C[4] = 2
 if we use the following nails:

 0, then planks [1, 4] and [4, 5] will both be nailed.
 0, 1, then planks [1, 4], [4, 5] and [5, 9] will be nailed.
 0, 1, 2, then planks [1, 4], [4, 5] and [5, 9] will be nailed.
 0, 1, 2, 3, then all the planks will be nailed.
 Thus, four is the minimum number of nails that, used sequentially, allow all the planks to be nailed.

 Write a function:

 public func solution(_ A : inout [Int], _ B : inout [Int], _ C : inout [Int]) -> Int
 that, given two non-empty arrays A and B consisting of N integers and a non-empty array C consisting of M integers, returns the minimum number of nails that, used sequentially, allow all the planks to be nailed.

 If it is not possible to nail all the planks, the function should return −1.

 For example, given arrays A, B, C such that:

     A[0] = 1    B[0] = 4
     A[1] = 4    B[1] = 5
     A[2] = 5    B[2] = 9
     A[3] = 8    B[3] = 10

     C[0] = 4
     C[1] = 6
     C[2] = 7
     C[3] = 10
     C[4] = 2
 the function should return 4, as explained above.

 Write an efficient algorithm for the following assumptions:

 N and M are integers within the range [1..30,000];
 each element of arrays A, B and C is an integer within the range [1..2*M];
 A[K] ≤ B[K].
 
 */

/*
 # 문제 요약
 Nailing Planks (널빤지 못질)
 두개의 비어있지 않은 배열 A, B가 주어집니다. 이 배열들은 N개의 널빤지들을 나타냅니다.
 K번째 널빤지의 시작은 A[K], 끝은 B[K] 입니다.
 M개의 정수로 이루어진 비어있지 않은 배열 C. 이 배열은 M개의 못들을 나타냅니다. C[I]는 I번째 못을 박을 수 있는 위치입니다.
 A[K] <= C[I] <= B[K] 와 같이 C[I]가 존재하면 '(A[K], B[K])널빤지는 못자리 C[I]가 박혀있다'고 말합니다.
 모든 널빤지가 못이 박힐 때까지 사용해야 하는 최소한의 못을 찾는 것이 목표입니다.
 즉, 첫번째 J개의 못 만을 사용한 후에 모든 널빤지가 못이 박힐 수 있는 값 J를 찾아야 합니다.
 더 정확히는, 0<=K<N과 같이 모든 널빤지(A[K], B[K])에 대해
 I<J 이면서 A[K]<=C[I]<=B[K]를 나타내는 못 C[I]가 존재해야 합니다.
 
 예시) A=[1, 4, 5, 8], B=[4, 5, 9, 10], C=[4, 6, 7, 10, 2]
 4개의 널빤지가 표시 [1, 4], [4, 5], [5, 9], [8, 10]
 C[I]못질을 시작하면
 C[0]=4 -> [1, 4], [4, 5] 못을 박음
 C[0]=4, C[1]=6 -> [1, 4], [4, 5]. [5, 9] 못을 박음
 C[0]=4, C[1]=6, C[2]=7 -> [1, 4], [4, 5]. [5, 9] 못을 박음
 C[0]=4, C[1]=6, C[2]=7, C[3]=10 -> [1, 4], [4, 5]. [5, 9], [8, 10] 모든 널빤지에 못을 박음
 -> 4를 반환
 모든 널빤지에 못질을 할 수 없을 경우엔 -1을 반환합니다.
 N, M은 [1...30,000] 범위 내 정수
 배열 A, B, C 각 요소들은 [1...2*M]범위 내 정수
 A[K]<=B[K]
 
 # 풀이
 못은 기계처럼 계속 일정한 위치에만 박는 상황이고, 널빤지들의 위치들만 달라진다고 생각하면 됩니다.
 C(못 위치)를 enumerate해서 offset으로 본래 인덱스를 기억하고, 못 위치(element)순으로 정렬해서,
 각 널빤지를 순서대로 돌면서
 널빤지 별로 이진탐색으로 못이 박히는지 여부를 체크 & 못이 박히는 최소의 C의 인덱스(minIdx)를 찾아갑니다.
 각 널빤지의 minIdx 중 가장 큰 인덱스(maxIdx)를 최종적으로 찾아내서 maxIdx+1을 반환하면 됩니다.
 하나라도 못이 박히지 않는 널빤지가 있다면 -1 반환합니다.
 
 
 */

public class NailingPlanks {
    
    public class func solution(_ A: [Int], _ B: [Int], _ C: [Int]) -> Int {
        
        // C를 enumerate해서 offset으로 본래 인덱스를 기억하고, 못 위치(element)순으로 정렬
        let sortC = C.enumerated().sorted(by: { $0.element < $1.element } )
        var maxIdx = 0  // 모든 못이 박힌 C의 인덱스(offset)
        
        // idx번째 널빤지에서 못질이 가능한지 체크
        func hammeringNail(_ idx: Int) -> Bool {
            let startPlank = A[idx]
            let endPlank = B[idx]
            
            var ok = false
            var minIdx = Int.max
            var okIdx = sortC.count-1
            var left = 0
            var right = sortC.count-1
            
            // 이진탐색으로 sortC를 돌며 못질 가능 여부를 찾아감
            while left <= right {
                let mid: Int = (left+right)/2
                let nail = sortC[mid]
                
                if startPlank > nail.element {
                    left = mid+1
                }
                else if endPlank < nail.element {
                    right = mid-1
                }
                else {
                    // startPlank<못<endPlank 임을 찾음
                    right = mid-1
                    okIdx = mid
                    ok  = true
                }
            }
            
            // 못질이 가능하면 해당 인덱스okIdx부터 sortC를 돌며 minIdx(최소한의 못 위치)를 찾음
            if ok {
                for i in okIdx..<sortC.count {
                    let nail = sortC[i]
                    if nail.element > endPlank {
                        break
                    }
                    if nail.offset < minIdx {
                        minIdx = nail.offset
                    }
                    if minIdx <= maxIdx {
                        break
                    }
                }
                
                if minIdx > maxIdx {
                    maxIdx = minIdx
                }
            }
            
            return ok
        }
        
        // 널빤지들을 탐색
        for i in 0..<A.count {
            if !hammeringNail(i) {
                // 못 질이 하나도 안되는 널빤지가 존재하면 더 탐색할 필요가 없음
                return -1
            }
        }
        
        // maxIdx에서 못이 모두 박혔기 때문에 (maxIdx+1)번째를 반환
        return maxIdx+1
    }
}
