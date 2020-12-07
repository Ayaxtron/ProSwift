//: [Previous](@previous)

import Foundation
import UIKit

//The joined() method joins two arrays into one [1, 2] [3, 4] = [1, 2, 3, 4]
//flatMap() is the combination of using map() and joined() in a single class in that order
//This operations are the same:
/*
someArray.flatMap(transformFunction)
Array(someArray.map(transformFunciont).joined())
 */

//flatMap() can also use optionals, whoever the difference being that when returning an optional, flatMap() will combine that optional with the existing one. Map() on the other hand will just keep both.

let stringNumber: String? = "8" //Optional 1
let intNumber = stringNumber.map { Int($0)} // Optional 2
//intNumber is an Int?? - optional optional integer

let flatIntNumber = stringNumber.flatMap { Int($0)} // Combines both optionals
//flatIntNumber is an Int?
//: [Next](@next)
