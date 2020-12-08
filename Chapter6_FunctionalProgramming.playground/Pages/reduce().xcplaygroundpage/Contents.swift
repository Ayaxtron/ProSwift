//: [Previous](@previous)

import Foundation

//reduce() condences an array into a single value
//Each time the function is calles, it passes the previous value from the function adn the next item of the array.
let scores = [100, 90, 85]
let sum = scores.reduce(0, + ) //0 is the initial value

let results = scores.reduce("") { $0 + String($1)} //Take the current String, and add the current integer
print(results)

let names = ["Taylor", "Paul", "Adele"]
let count = names.reduce("") { $0 + $1 }
print(count.count)

//Reducing to a Boolean
let longNames = names.reduce(true) { $0 && $1.count >= 4}//Check all names are longer than 4
print(longNames)

//The allSatisfy() method will return false as soon as any item fails
let longNames2 = names.allSatisfy { $0.count > 4 }

//Reducing to find a value
//The next code finds the longest name in an array
let names2 = ["Taylor", "Paul", "Adele"]
let longest = names2.reduce("") { $1.count > $0.count ? $1 : $0 }

//or we could just use max()
let longest2 = names2.max { $1.count > $0.count }

//Reducing Multi-Dimensional Array
let numbers = [
[1, 1, 2],
[3, 5, 8],
[13, 21, 34]
]
let flattened: [Int] = numbers.reduce([]) { $0 + $1 }
print(flattened)

//We can even use compactMap or joined
let flattened2 = numbers.compactMap { $0 } 
print(flattened2)
let flattened3 = Array(numbers.joined())
print(flattened3)
//: [Next](@next)
