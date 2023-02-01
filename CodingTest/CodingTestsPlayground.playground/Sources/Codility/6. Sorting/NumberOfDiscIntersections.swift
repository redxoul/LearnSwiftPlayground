import Foundation

/*
 // (Sorting) NumberOfDiscIntersections
 // https://app.codility.com/programmers/lessons/6-sorting/number_of_disc_intersections/
 
 We draw N discs on a plane. The discs are numbered from 0 to N − 1. An array A of N non-negative integers, specifying the radiuses of the discs, is given. The J-th disc is drawn with its center at (J, 0) and radius A[J].

 We say that the J-th disc and K-th disc intersect if J ≠ K and the J-th and K-th discs have at least one common point (assuming that the discs contain their borders).

 The figure below shows discs drawn for N = 6 and A as follows:

   A[0] = 1
   A[1] = 5
   A[2] = 2
   A[3] = 1
   A[4] = 4
   A[5] = 0


 There are eleven (unordered) pairs of discs that intersect, namely:

 discs 1 and 4 intersect, and both intersect with all the other discs;
 disc 2 also intersects with discs 0 and 3.
 Write a function:

 public func solution(_ A : inout [Int]) -> Int

 that, given an array A describing N discs as explained above, returns the number of (unordered) pairs of intersecting discs. The function should return −1 if the number of intersecting pairs exceeds 10,000,000.

 Given array A shown above, the function should return 11, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..100,000];
 each element of array A is an integer within the range [0..2,147,483,647].

 */

/*
 # 문제 요약
 Int 배열 A가 주어졌을 때, (x, 0)좌표가 중심이고, A[x]가 반지름인 원을 나타냅니다.
 원이 겹치는 쌍의 갯수를 반환해야 하는 문제입니다.
 A[x] 범위는 Int의 최대치까지 가능합니다.
 
 # 풀이
 A[x] 범위는 Int의 최대치까지 가능하므로 Float으로 계산해줘야 합니다.
 주어진 중심과 반지름으로 ‘x축과 원이 만나는 왼쪽점과 오른쪽 점으로 이루어진 새로운 배열을 만들어서 정렬’하는 게 핵심입니다.
 
 (1) 배열 A의 왼쪽 끝점(left)과 오른쪽 끝점(right)에 대해 배열 circles에 저장합니다
 -4 -3  -2  -1  0   1   2   3   4   5   6   7   8
            |-------| circles[0]
 |--------------------------------------| circles[1]
                |---------------| circles[2]
                        |-------| circles[3]
                |-------------------------------| circles[4]
                                    | circles[5]
 
 (2) 배열 circles의 left를 기준으로 오름차순 정렬합니다.
 -4 -3  -2  -1  0   1   2   3   4   5   6   7   8
 |--------------------------------------| circles[0]
            |-------| circles[1]
                |---------------| circles[2]
                |-------------------------------| circles[3]
                        |-------| circles[4]
                                    | circles[5]
 
 (3) circles[0] ~ circles[N-1]까지 각 항목을 기준으로 둔 상태에서 circles[1] ~ circles[N]이 기준 원에 겹치는지를 판단합니다.
    1) intersection 값이 10,000,000을 초과하면 -1을 return
    2) 비교하는 원의 왼쪽 끝점(left)이 기준 원의 오른쪽 끝점(right)보다 크면 겹치지 않게 되므로 해당 기준 원에 대한 비교 중지
        → 왼쪽 끝점(left)을 기준으로 정렬한 상태이기 때문에 이후의 원들도 기준 원과 겹치지 않습니다.
    3) 비교하는 원의 왼쪽 끝점(left)이 기준 원의 왼쪽 끝점(left)과 오른쪽 끝점(right) 사이에 있으면 intersection 값을 증가
 
 -4 -3  -2  -1  0   1   2   3   4   5   6   7   8
 |--------------------------------------| circles[0] 🚩 기준
            |-------| circles[1]
                |---------------| circles[2]
                |-------------------------------| circles[3]
                        |-------| circles[4]
                                    | circles[5]
 
 -4 -3  -2  -1  0   1   2   3   4   5   6   7   8
            |-------| circles[1] 🚩 기준
                |---------------| circles[2]
                |-------------------------------| circles[3]
 
 
 -4 -3  -2  -1  0   1   2   3   4   5   6   7   8
                |---------------| circles[2] 🚩 기준
                |-------------------------------| circles[3]
                        |-------| circles[4]
 
 
 -4 -3  -2  -1  0   1   2   3   4   5   6   7   8
                |-------------------------------| circles[3] 🚩 기준
                        |-------| circles[4]
                                    | circles[5]
 
 
 -4 -3  -2  -1  0   1   2   3   4   5   6   7   8
                        |-------| circles[4] 🚩 기준
 
 */

public class NumberOfDiscIntersections {
    
    public class func solution(_ A : [Int]) -> Int {
        // (x, 0)좌표가 중심이고, A[x]가 반지름인 원
        // 원이 겹치는 쌍의 갯수를 반환
        
        // 겹치는 원을 카운트
        var intersection = 0
        
        let aCount = A.count
        
        // 원과 x축이 겹치는 왼쪽점(left), 오른쪽점(right)을 튜플 배열로 저장
        // A의 요소 범위가 Int의 최대치이기 때문에 원의 지름이 Int범위 밖으로 넘어갈 수 있음
        // -> Float으로 계산해야 함
        var circles = [(left: Float, right: Float)]()
        
        // A배열은 index가 원의 중심좌표(center)
        for (center, value) in A.enumerated() {
            circles.append((Float(center-value), Float(center+value)))
        }
        
        // 원 배열을 왼쪽점(left)기준 오름차순으로 정렬
        circles.sort(by: { $0.left < $1.left })
        
        for i in 0..<aCount {
            for j in i+1..<aCount {
                // 기준원(i)의 오른쪽이 비교원(j)의 왼쪽보다 크거나 같으면 겹쳐진 원
                if circles[i].right >= circles[j].left {
                    intersection += 1
                    if intersection > 10000000 {
                        return -1
                    }
                }
                else {
                    // 왼쪽점 기준으로 정렬했기 때문에, 이후부터는 겹쳐질 일이 없어서 비교를 중지
                    break
                }
            }
        }
        
        return intersection
    }
}
