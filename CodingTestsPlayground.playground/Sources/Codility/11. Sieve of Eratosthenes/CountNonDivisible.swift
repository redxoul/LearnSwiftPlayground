import Foundation

/*
 // (Sieve of Eratosthenes) CountNonDivisible
 // https://app.codility.com/programmers/lessons/11-sieve_of_eratosthenes/count_non_divisible/
 
 You are given an array A consisting of N integers.

 For each number A[i] such that 0 ≤ i < N, we want to count the number of elements of the array that are not the divisors of A[i]. We say that these elements are non-divisors.

 For example, consider integer N = 5 and array A such that:

     A[0] = 3
     A[1] = 1
     A[2] = 2
     A[3] = 3
     A[4] = 6
 For the following elements:

 A[0] = 3, the non-divisors are: 2, 6,
 A[1] = 1, the non-divisors are: 3, 2, 3, 6,
 A[2] = 2, the non-divisors are: 3, 3, 6,
 A[3] = 3, the non-divisors are: 2, 6,
 A[4] = 6, there aren't any non-divisors.
 Write a function:

 public func solution(_ A : inout [Int]) -> [Int]

 that, given an array A consisting of N integers, returns a sequence of integers representing the amount of non-divisors.

 Result array should be returned as an array of integers.

 For example, given:

     A[0] = 3
     A[1] = 1
     A[2] = 2
     A[3] = 3
     A[4] = 6
 the function should return [2, 4, 3, 2, 0], as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..50,000];
 each element of array A is an integer within the range [1..2 * N].
 
 */

/*
 # 문제 요약
 n : 1~50000이고 A[n]: 1~n*2 일 때,
 A배열의 각 원소를 돌면서, 그 원소의 ‘약수가 아닌 원소의 갯수(CountNonDivisible)’의 배열을 반환하는 문제입니다.
 
 # 풀이
 원소의 갯수 범위(n)와, A[n]의 범위(1~n*2)를 정해두었다는 걸 이용해야 하는 문제입니다.
 같은 원소가 나올 수 있기 때문에 해당 계산값도 저장해주었다가 사용하면 시간을 줄일 수 있습니다.
 약수 구하는 로직은 이전 문제 CountFactors를 참고하면 됩니다.
 
 */

public class CountNonDivisible {
    
    public class func solution(_ A: [Int]) -> [Int] {
        // n : 1~50000
        // A[n]: 1~n*2
        
        // A[n]의 원소 갯수를 담을 배열
        var element = Array(repeating: 0, count: (A.count*2 + 1))   // A[n]의 범위(1~n*2)만큼 만들어 줌
        // A[n]의 갯수를 저장. 동일 원소가 나왔음을 판단하고 바로 쓰기 위함
        var saved = Array(repeating: -1, count: (A.count*2 + 1))    // A[n]의 범위(1~n*2)만큼 만들어 줌

        for a in A {
            element[a] += 1
            print(a, element)
        }
        
        var result = Array(repeating: 0, count: A.count)
        
        for (idx, value) in A.enumerated() {
            if saved[value] != -1 { // saved에 저장이 되어 있다면 다시 약수를 찾을 필요가 없음
                result[idx] = saved[value]
            }
            else {
                var count = 0
                // 약수를 구하기 시작
                let sqrtValue = Int(sqrt(Double(value)))
                for idx2 in 1...sqrtValue {
                    if idx2*idx2 == value {
                        count += element[idx2]
                    }
                    else if value%idx2 == 0 {
                        count += element[idx2]
                        count += element[value/idx2]
                    }
                }
                result[idx] = A.count-count    // A의 count에서 약수갯수를 뺀 나머지를 저장
                saved[value] = result[idx]     // 저장한 값을 saved에도 저장
            }
        }
        
        return result
    }
}
