import Foundation

/*
 // (Counting Elements) FrogRiverOne
 // https://app.codility.com/programmers/lessons/4-counting_elements/frog_river_one/
 
 A small frog wants to get to the other side of a river. The frog is initially located on one bank of the river (position 0) and wants to get to the opposite bank (position X+1). Leaves fall from a tree onto the surface of the river.

 You are given an array A consisting of N integers representing the falling leaves. A[K] represents the position where one leaf falls at time K, measured in seconds.

 The goal is to find the earliest time when the frog can jump to the other side of the river. The frog can cross only when leaves appear at every position across the river from 1 to X (that is, we want to find the earliest moment when all the positions from 1 to X are covered by leaves). You may assume that the speed of the current in the river is negligibly small, i.e. the leaves do not change their positions once they fall in the river.

 For example, you are given integer X = 5 and array A such that:

   A[0] = 1
   A[1] = 3
   A[2] = 1
   A[3] = 4
   A[4] = 2
   A[5] = 3
   A[6] = 5
   A[7] = 4
 In second 6, a leaf falls into position 5. This is the earliest time when leaves appear in every position across the river.

 Write a function:

 public func solution(_ X : Int, _ A : inout [Int]) -> Int
 that, given a non-empty array A consisting of N integers and integer X, returns the earliest time when the frog can jump to the other side of the river.

 If the frog is never able to jump to the other side of the river, the function should return −1.

 For example, given X = 5 and array A such that:

   A[0] = 1
   A[1] = 3
   A[2] = 1
   A[3] = 4
   A[4] = 2
   A[5] = 3
   A[6] = 5
   A[7] = 4
 the function should return 6, as explained above.

 Write an efficient algorithm for the following assumptions:

 N and X are integers within the range [1..100,000];
 each element of array A is an integer within the range [1..X].

 
 */

/*
 # 문제 요약
 목표위치 X값과 i시간마다 나뭇잎이 떨어지는 위치 배열 A이 주어집니다.
 0위치에 있는 개구리가 X+1위치까지 나뭇잎을 밟고 1칸씩 건너갑니다.
 나뭇잎이 i시간에 A[i] 위치에 떨어질 때, X+1위치까지 건너가는데 필요한 i시간을 구하는 문제입니다.
 'A원소는 [1...X] 사이'의 값
 
 # 풀이
 'Set'의 특성을 활용하면 쉽게 풀리는 문제입니다.
 A원소의 범위가 최대X이기 때문에 Set의 Count가 X가 될 때 건널 수 있게 됩니다.
 
 */

public class FrogRiverOne {
    
    public class func solution(_ X:Int, _ A : [Int]) -> Int {
        if A.count >= X {
            var checkSet = Set<Int>()
            for (index, value) in A.enumerated() {
                if value <= X {
                    checkSet.insert(value)
                    if checkSet.count == X {
                        return index
                    }
                }
            }
        }
        
        return -1
    }
}
