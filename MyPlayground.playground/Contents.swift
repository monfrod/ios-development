import Foundation
import UIKit

class studentClass {
    var name: String
    var age: Int
    var job: String?
    var Hobby: String?
    
    init(name: String, age: Int, job: String? = nil, Hobby: String? = nil){
        self.name = name
        self.age = age
        self.job = job
        self.Hobby = Hobby
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
struct studentStruct{
    var name: String
    var age: Int
    
}
var ststruct = studentStruct(name: "Alex", age: 22)
ststruct.name = "Allo"
func AddOneYear(student: studentClass){
    student.age +=1
}
func AddOneYear(student: studentStruct){
    student.age +=1
}
let student1 = studentClass(name: "Ismail", age: 19)
let student2 = studentClass(name: "Rasul", age: 19, job: "Razdacha", Hobby: "exat pavlodar")

let student3 = student2

student3.age = 20



print(student2)
print(student3)
