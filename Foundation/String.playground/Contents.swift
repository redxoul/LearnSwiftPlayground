import Foundation

// String(_ value: T, radix: Int = 10, uppercase: Bool = false)
// 입력한 value를 N진수로 변환해줍니다.

String(10, radix: 2) // 1010
String(999999, radix: 16) // f423f
String(999999, radix: 16, uppercase: true) // F423F


// 여러줄 문자
// 여러줄의 문자열을 사용하고 싶은 경우 큰 따옴표 3개“””로 묶어서 사용합니다.

let quotation = """
The White Rabbit put on his spectacles. "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
//print(quotation)

// 아래 값들은 같은 값
let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""

// 들여쓰기 기준은 끝나는 지점의 """의 위치부터
let lineWithIndentation = """
    The White Rabbit put on his spectacles.
        "Where shall I begin, please your Majesty?"
    he asked.
        "Begin at the beginning,"
    the King said gravely,
        "and go ontill you come to the end; then stop."
    """
print(lineWithIndentation)
