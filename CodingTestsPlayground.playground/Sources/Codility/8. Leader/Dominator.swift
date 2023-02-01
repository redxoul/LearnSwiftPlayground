import Foundation

/*
 // (Leader) Dominator
 // https://app.codility.com/programmers/lessons/8-leader/dominator/
 
 An array A consisting of N integers is given. The dominator of array A is the value that occurs in more than half of the elements of A.

 For example, consider array A such that

  A[0] = 3    A[1] = 4    A[2] =  3
  A[3] = 2    A[4] = 3    A[5] = -1
  A[6] = 3    A[7] = 3
 The dominator of A is 3 because it occurs in 5 out of 8 elements of A (namely in those with indices 0, 2, 4, 6 and 7) and 5 is more than a half of 8.

 Write a function

 public func solution(_ A : inout [Int]) -> Int

 that, given an array A consisting of N integers, returns index of any element of array A in which the dominator of A occurs. The function should return −1 if array A does not have a dominator.

 For example, given array A such that

  A[0] = 3    A[1] = 4    A[2] =  3
  A[3] = 2    A[4] = 3    A[5] = -1
  A[6] = 3    A[7] = 3
 the function may return 0, 2, 4, 6 or 7, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..100,000];
 each element of array A is an integer within the range [−2,147,483,648..2,147,483,647].
 
 */

/*
 # 문제 요약
 Dominator(과반수 이상을 차지하고 있는 숫자)의 인덱스를 찾는 문제입니다.
 여러 인덱스 중에 아무거나 하나를 반환하면 됩니다.
 없다면 -1을 반환합니다.
 
 # 풀이
 Dictionary로 카운팅해가며 풀면 효율적으로 풀 수 있습니다.
 (같은 로직이어도 CountedSet으로 풀면 속도가 안 나옵니다)
 
 */

public class Dominator {
    
    public class func solution(_ A : [Int]) -> Int {

        if A.count == 0 {
            return -1
        }
        
        let standard = A.count/2
        var dicA:[Int:Int] = [:]
        
        for (idx, value) in A.enumerated() {
            if dicA[value] != nil {
                dicA[value]! += 1
            }
            else {
                dicA[value] = 1
            }
            
            if dicA[value]! > standard {
                return idx
            }
        }
        
        return -1
    }
}
