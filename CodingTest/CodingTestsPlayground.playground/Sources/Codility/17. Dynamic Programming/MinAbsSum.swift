import Foundation

/*
 // (Dynamic Programming) MinAbsSum
 // https://app.codility.com/programmers/lessons/17-dynamic_programming/min_abs_sum/
 
 For a given array A of N integers and a sequence S of N integers from the set {−1, 1}, we define val(A, S) as follows:

 val(A, S) = |sum{ A[i]*S[i] for i = 0..N−1 }|
 (Assume that the sum of zero elements equals zero.)

 For a given array A, we are looking for such a sequence S that minimizes val(A,S).

 Write a function:

 public func solution(_ A : inout [Int]) -> Int
 that, given an array A of N integers, computes the minimum value of val(A,S) from all possible values of val(A,S) for all possible sequences S of N integers from the set {−1, 1}.

 For example, given array:

   A[0] =  1
   A[1] =  5
   A[2] =  2
   A[3] = -2
 your function should return 0, since for S = [−1, 1, −1, 1], val(A, S) = 0, which is the minimum possible value.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..20,000];
 each element of array A is an integer within the range [−100..100].
 
 */

/*
 # 문제 요약
 N개의 정수로 된 배열 A이 주어졌을 때, set{-1, 1}로부터 N개의 정수 시퀸스S에 대해서 val(A, S)를 아래와 같이 정의합니다.
 val(A, S) = |sum{A[i]S[i] for i=0..N-1}|
 (S 원소의 합은 0이라고 가정합니다)
 
 주어진 배열 A에 대해, val(A, S)을 최소화하는 시퀀스S를 찾고자 합니다.
 즉, N개의 정수 배열 A가 주어졌을 때, set{-1, 1}에서 N개의 정수의 가능한 모든 시퀸스S에 대해 가능한 모든 val(A, S)값들의 최소값을 계산해서 반환합니다.
 예) A=[1, 5, 2, -2] 일 때,
 S = [-1, 1, -1, 1]
 11 + 51 + 21 + -2+1 = -1+5-2-2 = 0
 -> val(A, S)=0
 -> 0을 반환
      
 N: [0...20,000] 범위의 정수
 A 각 요소는 [-100...100] 범위의 정수
 
 # 풀이
 다이나믹 프로그래밍(DP, 동적 계획법) 문제입니다.
 -> 각 값들에 1이나 -1을 곱한 수들의 합의 절대값이 0에 가까워야 한다.
 A= [a, b, c, d, e] 로 가정했을 때
 최종적으로 구하려는 값이 (a+b+c)-(d+e) 라면, (a, b, c)를 먼저 구하든, (d, e)를 먼저 구하든 차가 동일하기 때문에 total/2인 것까지만 찾아도 됩니다.
 
 */

public class MinAbsSum {
    
    public class func solution(_ A: [Int]) -> Int {
        let N = A.count
        
        if N == 0 {
            return 0
        }
        if N == 1 {
            return abs(A[0])
        }
        if N == 2 {
            return abs(A[0]-A[1])
        }
        
        let absA = A.map({abs($0)}) // A를 모두 절대값으로 변환
        let total = absA.reduce(0, +)   // 총합
        let max = absA.max()!   // 최대값
        var count = Array(repeating: 0, count: max+1)   // 각 요소 갯수를 카운트
        for i in 0..<N {
            count[absA[i]] = count[absA[i]] + 1
        }

        // save[j]: 합j를 만들수 없으면 -1, j를 만들수 있으면 0을 저장
        // 최악의 경우엔 total만큼 커질 수 있기 때문에 인덱스를 total까지 만듦
            // but, 최종적으로 구하려는 값이 (a+b+c)-(d+e) 라면,
        // (a, b, c)를 먼저 구하든, (d, e)를 먼저 구하든 차가 동일하기 때문에 total/2인 것까지만 찾아도 됨
        var save = Array(repeating: -1, count: total/2+1)
        save[0] = 0

        // absA를 카운트한 count를 돌면서 a원소가 있으면 체크
        for a in 0..<max+1 {
            if count[a] > 0 {
                for j in 0..<total/2+1 {
                    if save[j] >= 0 {
                        // save[j]의 기존값이 0이상이면
                        // 합j를 만드는데 a가 필요하지 않으므로(?) count[a]를 넣어줌
                        save[j] = count[a]
                    }
                    else if j >= a && save[j-a] > 0 {
                        // 그렇지 않으면 합 j를 먼저 구해야 함(?),
                        save[j] = save[j-a] - 1
                    }
                }
            }
        }
        
        var rtn = total
        for i in 1..<total/2+1 {
            if save[i] >= 0 {
                rtn = min(rtn, total-2*i)
            }
        }
        
        return rtn
    }
}
