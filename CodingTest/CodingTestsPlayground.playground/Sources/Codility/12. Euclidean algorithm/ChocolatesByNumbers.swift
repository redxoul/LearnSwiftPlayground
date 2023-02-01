import Foundation

/*
 // (Euclidean algorithm) ChocolatesByNumbers
 // https://app.codility.com/programmers/lessons/12-euclidean_algorithm/chocolates_by_numbers/
 
 Two positive integers N and M are given. Integer N represents the number of chocolates arranged in a circle, numbered from 0 to N − 1.

 You start to eat the chocolates. After eating a chocolate you leave only a wrapper.

 You begin with eating chocolate number 0. Then you omit the next M − 1 chocolates or wrappers on the circle, and eat the following one.

 More precisely, if you ate chocolate number X, then you will next eat the chocolate with number (X + M) modulo N (remainder of division).

 You stop eating when you encounter an empty wrapper.

 For example, given integers N = 10 and M = 4. You will eat the following chocolates: 0, 4, 8, 2, 6.

 The goal is to count the number of chocolates that you will eat, following the above rules.

 Write a function:

 public func solution(_ N : Int, _ M : Int) -> Int
 that, given two positive integers N and M, returns the number of chocolates that you will eat.

 For example, given integers N = 10 and M = 4. the function should return 5, as explained above.

 Write an efficient algorithm for the following assumptions:

 N and M are integers within the range [1..1,000,000,000].

 */

/*
 # 문제 요약
 양의 Int N, M이 주어지며, ~100,000,000(1억)까지의 범위를 가질 수 있습니다.
 N은 원 안에 배열된 초콜릿 수로 0~N-1까지의 초콜릿이 있습니다.
 0부터 M개씩 건너뛰며 초콜릿을 먹기 시작하고, 먹고나면 초콜릿 포장만 남게 됩니다.
 만약 X번째의 초콜릿을 먹었다면, 다음으로 modulo N(나누기의 나머지)인 X+M의 초콜릿을 먹을 것입니다.
 빈 포장지를 만나면 먹는 것을 멈춥니다.
 이 때 먹은 초콜릿 수를 반환합니다.
 예를 들어 N=10, M=4라면 0, 4, 8, 2, 6을 먹게 되서, 5를 반환.
 
 # 풀이
 숫자들이 원으로 반복된다고 생각을 해보면
 0(먹음) -> 1 -> 2 -> 3 -> 4(먹음)
 -> 5 -> 6 -> 7 -> 8(먹음)
 -> 9 -> 0 -> 1 -> 2(먹음)
 -> 3 -> 4(껍질. 지나감) -> 5 -> 6(먹음)
 -> 7 -> 8(껍질. 지나감) -> 9 -> 0(껍질. 먹기 종료)
 
 먹게 된 결과를 보면 0을 포함해서, N과 M의 최대공약수(2)의 배수를 찾는 문제임을 알 수 있게 됩니다.
 유클리드 호재법을 이용해서 풀수 있습니다.
 
 */


public class ChocolatesByNumbers {
    
    // 재귀함수 사용
    public class func solution(_ N: Int, _ M: Int) -> Int {
        
        func GCD(_ a: Int, _ b: Int) -> Int {
            if b == 0 {
                return a
            }
            return GCD(b, a%b)
        }
        
        return N/GCD(N, M)
    }
    
    // while문 사용
    public class func solution2(_ N: Int, _ M: Int) -> Int {
        
        var a = N, b = M
        
        while b != 0 {
            let r = a%b
            a = b
            b = r
        }
        
        return N/a
    }
}
