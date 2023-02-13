import Foundation

/*
 // (Fibonacci numbers) FibFrog
 // https://app.codility.com/programmers/lessons/13-fibonacci_numbers/fib_frog/
 
 The Fibonacci sequence is defined using the following recursive formula:

     F(0) = 0
     F(1) = 1
     F(M) = F(M - 1) + F(M - 2) if M >= 2
 A small frog wants to get to the other side of a river. The frog is initially located at one bank of the river (position −1) and wants to get to the other bank (position N). The frog can jump over any distance F(K), where F(K) is the K-th Fibonacci number. Luckily, there are many leaves on the river, and the frog can jump between the leaves, but only in the direction of the bank at position N.

 The leaves on the river are represented in an array A consisting of N integers. Consecutive elements of array A represent consecutive positions from 0 to N − 1 on the river. Array A contains only 0s and/or 1s:

 0 represents a position without a leaf;
 1 represents a position containing a leaf.
 The goal is to count the minimum number of jumps in which the frog can get to the other side of the river (from position −1 to position N). The frog can jump between positions −1 and N (the banks of the river) and every position containing a leaf.

 For example, consider array A such that:

     A[0] = 0
     A[1] = 0
     A[2] = 0
     A[3] = 1
     A[4] = 1
     A[5] = 0
     A[6] = 1
     A[7] = 0
     A[8] = 0
     A[9] = 0
     A[10] = 0
 The frog can make three jumps of length F(5) = 5, F(3) = 2 and F(5) = 5.

 Write a function:

 public func solution(_ A : inout [Int]) -> Int
 that, given an array A consisting of N integers, returns the minimum number of jumps by which the frog can get to the other side of the river. If the frog cannot reach the other side of the river, the function should return −1.

 For example, given:

     A[0] = 0
     A[1] = 0
     A[2] = 0
     A[3] = 1
     A[4] = 1
     A[5] = 0
     A[6] = 1
     A[7] = 0
     A[8] = 0
     A[9] = 0
     A[10] = 0
 the function should return 3, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..100,000];
 each element of array A is an integer that can have one of the following values: 0, 1.
 
 */

/*
 # 문제 요약
 강건너편에 가고 싶어하는 개구리가 있습니다.
 처음 개구리는 강둑position-1에 있고, 다른 둑 position N으로 가고 싶어합니다.
 개구리는 어떤 거리 F(K)를 넘을수 있고, 여기서 F(K)는 K번째 피보나치 수 입니다.
 강에는 잎이 많고, 잎사이를 점프할 수 있고 강둑방향으로만 점프할 수 있습니다.
 A는 N개의 Int배열, 0~N-1까지의 연속적 위치를 나타냅니다.
 0은 잎이 없고, 1은 잎이 있습니다.
 position-1부터 강반대편(N-1)까지 건너갈 수 있는 최소 점프 횟수를 반환해야 합니다.
 예를 들어 [0,0,0,1,1,0,1,0,0,0,0] 일 때
 F(5) = 5, F(3) = 2, F(5) = 5로 총 3번 만에 도달하므로 3을 리턴하면 됩니다.
 N = 0~100,000
 
 # 풀이
 문제의 결론은 ‘피보나치 수’만큼만 점프할 수 있는 개구리가 시작점(인덱스:-1)에서부터 강건너(인덱스:N)까지 몇번의 점프(밟은 나뭇잎 수+1)를 해야하는지 반환하는 문제입니다.
 풀기전에 피보나치 수열(Fibonacci numbers) 을 먼저 알아야 풀 수 있습니다.
 빨리 풀기 위해 피보나치 수열을 강건너 거리까지 구해놓고 역순으로 찾는게 핵심입니다.
 
 */

public class FibFrog {
    
    public class func solution(_ A: [Int]) -> Int {
        
        if A.count == 0 {
            return 1
        }
        
        // 개구리가 도달해야하는 지점(A.count+1)까지 피보나치를 계산
        var fibArr = [0, 1]
        var idx = 2
        while fibArr[idx-1] <= A.count+1 {
            fibArr.append(fibArr[idx-2]+fibArr[idx-1])
            idx += 1
        }
        
        // 최소한의 점프로 N+1에 도착하는 경우를 찾기 위해
        // 찾은 피보나치 수를 역순으로
        fibArr = fibArr.reversed()
        
        var queue:[(x:Int, jump:Int)] = [(-1, 0)]   // 개구리의 첫(현재)위치는 -1, 0번 점프
        var check:[Bool] = Array(repeating: false, count: A.count+1) // 이미 한번 밟은 나뭇잎을 제외하기 위해 체크
        
        while !queue.isEmpty {
            if let current = queue.first {
                queue.removeFirst()
                
                for fib in fibArr {
                    let next = current.x+fib
                    
                    if next == A.count {
                        // 개구리가 마지막에 도착
                        return current.jump+1
                    }
                    else if next < A.count && next >= 0 {
                        if A[next] == 1 && !check[next] {   // 나뭇잎이 있고, 체크한 적 없는 나뭇잎이라면
                            check[next] = true  // 이미 한번 밟은 나뭇잎을 제외하기 위해 체크
                            queue.append((next, current.jump+1))
                        }
                    }
                }
            }
        }
        
        return -1
    }
}
