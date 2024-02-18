import UIKit

struct Car {
    var make: String
    var year: Int
    var color: String
    
    func startEngine(){
        print("Engine volume 2.4")
    }
    func drive(){
        print("city")
    }
    func park(){
        print("Pasrking slots")
    }
}

struct Person{
    let name: String
    func sayHello(){
        print("Hello there")
    }
}
let person = Person(name: "Jasmine")
print(person.name)
person.sayHello()
