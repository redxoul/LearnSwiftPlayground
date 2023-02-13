import Foundation

/*
 // (Sieve of Eratosthenes) CountSemiprimes
 // https://app.codility.com/programmers/lessons/11-sieve_of_eratosthenes/count_semiprimes/
 
 A prime is a positive integer X that has exactly two distinct divisors: 1 and X. The first few prime integers are 2, 3, 5, 7, 11 and 13.

 A semiprime is a natural number that is the product of two (not necessarily distinct) prime numbers. The first few semiprimes are 4, 6, 9, 10, 14, 15, 21, 22, 25, 26.

 You are given two non-empty arrays P and Q, each consisting of M integers. These arrays represent queries about the number of semiprimes within specified ranges.

 Query K requires you to find the number of semiprimes within the range (P[K], Q[K]), where 1 ≤ P[K] ≤ Q[K] ≤ N.

 For example, consider an integer N = 26 and arrays P, Q such that:

     P[0] = 1    Q[0] = 26
     P[1] = 4    Q[1] = 10
     P[2] = 16   Q[2] = 20
 The number of semiprimes within each of these ranges is as follows:

 (1, 26) is 10,
 (4, 10) is 4,
 (16, 20) is 0.
 Write a function:

 public func solution(_ N : Int, _ P : inout [Int], _ Q : inout [Int]) -> [Int]

 that, given an integer N and two non-empty arrays P and Q consisting of M integers, returns an array consisting of M elements specifying the consecutive answers to all the queries.

 For example, given an integer N = 26 and arrays P, Q such that:

     P[0] = 1    Q[0] = 26
     P[1] = 4    Q[1] = 10
     P[2] = 16   Q[2] = 20
 the function should return the values [10, 4, 0], as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..50,000];
 M is an integer within the range [1..30,000];
 each element of arrays P and Q is an integer within the range [1..N];
 P[i] ≤ Q[i].
 
 */

/*
 # 문제 요약
 1~50000인 Int N과 동일한 M개의 Int로 채워진 P, Q 배열이 주어집니다.
 1<=P[K]<=Q[K]<=N 범위 내의 semiPrime(소수의 곱으로 이뤄진 숫자)의 배열을 반환하는 문제입니다.
 
 # 풀이
 에라토스테네스의 채(Sieve of Eratosthenes, 소수를 찾는 알고리즘)로 소수를 먼저 구해야 합니다.
 범위를 정해준만큼 배열을 만들어서 풀어봅니다(repeating).
 찾아낸 소수로 범위내(~N) 소수의 곱(semiPrime)을 찾고,
 소수의 곱으로 누적 합을 찾아서,
 배열의 범위(P[n]~Q[n])내 소수의 곱을 배열에 넣습니다.
 배열이 1개만 올때 예외처리도 해야 합니다.
 
 */

public class CountSemiprimes {
    
    public class func solution(_ N: Int, _ P:[Int], _ Q:[Int]) -> [Int] {
        // N: 1~50000
        // P[n], Q[n]: 1이상의 정수
        // 1<=P[K]<=Q[K]<=N 범위 내의 semiPrime(소수의 곱으로 이뤄진 숫자)의 배열을 반환
        
        if P.count == 1 {
            return [0]
        }
        
        // '에라토스테네스의 채'로 1~N범위의 prime을 먼저 찾아야 함
        var isPrime = Array(repeating: true, count: N+1)    // N의 범위만큼의 배열
        isPrime[0] = false  // 0, 1은 소수 아님
        isPrime[1] = false
        var prime: [Int] = []
        
        for i in 2...N {
            if isPrime[i] {
                prime.append(i)
                for j in stride(from: i*i, through: N, by: i) {
                    isPrime[j] = false
                }
            }
        }
        
        // 여기까지가 '에라토스테네스의 채'로 prime(소수)를 찾는 과정
        
        // prime으로 semiPrime 구하기
        var semiPrime = Array(repeating: 0, count: N+1)
        for i in prime {
            for j in prime {
                // N이하의 semiPrime값만 구하면 됨
                if i*j > N {
                    break
                }
                semiPrime[i*j] = 1
            }
        }
        
        // semiPrime값이 나올때까지의 누적 갯수를 구하기
        for i in 1..<semiPrime.count {
            semiPrime[i] += semiPrime[i-1]
        }
        
        // 인자 P, Q값으로 구해놓은 누적 semiPrime으로 반환값 구하기
        var result: [Int] = []
        for i in 0..<P.count {
            result.append(semiPrime[Q[i]] - semiPrime[P[i]-1])
        }
        
        return result
    }
}
