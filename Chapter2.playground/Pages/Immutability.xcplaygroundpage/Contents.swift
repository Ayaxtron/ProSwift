//: [Previous](@previous)

import Foundation

struct PersonStruct {
    var name: String
    var age: Int
}

final class PersonClass {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

//Changing property and value Ok
var person1 = PersonStruct(name: "Will Smith", age: 46)
person1.name = "Keanu Reeves"
person1 = PersonStruct(name: "John Wick", age: 34)

//Changing property and value not Ok
let person2 = PersonStruct(name: "Will Smith", age: 46)
//person2.name("Keanu Reeves")
//person2 = PersonStruct(name: "John Wick", age: 34)

//Changing property and reference Ok
var person3 = PersonClass(name: "Will Smith", age: 46)
person3.name = "Keanu Reeves"
person3 = PersonClass(name: "John Wick", age: 34)

//Changing property Ok but reference not Ok
var person4 = PersonClass(name: "Will Smith", age: 46)
person4.name = "Keanu Reeves"
//person4 = PersonClass(name: "John Wick", age: 34)



//: [Next](@next)
