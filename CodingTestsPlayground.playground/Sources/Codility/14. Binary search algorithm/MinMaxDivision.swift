import Foundation

/*
 // (Binary search algorithm) MinMaxDivision
 // https://app.codility.com/programmers/lessons/14-binary_search_algorithm/min_max_division/
 
 You are given integers K, M and a non-empty array A consisting of N integers. Every element of the array is not greater than M.

 You should divide this array into K blocks of consecutive elements. The size of the block is any integer between 0 and N. Every element of the array should belong to some block.

 The sum of the block from X to Y equals A[X] + A[X + 1] + ... + A[Y]. The sum of empty block equals 0.

 The large sum is the maximal sum of any block.

 For example, you are given integers K = 3, M = 5 and array A such that:

   A[0] = 2
   A[1] = 1
   A[2] = 5
   A[3] = 1
   A[4] = 2
   A[5] = 2
   A[6] = 2
 The array can be divided, for example, into the following blocks:

 [2, 1, 5, 1, 2, 2, 2], [], [] with a large sum of 15;
 [2], [1, 5, 1, 2], [2, 2] with a large sum of 9;
 [2, 1, 5], [], [1, 2, 2, 2] with a large sum of 8;
 [2, 1], [5, 1], [2, 2, 2] with a large sum of 6.
 The goal is to minimize the large sum. In the above example, 6 is the minimal large sum.

 Write a function:

 public func solution(_ K : Int, _ M : Int, _ A : inout [Int]) -> Int
 that, given integers K, M and a non-empty array A consisting of N integers, returns the minimal large sum.

 For example, given K = 3, M = 5 and array A such that:

   A[0] = 2
   A[1] = 1
   A[2] = 5
   A[3] = 1
   A[4] = 2
   A[5] = 2
   A[6] = 2
 the function should return 6, as explained above.

 Write an efficient algorithm for the following assumptions:

 N and K are integers within the range [1..100,000];
 M is an integer within the range [0..10,000];
 each element of array A is an integer within the range [0..M].
 
 */

/*
 # 문제 요약
 
 정수 K, M과 비어있지 않은 N개의 정수배열 A가 주어지고, A의 모든 요소는 M보다 크지 않습니다.
 A배열을 연속된 요소의 K개 블록으로 나누는데, 블록 요소는 0~N사이 정수이며 배열의 모든 요소는 어떤 블록에 속해야 합니다.
 X에서 Y까지 블럭의 합은 A[X]+A[X+1]+...+A[Y]. 빈 블럭의 합은 0 입니다..
 ’large Sum’은 모든 블럭의 최대합입니다.
 
 예시) K=3, M=5, A=[2, 1, 5, 1, 2, 2, 2]
 위 블록은 다음과 같이 나뉠 수 있습니다.
 [2, 1, 5, 1, 2, 2, 2], [], [] -> largeSum = 15
 [2], [1, 5, 1, 2], [2, 2] -> largeSum = 9
 [2, 1, 5], [], [1, 2, 2, 2] -> largeSum = 8
 [2, 1], [5, 1], [2, 2, 2] -> largeSum = 6
 largeSum을 최소화하는 것이 목표입니다.
 위 예제의 최소 largeSum은 6.
 
 - N, K는 [1...100,000] 범위의 정수
 - M은 [0...10,000] 범위의 정수
 - A배열 각 요소는 [0...M] 범위의 정수
 
 
 # 풀이
 
 (1) 블럭수(K)가 1이면 largeSum은 A의 전체합(sum).
 (2) 블럭수(K)가 A.count 이상이면 largeSum은 A요소 중 최대값(max).
 (3) 위 케이스가 아니라면 largeSum은 (1)전체합과 (2)최대값 중간 어딘가에 있을 것 입니다.
 → 이진 탐색으로 (1)과 (2)의 중간값mid=(sum+max)/2 에서부터 내려가거나 올라가면서 찾으면 됩니다.
 → mid값일 때, K개 블럭으로 나뉘어지는지를 먼저 체크한 후
 → 나뉘어지면 sum=mid-1, 나뉘어지지 않으면 max=mid+1 을 하면서 largeSum을 찾습니다.
 
 */

public class MinMaxDivision {
    
    public class func solution(_ K: Int, _ M: Int, _ A: [Int]) -> Int {
        // K개 만큼 블럭이 나눠지는지를 확인
        func isDivisable(_ maxBlockSize: Int) -> Bool {
            var blockSum = 0
            var blockCount = 0
            
            for a in A {
                if blockSum + a > maxBlockSize {
                    // 블럭의 최대값을 넘어가면 블럭을 나눔
                    blockSum = a
                    blockCount += 1
                }
                else {
                    // 블럭 내 원소값들을 sum
                    blockSum += a
                }
                
                if blockCount >= K {
                    return false
                }
            }
            
            return true
        }
        
        // 배열 최대값, 합계
        var max = A.max()! // A는 빈값이 오지 않기 때문에 포스언래핑
        var sum = A.reduce(0, +)
        
        if K == 1 { // (1) 블럭수가 1이면 largeSum은 A의 sum
            return sum
        }
        if K >= A.count {   // (2) 블럭수가 A.count 이상이면 largeSum은 A의 max
            return max
        }
        
        //(3) 위 케이스가 아니라면 largeSum은 (1)전체합과 (2)최대값 중간 어딘가에 있을 것.
        // → 이진 탐색으로 (1)과 (2)의 중간값mid=(sum+max)/2 에서부터 내려가거나 올라가면서 찾으면 됨
        // → mid값일 때, K개 블럭으로 나뉘어지는지를 먼저 체크한 후
        // → 나뉘어지면 sum=mid-1, 나뉘어지지 않으면 max=mid+1 을 하면서 largeSum을 찾음.
        while max <= sum {
            let mid = (max+sum)/2
            
            if isDivisable(mid) {
                sum = mid-1
            }
            else {
                max = mid+1
            }
        }
        
        return max
    }
}
