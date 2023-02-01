import Foundation

/*
 // (Prefix Sums) GenomicRangeQuery
 // https://app.codility.com/programmers/lessons/5-prefix_sums/genomic_range_query/
 
 A DNA sequence can be represented as a string consisting of the letters A, C, G and T, which correspond to the types of successive nucleotides in the sequence. Each nucleotide has an impact factor, which is an integer. Nucleotides of types A, C, G and T have impact factors of 1, 2, 3 and 4, respectively. You are going to answer several queries of the form: What is the minimal impact factor of nucleotides contained in a particular part of the given DNA sequence?

 The DNA sequence is given as a non-empty string S = S[0]S[1]...S[N-1] consisting of N characters. There are M queries, which are given in non-empty arrays P and Q, each consisting of M integers. The K-th query (0 ≤ K < M) requires you to find the minimal impact factor of nucleotides contained in the DNA sequence between positions P[K] and Q[K] (inclusive).

 For example, consider string S = CAGCCTA and arrays P, Q such that:

     P[0] = 2    Q[0] = 4
     P[1] = 5    Q[1] = 5
     P[2] = 0    Q[2] = 6
 The answers to these M = 3 queries are as follows:

 The part of the DNA between positions 2 and 4 contains nucleotides G and C (twice), whose impact factors are 3 and 2 respectively, so the answer is 2.
 The part between positions 5 and 5 contains a single nucleotide T, whose impact factor is 4, so the answer is 4.
 The part between positions 0 and 6 (the whole string) contains all nucleotides, in particular nucleotide A whose impact factor is 1, so the answer is 1.
 Write a function:

 public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int]
 that, given a non-empty string S consisting of N characters and two non-empty arrays P and Q consisting of M integers, returns an array consisting of M integers specifying the consecutive answers to all queries.

 Result array should be returned as an array of integers.

 For example, given the string S = CAGCCTA and arrays P, Q such that:

     P[0] = 2    Q[0] = 4
     P[1] = 5    Q[1] = 5
     P[2] = 0    Q[2] = 6
 the function should return the values [2, 4, 1], as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..100,000];
 M is an integer within the range [1..50,000];
 each element of arrays P and Q is an integer within the range [0..N - 1];
 P[K] ≤ Q[K], where 0 ≤ K < M;
 string S consists only of upper-case English letters A, C, G, T.
 
 */

/*
 # 문제 요약
 S = DNA Sequence 염기서열(”CAGCCTA”)
 P = 염기서열의 시작점 인덱스 배열
 Q = 염기서열의 끝점 인덱스 배열
 S의 값: A=1, C=2, G=3, T=4
 S[P]~S[Q]안에서 최소값인 문자를 찾는 문제입니다.
 
 # 풀이
 (1) A, C, G, T에 대한 S.count만큼의 배열을 만들고
 각 문자배열의 인덱스까지 해당 문자가 몇번 나왔는지를 채워넣는 것이 풀이의 핵심입니다.
 (2) ⭐️이 배열의 의미⭐️: p인덱스값, q인덱스값이 같다는 것은 그 사이에 해당값이 나오지 않았다는 뜻이고, 다르다면 p인덱스 이전에 해당값이 있었다는 의미입니다.
 (3) 과정(1)에서 만들어진 배열로 탐색을 하는 과정: A, C, G, T배열순서로 탐색을 하되
 (3-1) p인덱스와 q인덱스가 같다면 S의 해당인덱스의 값을 반환배열에 넣어주고,
 (3-2) p인덱스값과 q인덱스값이 같지 않았을 때 해당 배열(A,C,G,T)에 해당하는 숫자를 반환배열에 넣어주면 됩니다.
 
 */

public class GenomicRangeQuery {
    
    public class func solution(_ S : String, _ P : [Int], _ Q : [Int]) -> [Int] {
        // 예시
        // S: CAGCCTA
        // 0: G ,C -> G C C -> 3, 2 -> 2
        // 1: T, T -> 4
        // 2: C, A -> C A G C C T A -> 1
        
        var result = [Int]()
        let dic = ["A":1, "C":2, "G":3, "T":4]
        let sArr = Array(S)
        
        // S카운트+1 만큼 0으로 채워진 배열을 4개를 만듭니다(각각 A, C, G, T 베열)
        var acgt = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: S.count+1), count: 4)
            
        // 이 배열을 만드는게 중요
        // 각 문자배열의 인덱스까지 해당 문자가 몇번 나왔는지를 채워넣습니다
        for (idx, char) in sArr.enumerated() {
            // 배열은 idx로 돌지만 실제 값은 idx+1에 채워줍니다
            // 0번째는 비워두고 1인덱스부터 해당 Char가 있을 때 이전값+1을 해줍니다
            switch char {
            case "A":
                acgt[0][idx+1] = acgt[0][idx]+1
                acgt[1][idx+1] = acgt[1][idx]
                acgt[2][idx+1] = acgt[2][idx]
                acgt[3][idx+1] = acgt[3][idx]
            case "C":
                acgt[0][idx+1] = acgt[0][idx]
                acgt[1][idx+1] = acgt[1][idx]+1
                acgt[2][idx+1] = acgt[2][idx]
                acgt[3][idx+1] = acgt[3][idx]
            case "G":
                acgt[0][idx+1] = acgt[0][idx]
                acgt[1][idx+1] = acgt[1][idx]
                acgt[2][idx+1] = acgt[2][idx]+1
                acgt[3][idx+1] = acgt[3][idx]
            case "T":
                acgt[0][idx+1] = acgt[0][idx]
                acgt[1][idx+1] = acgt[1][idx]
                acgt[2][idx+1] = acgt[2][idx]
                acgt[3][idx+1] = acgt[3][idx]+1
            default:
                break
            }
        }
        
        for pq in 0..<P.count {
            let startIdx = P[pq]
            let endIdx = Q[pq]
            
            if startIdx == endIdx {
                // 시작(P)과 끝(Q) 인덱스가 같다면, 해당 문자에 매칭되는 숫자를 바로 넣습니다
                let key = sArr[startIdx]
                result.append(dic[String(key)]!)
                continue
            }
            
            // 시작(P)과 끝(Q) 인덱스가 다를 때,
            for idx in 0..<4 {
                // 순서대로 배열을 탐색하고 시작과 끝 값이 다르면 해당값이 나온 것이기 때문에 result에 넣고 다음으로 넘어갑니다.
                if acgt[idx][startIdx] != acgt[idx][endIdx+1] {
                    result.append(idx+1)
                    break
                }
            }
        }
        
        return result
    }
}

