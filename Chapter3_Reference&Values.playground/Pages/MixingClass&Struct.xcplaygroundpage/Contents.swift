//: [Previous](@previous)

//PersonBox is a class container around the Person Struct, thus creating a reference type

import Foundation

struct Person {
    var name: String
    var age: Int
    var favoriteIceCream: String
}

let taylor = Person(name: "Taylos", age: 21, favoriteIceCream: "Vanilla")

final class PersonBox {
    var person: Person
    
    init(person: Person) {
        self.person = person
    }
}

let box = PersonBox(person: taylor)

final class Container {
    var box: PersonBox!
}

let container1 = Container()
let container2 = Container()

container1.box = box
container2.box = box

print(container1.box.person.name)
print(container2.box.person.name)

box.person.name = "Swift"

print(container1.box.person.name)
print(container2.box.person.name)

//Generic Box Class

final class Box <T> {
    let variable: T
    
    init(variable: T) {
        self.variable = variable
    }
}

class TestContainer<T> { //We asign the person Struct(Class) with this
    var box: Box<Person>!
}

//Boxing and unboxing help optimize Automatic Reference Counting, because then seift only has to check the reference of only the class, intead of each objeject referenced in the struct
//: [Next](@next)
