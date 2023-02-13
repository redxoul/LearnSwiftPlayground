import Foundation

/*
 // (Dynamic Programming) NumberSolitaire
 // https://app.codility.com/programmers/lessons/17-dynamic_programming/number_solitaire/
 
 A game for one player is played on a board consisting of N consecutive squares, numbered from 0 to N − 1. There is a number written on each square. A non-empty array A of N integers contains the numbers written on the squares. Moreover, some squares can be marked during the game.

 At the beginning of the game, there is a pebble on square number 0 and this is the only square on the board which is marked. The goal of the game is to move the pebble to square number N − 1.

 During each turn we throw a six-sided die, with numbers from 1 to 6 on its faces, and consider the number K, which shows on the upper face after the die comes to rest. Then we move the pebble standing on square number I to square number I + K, providing that square number I + K exists. If square number I + K does not exist, we throw the die again until we obtain a valid move. Finally, we mark square number I + K.

 After the game finishes (when the pebble is standing on square number N − 1), we calculate the result. The result of the game is the sum of the numbers written on all marked squares.

 For example, given the following array:

     A[0] = 1
     A[1] = -2
     A[2] = 0
     A[3] = 9
     A[4] = -1
     A[5] = -2
 one possible game could be as follows:

 the pebble is on square number 0, which is marked;
 we throw 3; the pebble moves from square number 0 to square number 3; we mark square number 3;
 we throw 5; the pebble does not move, since there is no square number 8 on the board;
 we throw 2; the pebble moves to square number 5; we mark this square and the game ends.
 The marked squares are 0, 3 and 5, so the result of the game is 1 + 9 + (−2) = 8. This is the maximal possible result that can be achieved on this board.

 Write a function:

 public func solution(_ A : inout [Int]) -> Int
 that, given a non-empty array A of N integers, returns the maximal result that can be achieved on the board represented by array A.

 For example, given the array

     A[0] = 1
     A[1] = -2
     A[2] = 0
     A[3] = 9
     A[4] = -1
     A[5] = -2
 the function should return 8, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [2..100,000];
 each element of array A is an integer within the range [−10,000..10,000].
 
 */

/*
 # 문제 요약
 이것은 1인용 게임입니다.
 0에서 N−1까지 번호가 매겨진 N개의 연속 사각형으로 구성된 보드에서 진행됩니다.
 각 사각형에는 숫자가 쓰여 있고, N 정수의 비어 있지 않은 배열 A에는 사각형에 쓰여진 숫자가 포함됩니다. 일부 사각형은 게임 중에 표시될 수 있습니다.
 게임을 시작할 때, 0번 정사각형에 조약돌(pebble)이 있으며 이것은 보드에 표시된 유일한 사각형입니다.
 게임의 목표는 조약돌을 N-1의 사각형으로 옮기는 것입니다.
 
 각 턴 동안 1~6까지 숫자가 있는 6면체 주사위를 던지고, 주사위를 던저서 윗면에 나오는 숫자 K를 봅니다.
 그 다음, i+K 사각형이 존재하면, i에 서있는 조약돌을 i+K 사각형으로 옮기고,
 i+K가 없다면 움직이지 않고 있을 때까지 던지고 움직입니다.
 조약돌이 N-1에 서면 게임이 끝나고, 나온 숫자들을 모두 더합니다. 최대치의 값을 반환하면 됩니다.
 
 N: [2...100,000] 범위의 정수
 A의 각 원소는 [-10,000...10,000] 범위의 정수
 
 # 풀이
 다이나믹 프로그래밍(DP, 동적 계획법) 으로 풀어야 하는 문제입니다.
 1. 작은 문제의 연속으로 나누기
 2. 작은 문제의 값을 저장하면서 풀기
 
 [1, -2] 일 때 → -1
 [1, -2, 0] 일 때 → 1
 [1, -2, 0, 9] 일 때 → 10
 [1, -2, 0, 9, -1] 일 때 → 9
 [1, -2, 0, 9, -1, -2] 일 때 → 8
 
 -> for문으로 순회하면서 (i-6)~(i-1)까지의 최대값과 i번째 합을 더 해나가면 됨
 
 */

public class NumberSolitaire {
    
    public class func solution(_ A: [Int]) -> Int {
        let N = A.count
        // (i-6)~(i-1)까지의 최대값과 i값을 더한 값을 저장할 변수
        var save = Array(repeating: -10000, count: N)
        save[0] = A[0]
        
        for i in 1..<N {
                    // 시작값(i-6)이 0보다 작으면 0부터 시작
            let start = i-6 >= 0 ? i-6 : 0
            save[i] = save[start...i-1].max()!+A[i]
        }
        
        return save.popLast()!
    }
}
