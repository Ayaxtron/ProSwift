//: [Previous](@previous)

import Foundation

//Precedenec from Swift Standard Library
precedencegroup AdditionPrecedence {
    associativity: left
    higherThan: RangeFormationPrecedence
}

infix operator + : AdditionPrecedence

//This is how Swift Precedence is ordered
//First MultiplicationPrecedence: * / %
//Second AdditionPrecedence: + - |s
//This RangeFormationPrecedence: ... and ><

infix operator * : RangeFormationPrecedence //Rewrites the * operator, infix means it's used  between two values

let i = 5 * 10 + 1

//The Associativity also comes into play
precedencegroup MultiplicationPrecedence {
    associativity: right
higherThan: RangeFormationPrecedence
}

//Modify * so it can multiply arrays of integers
func * (lhs: [Int], rhs: [Int]) -> [Int] {
    guard lhs.count == rhs.count else {
        return lhs
    }
    
    var value = [Int]()
    for (index, num) in lhs.enumerated(){
        value.append(num * rhs[index])
    }
    return value
}

//Creating the operator ** to raise a value to the power of another

precedencegroup ExponentiationPrecedence{
    associativity: right
    higherThan: MultiplicationPrecedence
}

infix operator **: ExponentiationPrecedence

func ** (lhs: Double, rhs: Double) -> Double {
    return pow(lhs, rhs)
}

let test = 2 ** 4 ** 2

//Modifying ... so that we can use it twice 2...4...1 and get [2,3,4,3,2,1]
//Comment the code above, except the import, to make it work
 /*
precedencegroup RangeFormationPrecedence{
    associativity: left
    higherThan: CastingPrecedence
}

infix operator ...: RangeFormationPrecedence

func ... (lhs: CountableClosedRange<Int>, rhs: Int) -> [Int] {
    let test = (rhs ..< lhs.upperBound).reversed()
    return Array(lhs) + test
}

let range = 1...7...3
print(range)
*/
//: [Next](@next)
