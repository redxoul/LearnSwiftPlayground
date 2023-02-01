import Foundation

/*
 // Fibonacci numbers
 // 피보나치 수열
 
 앞의 두 수의 합이 다음 항의 값이 되는 특별한 수열로 자연에서 많이 찾아볼 수 있는 수열입니다.
 
 피보나치 수열은 다음과 같은 점화식 구조입니다.
 F(n) =
    (n=0) 0
    (n=1) 1
    (n>1) F(n-1)+F(n-2)
 
 앞의 숫자들은 아래와 같습니다.
 
 0  1  1(0+1)  2(1+1)  3(1+3)  5(2+3)  8(3+5)  13(5+8)  21(8+13)  34(13+21)  55(21+34)  89(34+55)  ...
 
 피보나치 수열은 재귀함수, 반복문으로 표현이 가능합니다.
 
 */

// 재귀함수로 표현
public func fibonacciRecursive(_ n: Int) -> Int {
    if n<=1 {
        return n
    }
    
    return fibonacciRecursive(n-1)+fibonacciRecursive(n-2)
}

// 반복문으로 표현. Dynamic Programming.
public func fibonacciDynamic(_ n: Int) -> Int {
    var fib = Array(repeating: 0, count: n+1)
    fib[1] = 1
    
    for i in 2..<n+1 {
        fib[i] = fib[i-1]+fib[i-2]
    }
    
    return fib[n]
}
