import Foundation

// grouping, by
// Array 내 객체들을 by조건으로 Grouping된 Dictionary를 생성합니다.

let students = ["Kofi", "Abena", "Efua", "Kweku", "Akosua"]
let studentsByLetter = Dictionary(grouping: students, by: { $0.first! })
print(studentsByLetter)
