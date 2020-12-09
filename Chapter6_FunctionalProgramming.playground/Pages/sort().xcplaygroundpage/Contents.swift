//: [Previous](@previous)

import Foundation

//Primitive data types can be easily sorted using sorted(), but when having a complex data type as struct we want a custom sort order
let scoresTeam = ["100", "74", "98"]
let sortedScores = scoresTeam.sorted() //Because we are sorting strings, the elements are sorted by charactes which is not what we want
print(sortedScores)

//A solution would be converting to Int and using compactMap(), but we cal also use sort
var sortedScores2 = scoresTeam.sorted {
    if let first = Int ($0), let second = Int ($1) {
        return first < second
    } else {
        return false
    }
}
print(sortedScores2)

//Sorting complex data
struct Person : Comparable{ //This is the best solution
    var name: String
    var age: Int
    
    static func <(lhs: Person, rhs: Person) -> Bool {// We have to add the logic as function
        return lhs.name < rhs.name
    }
    
    static func ??(lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
}
let Jhon = Person(name: "Jhon", age: 32)
let Alex = Person(name: "Alex", age: 41)
let Steve = Person(name: "Steve", age: 23)
let people = [Jhon, Alex, Steve]

//A way to solve it is to just use the sorted method
let sortPeople = people.sorted { $0.name < $1.name }

//Another solution and the most recommended is comforming to the comparable protocol
//Once the comparable protocol has been implemented, we can call sorted() without any parameters
let sortPeople2 = people.sorted()

//Reverse Sorting
//It's just a matter fo changing < and > when writting our own code
let sortedString = scoresTeam.sorted {
    if let first = Int ($0), let second = Int ($1) {
        return first > second
    } else {
        return false
    }
}

let sorted = scoresTeam.sorted().reversed()//Prints different because the array is a value type
print(sorted)

//We would need to turn it into an array
//let sorted = Array(scoresTeam.sorted().reversed())
//: [Next](@next)
