import Foundation

/*
 // (Stacks and Queues) Fish
 // https://app.codility.com/programmers/lessons/7-stacks_and_queues/fish/
 
 You are given two non-empty arrays A and B consisting of N integers. Arrays A and B represent N voracious fish in a river, ordered downstream along the flow of the river.

 The fish are numbered from 0 to N − 1. If P and Q are two fish and P < Q, then fish P is initially upstream of fish Q. Initially, each fish has a unique position.

 Fish number P is represented by A[P] and B[P]. Array A contains the sizes of the fish. All its elements are unique. Array B contains the directions of the fish. It contains only 0s and/or 1s, where:

 0 represents a fish flowing upstream,
 1 represents a fish flowing downstream.
 If two fish move in opposite directions and there are no other (living) fish between them, they will eventually meet each other. Then only one fish can stay alive − the larger fish eats the smaller one. More precisely, we say that two fish P and Q meet each other when P < Q, B[P] = 1 and B[Q] = 0, and there are no living fish between them. After they meet:

 If A[P] > A[Q] then P eats Q, and P will still be flowing downstream,
 If A[Q] > A[P] then Q eats P, and Q will still be flowing upstream.
 We assume that all the fish are flowing at the same speed. That is, fish moving in the same direction never meet. The goal is to calculate the number of fish that will stay alive.

 For example, consider arrays A and B such that:

   A[0] = 4    B[0] = 0
   A[1] = 3    B[1] = 1
   A[2] = 2    B[2] = 0
   A[3] = 1    B[3] = 0
   A[4] = 5    B[4] = 0
 Initially all the fish are alive and all except fish number 1 are moving upstream. Fish number 1 meets fish number 2 and eats it, then it meets fish number 3 and eats it too. Finally, it meets fish number 4 and is eaten by it. The remaining two fish, number 0 and 4, never meet and therefore stay alive.

 Write a function:

 public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int

 that, given two non-empty arrays A and B consisting of N integers, returns the number of fish that will stay alive.

 For example, given the arrays shown above, the function should return 2, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..100,000];
 each element of array A is an integer within the range [0..1,000,000,000];
 each element of array B is an integer that can have one of the following values: 0, 1;
 the elements of A are all distinct.
 
 */

/*
 # 문제 요약
 물고기의 크기를 나타내는 A배열과, 해당 물고기의 이동방향을 나타내는 B배열이 주어집니다.
 B[i]가 0이면 상류(0<-last), 1이면 하류(0->last)로 가는 물고기입니다.
 A[0]=4, A[1]=1 이라면 둘이 만나지 않습니다. A[2]=0이면 A[1]과 만나서 잡아먹힙니다.
 최종적으로 살아남는 물고기의 수를 반환하는 문제입니다.
 
 # 풀이
 하류(1)로 가는 물고기를 스택으로 쌓은 후
 상류(0)로 가는 물고기와 하나씩 붙여보는 게 문제의 포인트입니다.
 (PassingCars와 조금 유사한 문제)
 
 */

public class Fish {
    
    public func solution(_ A : [Int], _ B : [Int]) -> Int {
        var alive = 0
        var downstreamStack:Array<Int> = []   // 하류(1)일 때 넣을 스택
        
        for (idx, value) in A.enumerated() {
            if B[idx] == 1 {
                // 물고기가 하류로 간다면 스택에 append
                downstreamStack.append(value)
            }
            else {
                // 상류로 간다면 스택에 쌓인 하류행물고기가 있는지 확인
                while downstreamStack.count > 0 {
                    // 만난 하류행 물고기가 더 크면 끝
                    if downstreamStack.last! > value {
                        break
                    }
                    else {
                        // 상류행 물고기가 더 크면 하류행스택의 물고기를 하나씩 제거
                        downstreamStack.removeLast()
                    }
                }
                
                // 하류행스택을 다 잡아먹었다면 살아남은 상류행물고기+1
                if downstreamStack.count == 0 {
                    alive += 1
                }
            }
        }
        
        // alive(살아남은 상류행물고기)+downstreamStack.count(살아남은 하류행물고기)
        return alive+downstreamStack.count
    }
}
