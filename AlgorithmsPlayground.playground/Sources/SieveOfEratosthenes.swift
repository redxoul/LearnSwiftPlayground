import Foundation

/*
 // Sieve of Eratosthenes
 // 에라토스테네스의 채
 
 간단하게 말하면, 1부터 어떤 수 N까지의 범위에서 소수들을 찾는 방법입니다.
 고대 그리스 수학자 에라토스테네스가 발견하였으며, 구하는 방법이 마치 채에 거르는 것과 같아 '에라토스테네스의 채'라고 불립니다.

 예를 들어, 1부터 100까지 범위 중에서 소수를 구해보면,
 
 1. 1은 소수도 합성수도 아니라고 위에 설명했으니 지워줍니다. 보통 이 이론을 설명할 때 숫자들을 2부터 나열하는 이유이기도 합니다.
 2. 2부터 시작해서 자기 자신을 제외한 2의 배수를 모두 지웁니다.
 3. 3부터 시작해서 자기자신을 제외한 3의 배수를 모두 지웁니다.
 4. 4는 이미 2단계에서 지워졌으므로 5로 넘어가서 5부터 시작해서 자기 자신을 제외한 5의 배수를 모두 지웁니다.
 5. 6은 이미 2단계에서 지워졌으므로 7로 넘어가서 자기 자신을 제외한 7의 배수를 모두 지웁니다.
 6. 2-5단계의 과정을 계속해서 반복하면 소수만이 지워지지 않고 남게 됩니다.
 
 */

// '에라토스테네스의 채'로 1~N범위의 prime을 찾기
public func sieveOfEratosthenes(_ N: Int) -> [Int] {
    
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
 
    return prime
}
