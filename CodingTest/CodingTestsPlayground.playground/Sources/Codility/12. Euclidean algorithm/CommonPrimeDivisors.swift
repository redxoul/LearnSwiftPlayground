import Foundation

/*
 // (Euclidean algorithm) CommonPrimeDivisors
 // https://app.codility.com/programmers/lessons/12-euclidean_algorithm/common_prime_divisors/
 
 A prime is a positive integer X that has exactly two distinct divisors: 1 and X. The first few prime integers are 2, 3, 5, 7, 11 and 13.

 A prime D is called a prime divisor of a positive integer P if there exists a positive integer K such that D * K = P. For example, 2 and 5 are prime divisors of 20.

 You are given two positive integers N and M. The goal is to check whether the sets of prime divisors of integers N and M are exactly the same.

 For example, given:

 N = 15 and M = 75, the prime divisors are the same: {3, 5};
 N = 10 and M = 30, the prime divisors aren't the same: {2, 5} is not equal to {2, 3, 5};
 N = 9 and M = 5, the prime divisors aren't the same: {3} is not equal to {5}.
 Write a function:

 public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int
 that, given two non-empty arrays A and B of Z integers, returns the number of positions K for which the prime divisors of A[K] and B[K] are exactly the same.

 For example, given:

     A[0] = 15   B[0] = 75
     A[1] = 10   B[1] = 30
     A[2] = 3    B[2] = 5
 the function should return 1, because only one pair (15, 75) has the same set of prime divisors.

 Write an efficient algorithm for the following assumptions:

 Z is an integer within the range [1..6,000];
 each element of arrays A and B is an integer within the range [1..2,147,483,647].

 */

/*
 # 문제 요약
 소수 X는 '1, X'를 약수만 가지고 있는 양의 정수입니다.
 소수 D는 D*K=P와 같이 양의 정수 K가 존재할 경우, 양의 정수 P의 prime divisor(소수인 약수)라고 합니다.
 예를 들어, 2와 5는 20의 prime divisor.
 두개의 양의 정수 N, M이 주어지고, 정수 N과 M의 prime divisor 집합이 정확히 같은지 여부를 확인합니다.
 예를 들어
 N=15, M=75 의 prime divisor는 [3, 5]로 같고
 N=10, M=30 의 prime divisor는 각각 [2, 5], [2, 3, 5]로 다르고
 N=3, M=5 의 prime divisor는 각각 [3], [5]로 다릅니다.
 한쌍만 같으므로 1을 반환합니다.
 비어있지 않은 배열 A, B가 Z개(1~6000)의 정수로 주어지고
 A, B 배열 내 값은 1~2,147,483,647 (Int32) 입니다.
 
 # 풀이
 유클리드 호재법으로 최대공약수(GCD)를 구하는 방법과 몇가지 수학지식이 필요한 문제입니다.
 GCD(x, y)가 1이라면 x, y는 '서로소'인 관계입니다. 서로소라면 공유하는 소수가 없다는 뜻입니다.
 x가 GCD로 나뉘어지면, x/GCD를 하여 중복된 소수를 제외시키고 x가 1이 됐을 때 x와 GCD가 공유하는 소수로 존재한다는 뜻입니다.
 
 */

class CommonPrimeDivisors {
    
    // 반복문으로 풀이
    public class func solution(_ A: [Int], _ B: [Int]) -> Int {
        
        // 최대공약수를 구함
        func GCD(_ a: Int, _ b: Int) -> Int {
            if b == 0 {
                return a
            }
            return GCD(b, a%b)
        }
        
        var rtn = 0
        let count = A.count
        
        for i in 0..<count {
            var a = A[i]
            var b = B[i]
            
            let gcd = GCD(a, b) // 최대공약수를 구해줌

            var gcdA = 0
            var gcdB = 0
            
            // 각 수(a, b)와 최대공약수와의 최대공약수를 구해주고
            // 각 수를 최대공약수로 나눈 값을 다시 최대공약수를 구하는 과정을 반복
            // 각 수와 최대공약수의 최대공약수가 1이 되었을 때 a, b값이 1이 아니라면 그 수가 공통되지 않은 인수
            while(gcdA != 1) {
                gcdA = GCD(a, gcd)
                a = a/gcdA
            }
            
            while(gcdB != 1) {
                gcdB = GCD(b, gcd)
                b = b/gcdB
            }
            
            if a==1 && b==1 {
                rtn += 1
            }
        }
        
        return rtn
    }
    
    // 반복문을 함수로 만들어서 풀이
    public class func solution2(_ A: [Int], _ B: [Int]) -> Int {
        
        // 최대공약수를 구함
        func GCD(_ a: Int, _ b: Int) -> Int {
            if b == 0 {
                return a
            }
            return GCD(b, a%b)
        }
        
        // 공통된 약수를 가지고 있는지 판단
        func hasSamePrimeDic(_ a:Int, _ b:Int) -> Bool {
            var a = a
            var b = b
            
            let gcd = GCD(a, b) // 최대공약수를 구해줌

            var gcdA = 0
            var gcdB = 0
            
            // 각 수(a, b)와 최대공약수와의 최대공약수를 구해주고
            // 각 수를 최대공약수로 나눈 값을 다시 최대공약수를 구하는 과정을 반복
            // 각 수와 최대공약수의 최대공약수가 1이 되었을 때 a, b값이 1이 아니라면 그 수가 공통되지 않은 인수
            while(gcdA != 1) {
                gcdA = GCD(a, gcd)
                a = a/gcdA
            }
            
            while(gcdB != 1) {
                gcdB = GCD(b, gcd)
                b = b/gcdB
            }
            
            return a==1 && b==1
        }
        
        var rtn = 0
        let count = A.count
        
        for i in 0..<count {
            if hasSamePrimeDic(A[i], B[i]) {
                rtn += 1
            }
        }
        
        return rtn
    }
}
