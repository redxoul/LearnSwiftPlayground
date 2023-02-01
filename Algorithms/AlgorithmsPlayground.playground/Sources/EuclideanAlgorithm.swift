import Foundation

/*
 // Euclidean algorithm
 // 유클리드 호제법
 
 2개 자연수의 최대 공약수(GCD, Greatest Common Division)을 구하는 알고리즘.
 
 '두 개의 자연수 a, b가 주어지고, a>b, a%b = r 일 때,
 GCD(a, b) = GCD(b, r)과 같고 r이 0이 되었을 때, 그 때 b가 최대공약수이다'라는 원리를 이용한 알고리즘입니다.
 
 예를 들어 a=24, b=16 일 때,
 GCD(24, 16)
 -> GCD(16, 8)
 -> GCD(8, 0)
 -> 최대공약수 = 8
 
 */

// 재귀함수로 구현
public func GCD(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        }
    
        return GCD(b, a%b)
}

// 반복문으로 구현
public func GCD2(_ n: Int, _ m: Int) -> Int
{
    var a = n
    var b = m
    
    while(b != 0){
        let r = a % b
        a = b
        b = r
    }
    
    return a
}

// * 다항식일 경우
// a, b, c가 있을 때 a, b의 최대공약수(x)를 먼저 구하고 c, x의 최대공약수를 다시 구하면 됩니다.

public func GCD3(_ a: Int, _ b: Int, _ c: Int) -> Int {
    return GCD(GCD(a, b), c)
}

