//: [Previous](@previous)

import Foundation

//Assertions allow us to evaluate our code, stating a condition that must be true in order for the app to continue
func assertionTest() -> Bool{
    return true
}

let success = assertionTest()
assert(success == true, "Important operation failed!")

//Assertions only run in debug mode (@autoclosures help with that)

//In case we want for it to run in release mode, the we use precondition()

//: [Next](@next)
