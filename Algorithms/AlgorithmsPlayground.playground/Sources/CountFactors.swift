import Foundation

/*
 // 약수(Factors)의 갯수 구하기
 약수는 항상 루트N을 기준으로 대칭으로 존재하기 때문에 1~루트N까지만 계산하면 됩니다.
 약수(10)의 제곱이 N(100)일 때는 홀수개(+1)입니다.
 
 */

public func countFactors(_ N: Int) -> Int {
    
    if N == 1 {
        return 1
    }
    var countFactors = 0
    
    let sqrtN = Int(sqrt(Double(N)))
    
    for idx in 1...sqrtN {
        if idx*idx == N {
            countFactors += 1
        }
        else if N%idx == 0 {
            countFactors += 2
        }
    }

    return countFactors
}
