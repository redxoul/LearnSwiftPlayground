import Foundation

/*
 // (Stacks and Queues) Brackets
 // https://app.codility.com/programmers/lessons/7-stacks_and_queues/brackets/
 
 A string S consisting of N characters is considered to be properly nested if any of the following conditions is true:

 S is empty;
 S has the form "(U)" or "[U]" or "{U}" where U is a properly nested string;
 S has the form "VW" where V and W are properly nested strings.
 For example, the string "{[()()]}" is properly nested but "([)()]" is not.

 Write a function:

 public func solution(_ S : inout String) -> Int

 that, given a string S consisting of N characters, returns 1 if S is properly nested and 0 otherwise.

 For example, given S = "{[()()]}", the function should return 1 and given S = "([)()]", the function should return 0, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..200,000];
 string S is made only of the following characters: "(", "{", "[", "]", "}" and/or ")".
 
 */

/*
 # 문제 요약
 {}, [], ()같은 기호로 이루어진 문자열S가 들어오면
 (코드에서 처럼)해당 문자가 잘 열리고 닫혔는지 확인해서 맞으면 1, 아니면 0을 반환하는 문제입니다.
 
 # 풀이
 Stack을 이용해서 풀면 쉽게 풀립니다.
 
 */

public class Brackets {
    
    public class func solution(_ S : String) -> Int {
        let sArray = Array(S)
        var stack:Array<Character> = []
        let setDic = ["(":")", "[":"]", "{":"}"]
        
        for value in sArray {
            switch value {
            case "{", "[", "(":
                stack.append(value)
            case "}", "]", ")":
                if stack.count > 0 && setDic["\(stack.last!)"] == String(value) {
                    stack.removeLast()
                }
                else {
                    return 0
                }
            default:
                continue
            }
        }
        
        if stack.count == 0 {
            return 1
        }
        else {
            return 0
        }
    }
}
