import Foundation

/*
 // (Arrays) OddOccurrencesInArray
 // https://app.codility.com/programmers/lessons/2-arrays/odd_occurrences_in_array/
 
 A non-empty array A consisting of N integers is given. The array contains an odd number of elements, and each element of the array can be paired with another element that has the same value, except for one element that is left unpaired.

 For example, in array A such that:

   A[0] = 9  A[1] = 3  A[2] = 9
   A[3] = 3  A[4] = 9  A[5] = 7
   A[6] = 9
 the elements at indexes 0 and 2 have value 9,
 the elements at indexes 1 and 3 have value 3,
 the elements at indexes 4 and 6 have value 9,
 the element at index 5 has value 7 and is unpaired.
 Write a function:

 public func solution(_ A : inout [Int]) -> Int
 that, given an array A consisting of N integers fulfilling the above conditions, returns the value of the unpaired element.

 For example, given array A such that:

   A[0] = 9  A[1] = 3  A[2] = 9
   A[3] = 3  A[4] = 9  A[5] = 7
   A[6] = 9
 the function should return 7, as explained in the example above.

 Write an efficient algorithm for the following assumptions:

 N is an odd integer within the range [1..1,000,000];
 each element of array A is an integer within the range [1..1,000,000,000];
 all but one of the values in A occur an even number of times.
 
 */

/*
 # 문제 요약
 Int Array A가 주어지고. 각 Int는 모두 짝수개가 있는데, 한 숫자만 1개가 있습니다. 그 1개를 찾아서 반환하는 문제입니다.
 
 # 풀이
 (1) XOR 연산자로 풀거나,
 (2) Set<Int>로 풀기
 
 */


public class OddOccurrencesInArray {
    
    // (1) XOR 연산자로 풀기
    public class func solution(_ A :[Int]) -> Int {
        var temp = 0
            
        for item in A {
            temp ^= item
        }
        
        return temp
    }
    
    // (1) XOR 연산자로 풀기2
    class func solution2(_ A :[Int]) -> Int {
        return A.reduce(0, ^)
    }
    
    // (2) XOR 연산자로 풀기
    class func solution3(_ A :[Int]) -> Int {
        var aSet = Set<Int>()
        
        A.forEach { a in
            if aSet.contains(a) { aSet.remove(a) }
            else { aSet.insert(a) }
        }
        
        return aSet.first ?? 0
    }
}
