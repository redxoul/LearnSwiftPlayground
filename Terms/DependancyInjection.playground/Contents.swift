import Foundation

// 의존성 주입 Dependancy Injection
// https://www.youtube.com/watch?v=-n8allUvhw8
// 'Dependancy Injection is a 25-dollar term for a 5-cent concept' - James Shore
// 우리는 '의존성을 생성하는 책임을 객체에 부여하는 대신 객체에 의존성을 주입하는 것에 불과하다'는 사실을 깨닫지 못한 채 이미 종속성 주입을 사용하고 있다.


// 의존성이란?
// 예를 들어 아래와 같은 경우
class A {
    let b = B() // 'A클래스는 B클래스에 의존성을 갖는다'
}

class B {
    
}

// 객체 인스턴스를 사용하는 곳(A)을 '클라이언트(Client)'라고 부릅니다.
// '의존성(a dependancy)'은 사용되는 객체 인스턴스(B)를 말합니다.
// 의존하는 대상 B가 변하면, 그것이 A에 영향을 미치게 되는 관계입니다.

// 의존성 주입이란?
// 아래처럼 의존성을 갖는 대상 객체 인스턴스를 외부로부터 생성하여 전달받는 것(주입)을 '의존성 주입'이라고 합니다.

class C {
    let b: B
    
    init(b: B) {
        self.b = b
    }
}

// 의존성 방향
// 위와 같은 케이스는
// [A]->[B], [C]->[B] 와 같이 의존성 방향이 생깁니다.

class Moving {
    func walking() {
        print("🚶🏻👣👣👣👣")
    }
    
    func running() {
        print("🏃🏻‍♂️💨💨💨💨")
    }
}

// Human클래스는 Moving클래스에 의존적
// [Human]->[Moving]
class Human {
    let moving: Moving
    
    init(move: Moving) {
        self.moving = move
    }
    
    func walking() {
        moving.walking()
    }
    
    func running() {
        moving.running()
    }
}

/*
 이 상태에서 Moving을 Human이 아닌 다른 동물에도 적용을 하고 싶어지면?
 혹은 여러가지 방법으로 걷고, 뛰는 Human을 원하게 되면?
 위와 같은 일반적인 의존성 관계로는 유연하게 변화를 주기가 어렵습니다.
 -> 변화에 취약합니다.

 의존관계 역전의 법칙(DIP, Dependancy Inversion Principle)
 : '추상화된 것은 구체적인 것에 의존하면 안되고, 구체적인 것이 추상화된 것에 의존해야 한다'는 법칙
 위 예시들이 변화에 취약했던 이유는 '구체적인 것'에 의존했기 때문입니다.

 Swift에서는 protocol을 이용하여 구체적인 객체(class, struct)가 추상화된 대상(protocol)에 의존하도록 만들 수 있습니다.
 */

protocol MovingMethod {
    func walking()
    func running()
}

class HumanMoving: MovingMethod {
    func walking() {
        print("🚶🏻👣👣👣👣")
    }
    
    func running() {
        print("🏃🏻‍♂️💨💨💨💨")
    }
}

class HumanMoving2: MovingMethod {
    func walking() {
        print("🧑🏻‍🦯👣👣👣👣")
    }
    
    func running() {
        print("🧑🏻‍🦽💨💨💨💨")
    }
}

class NewHuman {
    var moving: MovingMethod
    
    init(move: MovingMethod) {
        self.moving = move
    }
    
    func walking() {
        moving.walking()
    }
    
    func running() {
        moving.running()
    }
}

let human = NewHuman(move: HumanMoving())
human.walking()
human.running()
// 위와 같이 작성이 되면 Human은 다양한 방법으로 Moving을 할 수 있게 되었습니다.

human.moving = HumanMoving2()
human.walking()
human.running()
// 앱이 동작하는 중에도 얼마든지 새로운 Moving을 주입해서 다른 동작을 할 수 있도록 유연해지게 되었습니다.

/*
 의존관계 방향이
 기존의 [Human]->[Moving] 이었던 것이
 [NewHuman]->[(Protocol)MovingMethod]<-[HumanMoving] 으로 된 것을 알 수 있습니다.
 구체적인 것(NewHuman, HumanMoving)이 추상화된 것(MovingMethod)에 의존하는 방향이 되었습니다.
 이렇게 의존성 방향을 바꿔주어 좀 더 유연한 코드가 되도록 만들어주는 것이 '의존성 역전(Dependancy Inversion)'이라고 부릅니다.
 */

// Moving은 다른 동물에도 사용할 수 있게 되었습니다.
class CatMoving: MovingMethod {
    func walking() {
        print("🐈🐾🐾🐾🐾")
    }
    
    func running() {
        print("🐈💨💨💨💨")
    }
}

class Cat {
    let moving: MovingMethod
    
    init(move: MovingMethod) {
        self.moving = move
    }
    
    func walking() {
        moving.walking()
    }
    
    func running() {
        moving.running()
    }
}

let cat = Cat(move: CatMoving())
cat.walking()
cat.running()

/*
 의존성 주입 방법들

 (1) Constructor Injection
 : 생성자에서 주입을 받기 때문에 이라고 부릅니다.
 - 주입받을 객체의 property를 private let으로 선언함하면 초기화 후 의존성에 의한 동작이 일관성 있도록 통제할 수 있습니다.
 - 소스를 작성할 때 클라이언트 초기화 시 '어떤 의존성을 가지고 있는지 명확하게 알려주는 장점'이 있습니다.

 (2) Property Injection, Method Injection
 : property나 Method를 통해 주입하는 방법입니다.
 - 클라이언트 생성 이후 주입함으로써 원하는 동작을 하도록 변경시켜 줄 수 있습니다.
 - 우리가 DateFormatter를 사용 시 dateFormat을 세팅해주는 패턴과 같은 예시가 있습니다.
 - 이는 클라이언트를 사용할 때 개발자가 의존성 주입을 잊지 말아야 의도한 대로 동작하게 할 수 있습니다.
 */
 
// (3) Interface Injection
// 의존성 주입의 역할을 protocol로 추상화하는 방법입니다.
protocol MovingDependant {
    func setMoving(_ move: HumanMoving)
}

class NewHuman2: MovingDependant {
    var moving: HumanMoving
    
    init(move: HumanMoving) {
        self.moving = move
    }
    
    func walking() {
        moving.walking()
    }
    
    func running() {
        moving.running()
    }
    
    func setMoving(_ move: HumanMoving) {
        self.moving = move
    }
}

let human3 = NewHuman2(move: HumanMoving())
human3.walking() // 🚶🏻👣👣👣👣
human3.running() // 🏃🏻‍♂️💨💨💨💨

human3.setMoving(HumanMoving())
human3.walking() // 🚶🏻👣👣👣👣
human3.running() // 🏃🏻‍♂️💨💨💨💨



// 의존성 주입으로 얻을 수 있는 것?
// 유닛테스트를 할 때, 테스트가 용이할 수 있습니다.
// 아래와 같이 Request를 통해 어떤 데이터를 받아오는 작업이 있을 때,
protocol Serializer {
    func serialize(data: Any) -> Data?
}

class RequestSerializer: Serializer {
    func serialize(data: Any) -> Data? {
        // implement
        return nil
    }
}

class DataManager {
    var serializer: Serializer
    
    init(serializer: Serializer) {
        self.serializer = serializer
    }
}

// RequestSerializer 대신 Mock 객체를 대신 주입하여 테스팅을 쉽게 할 수 있습니다..

class MockSerializer: Serializer {
    func serialize(data: Any) -> Data? {
        return Data(base64Encoded: "Mock Data")
    }
}

/*
 클라이언트(DataManager, Human)의 수정없이 쉽게 다른 형태의 클라이언트를 만들 수 있게 됩니다.
 주입시켜 주는 의존성(Serializer, Moving)에 따라서 클라이언트 함수(serialize(data:)->Data, walking(), running())가 다르게 동작하도록 만들어줄 수 있습니다.
 의존성 객체의 생성과정이 바뀌더라도 클라이언트 코드에 영향을 주지 않아 코드 재사용성을 높여줍니다.
  
 클라이언트는 protocol 인터페이스로만 객체를 알고 있음으로써 보다 나은 설계를 할 수 있게 됩니다.
 추상화가 더 쉬워지며, 모듈별 의존성을 떼어내는데 용의 해집니다.
  
 의존성 주입은 Singleton의 필요성을 줄이는 좋은 패턴입니다. Singleton은 가능한 피하는 것이 좋습니다.
 Singleton은 결합도를 증가시키지만 의존성 주입은 결합도를 낮춰줍니다.
 (회사에서 모듈을 떼어내는 작업을 하는데 싱글턴들로 인해 곤란했던 적이 있네요)
 의존성 주입을 통해 해당 객체가 어떤 의존성을 갖는지 파악하기 쉬우며 책임 또한 알 수 있게 해 주어 복잡한 프로젝트를 파악하는데 도움을 줄 수도 있습니다.


 (번외) 의존성 주입을 위해 프레임워크(IoC Container)를 쓰는 이유?
 의존성 주입을 위해 Injector를 사용. 여기서는 앱에서 발생하는 모든 의존성을 정의함.
 의존성 주입 과정에서 많은 양의 보일러 플레이트 코드가 필요함.
 Injector 클래스를 유지보수하는 것은 프로젝트가 커지면 커질수록 힘듦
 앱 빌드 설정에 따라(개발, 운영, 테스트 등) 다른 종류의 Injector를 구현하는 것은 상당히 많은 양의 코드 중복을 만듦

 DI 프레임워크가 없으면, Injector클래스가 역설적으로 확장을 어렵게 만들수가 있음 -> 분리가 어렵기 때문
 DI 프레임워크들은 모듈화를 쉽게 해줌
 DI 프레임워크는 보통 의존성 정의를 위한 여러 단계의 계층을 제공 -> 의존성 정의를 쉽게 유지보수하고 더 작은 단위로 쪼갤 수도 있음.
 
 */
