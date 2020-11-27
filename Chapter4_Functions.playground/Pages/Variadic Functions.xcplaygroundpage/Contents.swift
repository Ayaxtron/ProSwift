//: [Previous](@previous)

import Foundation

//Variadic Functions can take as many parameters as we send

//print() is a variadic function
print("2020 was a very interesting year from beginning to end")
print(1,2,3,4,5,6,7,8,9)

print(1,2,3,4,5,6,7,8,9, separator: ", ", terminator: "!")

func addNumbers(numbers: [Int]) -> Int { //Accepts an array
    var add = 0
    for number in numbers {
        add += number
    }
    return add
}

addNumbers(numbers: [1,2,3,4])

func addNumbersVariadic(numbers: Int...) -> Int { //Accepts any numbers of individual integers
    var add = 0
    for number in numbers {
        add += number
    }
    return add
}

addNumbersVariadic(numbers: 1,2,3,4)

//: [Next](@next)
