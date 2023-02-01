import Foundation

/*
 // (Stacks and Queues) StoneWall
 // https://app.codility.com/programmers/lessons/7-stacks_and_queues/stone_wall/
 
 You are going to build a stone wall. The wall should be straight and N meters long, and its thickness should be constant; however, it should have different heights in different places. The height of the wall is specified by an array H of N positive integers. H[I] is the height of the wall from I to I+1 meters to the right of its left end. In particular, H[0] is the height of the wall's left end and H[N−1] is the height of the wall's right end.

 The wall should be built of cuboid stone blocks (that is, all sides of such blocks are rectangular). Your task is to compute the minimum number of blocks needed to build the wall.

 Write a function:

 public func solution(_ H : inout [Int]) -> Int

 that, given an array H of N positive integers specifying the height of the wall, returns the minimum number of blocks needed to build it.

 For example, given array H containing N = 9 integers:

   H[0] = 8    H[1] = 8    H[2] = 5
   H[3] = 7    H[4] = 9    H[5] = 8
   H[6] = 7    H[7] = 4    H[8] = 8
 the function should return 7. The figure shows one possible arrangement of seven blocks.



 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..100,000];
 each element of array H is an integer within the range [1..1,000,000,000].
 
 */

/*
 # 문제 요약
 H[i]는 i부터 i+1까지의 높이 값을 나타냅니다.
 이 벽을 쌓는데 필요한 최소한의 직사각형 벽돌의 수를 반환하는 문제입니다.
 
 # 풀이
 (문제페이지에 있는 그림을 참고)
 그림을 보고 3가지 규칙을 찾아내야 합니다.
 - 현재의 값보다 같은 수가 들어오면 직사각형을 계속 그리고,
 - 큰 수가 들어오면 직사각형을 그리면서 그 직사각형 위로 새 직사각형이 생기고,
 - 작은 수가 들어오면 지금 작업중이던 직사각형 작업이 끝나고 새 직사각형이 생깁니다.
 
 */

public class StoneWall {
    public class func solution(_ H: [Int]) -> Int {
        // H[i]는 i부터 i+1까지의 높이
        
        // stack엔 현재 직사각형 작업이 진행되고 있는 높이가 저장
        var stack:[Int] = []
        var count = 0
        
        for height in H {
            // 작업진행중인 직사각형stack이 있는데, 그 높이보다 지금 높이height가 낮다면,
            // 진행중이던 직사각형은 더 진행이 안되고 새 직사각형이 시작된 것이니, stack을 빼줌.
            while stack.count > 0 && stack[stack.count-1] > height {
                stack.removeLast()
            }
            
            // stack에 아무것도 없다면 base를 만들기 위해 stack에 쌓고, 직사각형 만들기 시작했으니 +1을 해준다.
            // or 지금 높이가 stack의 마지막 높이보다 크다면, 지금 진행되고 있는 직사각형 높이(stack.last)위로 직사각형이 더 필요한 것이므로 stack에 그 높이를 더해주고, +1을 해준다.
            if stack.count==0 || stack[stack.count-1] < height {
                stack.append(height)
                count += 1
            }
        }
        
        return count
    }
}
