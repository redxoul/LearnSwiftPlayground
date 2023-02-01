import Foundation

/*
 // (Counting Elements) MissingInteger
 // https://app.codility.com/programmers/lessons/4-counting_elements/missing_integer/
 
 This is a demo task.

 Write a function:

 public func solution(_ A : inout [Int]) -> Int
 that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.

 For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

 Given A = [1, 2, 3], the function should return 4.

 Given A = [−1, −3], the function should return 1.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..100,000];
 each element of array A is an integer within the range [−1,000,000..1,000,000].
 
 */

/*
 # 문제 요약
 양의 정수 배열 A가 주어졌을 때, 포함되지 않은 최소의 숫자를 찾는 문제입니다.
 
 # 풀이
 A.count가 0일 때, 1일 때 체크해주고,
 그 외에는 Set을 이용해서 풀면 쉽게 풀어집니다.
 
 */

public class MissingInteger {
    
    public class func solution(_ A : [Int]) -> Int {
        if A.count == 0 {
            return 1
        }
        else if A.count == 1 {
            return A.first == 1 ? 2 : 1
        }
        else {
            let sortedSetA = Set(A).sorted(by: <)
            var smallestValue = 1
            for value in sortedSetA {
                if value > 0 {
                    if smallestValue == value {
                        smallestValue += 1
                    }
                    else {
                        break
                    }
                }
            }
            
            return smallestValue
        }
    }
}
