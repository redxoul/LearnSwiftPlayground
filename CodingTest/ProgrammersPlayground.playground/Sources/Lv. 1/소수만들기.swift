import Foundation

/*
 // 소수 만들기
 // https://school.programmers.co.kr/learn/courses/30/lessons/12977
 
 주어진 숫자 중 3개의 수를 더했을 때 소수가 되는 경우의 개수를 구하려고 합니다. 숫자들이 들어있는 배열 nums가 매개변수로 주어질 때, nums에 있는 숫자들 중 서로 다른 3개를 골라 더했을 때 소수가 되는 경우의 개수를 return 하도록 solution 함수를 완성해주세요.

 ### 제한사항

 - nums에 들어있는 숫자의 개수는 3개 이상 50개 이하입니다.
 - nums의 각 원소는 1 이상 1,000 이하의 자연수이며, 중복된 숫자가 들어있지 않습니다.

 ---

 ### 입출력 예
 
 nums           | result
 [1, 2, 3, 4]   | 1
 [1, 2, 7, 6, 4]| 4

 ### 입출력 예 설명

 입출력 예 #1

 [1,2,4]를 이용해서 7을 만들 수 있습니다.

 입출력 예 #2

 [1,2,4]를 이용해서 7을 만들 수 있습니다.

 [1,4,6]을 이용해서 11을 만들 수 있습니다.

 [2,4,7]을 이용해서 13을 만들 수 있습니다.

 [4,6,7]을 이용해서 17을 만들 수 있습니다.
 
 */

public class 소수만들기 {
    public class func solution(_ nums: [Int]) -> Int {
        let N = nums.count
        let sorted = nums.sorted(by: < )
        let maxSum = sorted[N-1]+sorted[N-2]+sorted[N-1]
        
        var isPrime = Array(repeating: true, count: maxSum+1)    // N의 범위만큼의 배열
        isPrime[0] = false  // 0, 1은 소수 아님
        isPrime[1] = false
        var primes:[Int] = []
        
        // 2~N까지의 소수를 찾음
        for i in 2...maxSum {
            if isPrime[i] {
                primes.append(i)
                for j in stride(from: i*i, through: maxSum, by: i) {
                    isPrime[j] = false
                }
            }
        }
        
        var result = 0
        
        for index1 in 0..<N-2 {
            for index2 in index1+1..<N-1 {
                for index3 in index2+1..<N {
                    if primes.contains(sorted[index1]+sorted[index2]+sorted[index3]) {
                        result += 1
                    }
                }
            }
        }
        
        return result
    }
}
