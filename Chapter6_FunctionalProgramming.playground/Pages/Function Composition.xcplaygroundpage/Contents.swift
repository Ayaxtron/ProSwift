//: [Previous](@previous)

import Foundation

//Important to use higher-order functions and make them as pure as possible.
//Chaining is very important and commonly used
let london = (name: "London", continent: "Europe", population: 12_383_193)
let tokyo = (name: "Tokyo", continent: "Asia", population: 8_433_751)
let cdmx = (name: "Mexico City", continent: "America", population: 18_830_831)
let beijing = (name: "Beijing", continent: "Asia", population: 16_932_301)

let cities = [london, tokyo, cdmx, beijing]

let population = cities.reduce(0) { $0 + $1.population }
//For only the population in europe
let europe = cities.filter { $0.continent == "Europe"}.reduce(0) { $0 + $1.population}
//Formatted informatino of biggest cities
let biggerCities = cities.filter { $0.population > 2_000_000 }.sorted { $0.population > $1.population }.prefix(upTo: 3).map { "\($0.name) is a big city with a population of \($0.population)" }.joined(separator: "\n")
print(biggerCities)

//Functinoal Building Blocks
//In order to combine functions, it coule be done by this,
//let foo = functionC(functionB(functionA()))
//However, a more readable way is using operator overloading:
//let foo = functionA >>> functionB >>> functionC
precedencegroup CompositionPrecedence {
    associativity: left
}

infix operator >>>: CompositionPrecedence

func >>> <T, U, V>(lhs: @escaping (T) -> U, rhs: @escaping (U) -> V) -> (T) -> V {
    return { rhs(lhs($0)) }
}
//Example
func generateRandomNumber(max: Int) -> Int {
    let number = Int(arc4random_uniform(UInt32(max)))
    print("Using number: \(number)")
    return number
}
func calculateFactors(number: Int) -> [Int] {
    return (1...number).filter { number % $0 == 0 }
}
func reduceToString(numbers: [Int]) -> String {
    return numbers.reduce("Factors: ") { $0 + String($1) + " " }
}

let combined = generateRandomNumber >>> calculateFactors >>> reduceToString
print(combined(100))
//: [Next](@next)
