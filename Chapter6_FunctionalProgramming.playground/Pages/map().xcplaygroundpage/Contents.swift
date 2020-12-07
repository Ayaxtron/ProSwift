import Foundation
import UIKit

//When writing functions that produce predictable output, we can test them
//When using immutable value types instead of reference, we remove dependencies in our app
//When programming small functions, which can be reused and combined with higher order functoins, we can build a powerful app  with many small  pieces

//takes a value out of a container, applies a function to it, then puts the result of that function back into a new container that gets returned to you
func lenghtOf(strings: [String]) -> [Int] {
    var result = [Int]()
    for words in strings {
        result.append(words.count)
    }
    
    return result
}

func lenghtOfMap(strings: [String]) -> [Int] {
    return strings.map{ $0.count } //Using map our intention is clearer to the compiler and others
}

//Examples using map()

let fruits = ["hola", "adios", "saludos"]
let upperFruits = fruits.map { $0.uppercased() }

let scores = [100, 90, 80]
let formattedScores = scores.map { "Your score was \($0)" }

let grades = [100, 70, 90]
let pass = grades.map { $0 > 85 ? "Pass" : "Fail"}

let position = [34, 54, 64]
let results = position.map { 45...55 ~= $0 ? "Average" : "Not average"}

let numbers: [Double] = [4, 5, 64, 23]
let result = numbers.map(sqrt)

//If you give map() an array[a, b, c] and a function f(), Swift will return [f(a), f(b), f(c)]

//Optional Mapping
let i: Int? = 10
let j = i.map { $0 * 2 } // If i was nil, map() would just return nil
print(j)

func fetchUserName(id: Int) -> String? {
    if id == 1989 {
        return "John Wick"
    } else {
        return nil
    }
}

var username: String? = fetchUserName(id: 1989)
let formattedUserName = username.map { "Welcome, \($0)" } ?? "Unknown user"
print(formattedUserName)

//forEach()
//map() returns a new array, while forEach() returns nothing as it just loopsover each item

["Will", "Smith", "Marcus"].forEach { print($0) }  //Baically a for-in loop
