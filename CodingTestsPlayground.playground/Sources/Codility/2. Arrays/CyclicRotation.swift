import Foundation

/*
 // (Arrays) CyclicRotation
 // https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/
 
 An array A consisting of N integers is given. Rotation of the array means that each element is shifted right by one index, and the last element of the array is moved to the first place. For example, the rotation of array A = [3, 8, 9, 7, 6] is [6, 3, 8, 9, 7] (elements are shifted right by one index and 6 is moved to the first place).

 The goal is to rotate array A K times; that is, each element of A will be shifted to the right K times.

 Write a function:

 public func solution(_ A : inout [Int], _ K : Int) -> [Int]
 that, given an array A consisting of N integers and an integer K, returns the array A rotated K times.

 For example, given

     A = [3, 8, 9, 7, 6]
     K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:

     [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
     [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
     [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]
 For another example, given

     A = [0, 0, 0]
     K = 1
 the function should return [0, 0, 0]

 Given

     A = [1, 2, 3, 4]
     K = 4
 the function should return [1, 2, 3, 4]

 Assume that:

 N and K are integers within the range [0..100];
 each element of array A is an integer within the range [−1,000..1,000].
 In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.
 
 */

/*
 # 문제 요약
 Int K와 Int배열 A가 주어집니다.
 K 횟수만큼 A의 마지막 요소를 0번째 index로 넣기를 반복했을 때의 배열을 반환하면 됩니다.
 
 # 풀이
 K가 A.count보다 클 때 반복문을 줄여주면 됩니다.
 
 */

public class CyclicRotation {
    
    public class func solution(_ A : [Int], _ K : Int) -> [Int] {
        if A.count == 0 {
            return A
        }
        
        let newK = A.count<K ? K%A.count : K
        
        var result = Array(A)

        for _ in 0..<newK {
            result.insert(result.popLast()!, at:0)
        }

        return result
    }
}
