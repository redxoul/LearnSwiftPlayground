import Foundation

/*
 // (Leader) EquiLeader
 // https://app.codility.com/programmers/lessons/8-leader/equi_leader/
 
 A non-empty array A consisting of N integers is given.

 The leader of this array is the value that occurs in more than half of the elements of A.

 An equi leader is an index S such that 0 ≤ S < N − 1 and two sequences A[0], A[1], ..., A[S] and A[S + 1], A[S + 2], ..., A[N − 1] have leaders of the same value.

 For example, given array A such that:

     A[0] = 4
     A[1] = 3
     A[2] = 4
     A[3] = 4
     A[4] = 4
     A[5] = 2
 we can find two equi leaders:

 0, because sequences: (4) and (3, 4, 4, 4, 2) have the same leader, whose value is 4.
 2, because sequences: (4, 3, 4) and (4, 4, 2) have the same leader, whose value is 4.
 The goal is to count the number of equi leaders.

 Write a function:

 public func solution(_ A : inout [Int]) -> Int

 that, given a non-empty array A consisting of N integers, returns the number of equi leaders.

 For example, given:

     A[0] = 4
     A[1] = 3
     A[2] = 4
     A[3] = 4
     A[4] = 4
     A[5] = 2
 the function should return 2, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..100,000];
 each element of array A is an integer within the range [−1,000,000,000..1,000,000,000].
 
 */

/*
 # 문제 요약
 A[0], A[1],...A[S], A[S+1], A[S+2],...,A[N-1] 인 배열이 주어집니다,
 이 배열을 A[0]~A[S]인 시퀸스와 A[S+1]~A[N-1]인 시퀸스로 나눴을 때, 두 시퀸스의 과반수를 차지하고 있는 Leader인데 동일한 숫자인 것을 equi leader라고 합니다.
 이 equi leader를 찾는 문제입니다.
 
 # 풀이
 전체적인 Leader와 그 갯수를 찾고, 다시 탐색을 하면서 앞뒤 시퀸스들의 리더갯수를 카운팅 해가면서 찾아야 합니다.
 [2, 1]같은 경우 첫 인덱스를 반환해야 합니다.
 
 */

public class EquiLeader {
    
    public class func solution(_ A: [Int]) -> Int {
        var equLeader = 0
        
        let standard = A.count/2
        var dicA: [Int:Int] = [:]    // [A요소:카운트]
        var leader = A.first!
        
        for value in A {
            if let count = dicA[value] {
                dicA[value] = count+1
            }
            else {
                dicA[value] = 1
            }
            
            if dicA[value]! > standard {
                leader = value  // value가 leader로 판명
            }
        }
        
        var leftLeaderCount = 0
        var rightLeaderCount = dicA[leader]!
        
        for idx in 0..<A.count {
            if A[idx] == leader {
                leftLeaderCount += 1
                rightLeaderCount -= 1
            }
            if leftLeaderCount > (idx+1)/2
                && rightLeaderCount > (A.count - idx - 1)/2
            {
                equLeader += 1
            }
        }
        
        return equLeader
    }
}
