import Foundation

/*
 // (Stacks and Queues) Nesting
 // https://app.codility.com/programmers/lessons/7-stacks_and_queues/nesting/
 
 A string S consisting of N characters is called properly nested if:

 S is empty;
 S has the form "(U)" where U is a properly nested string;
 S has the form "VW" where V and W are properly nested strings.
 For example, string "(()(())())" is properly nested but string "())" isn't.

 Write a function:

 public func solution(_ S : inout String) -> Int

 that, given a string S consisting of N characters, returns 1 if string S is properly nested and 0 otherwise.

 For example, given S = "(()(())())", the function should return 1 and given S = "())", the function should return 0, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..1,000,000];
 string S is made only of the characters "(" and/or ")".
 
 */

/*
 # 문제 요약
 Brackets와 유사한 문제입니다.
 괄호가 잘 열리고 닫혀있으면 1을, 아니면 0을 반환하는 문제입니다.
 
 # 풀이
 열린 괄호'('를 쌓아두는 stack을 이용해서 풀면 됩니다.
 
 */

public class Nesting {
    
    public class func solution(_ S : String) -> Int {
        var openStack: [Character] = []
        
        for char in S {
            if char == "(" {
                openStack.append(char)
            }
            else if char == ")" {
                if openStack.count > 0 {
                    openStack.removeLast()
                }
                else {
                    return 0
                }
            }
        }
        
        if openStack.count == 0 {
            return 1
        }
        else {
            return 0
        }
    }
}
