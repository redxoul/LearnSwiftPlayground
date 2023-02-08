import Foundation

/*
 [Key-value Observing = KVO]
 Key-value Observing은 다른 객체의 property 변경에 대해 객체에 알리는 데 사용하는 코코아 프로그래밍 패턴입니다.
 Model과 View 사이와 같이 앱의 논리적으로 분리된 부분 사이의 변경 사항을 전달하는 데 유용합니다.
 NSObject를 상속받은 클래스에서만 Key-value Observing을 사용할 수 있습니다.
 */

// [1] Key-value Observing을 위해 property 앞에 '@objc dynamic'을 붙여주어야 합니다.
// 관찰할 대상을 포함한 클래스는 NSObject를 상속받아야 합니다.
 
class Almond: NSObject { // NSObject를 상속받아야 함
    @objc dynamic var name: String // 관찰할 대상
    
    init(name: String) {
        self.name = name
    }
}

var almond = Almond(name: "HoneyButter")
almond.observe(\.name, options: [.initial, .old, .new, .prior]) { object, change in // .initial 옵션일 땐 observe하자마자 newValue로 초기값을 받아옴
    print("old almond: \(change.oldValue)")
    print("new almond: \(change.newValue)")
    print("- - - - - - - - -")
}

almond.name = "Wasabi"

// options에 prior를 포함하면
var almond2 = Almond(name: "Corn")
almond2.observe(\.name, options: [.old, .new, .prior]) { object, change in
    print("old almond" + (change.isPrior ? "(prior): " : ": ") + "\(change.oldValue)")
    print("new almond" + (change.isPrior ? "(prior): " : ": ") + "\(change.newValue)")
    print("- - - - - - - - -")
}

// 변경했을 때, 변경되는 과정(newValue->oldValue)까지 전달받게 됩니다.
almond2.name = "galic"
almond2.name = "MintChoco"
