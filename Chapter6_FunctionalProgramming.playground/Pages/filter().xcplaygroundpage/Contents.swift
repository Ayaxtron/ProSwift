//: [Previous](@previous)

import Foundation

//filter() will loop over every item of a collection, passing it to a function and if it returns true, the item will be added into a new array

let fibonacciNumbers = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
let evenNumbers = fibonacciNumbers.filter { $0 % 2 == 0} //Only includeeven numbers

//Examples

let names =  ["Michael Jackson", "Michael Jordan", "Michael Caine", "Alejandro Magno", "Gengis Khan"]
let resultTest = names.filter { $0.hasPrefix("Michael")}

let song = ["Dynamite", "Criminal", "Pray"]
let phrase = "I listen to Criminal all the time"
let filter = song.filter { phrase.contains($0)}

//While compact map removes nil and optionality, we can use filter to just remove nil
var values = ["hello", "bye", nil, "sandwich", nil]
var purged = values.filter { $0 != nil }

//: [Next](@next)
