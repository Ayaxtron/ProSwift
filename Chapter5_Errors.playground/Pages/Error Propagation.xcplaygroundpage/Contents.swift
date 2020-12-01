//: [Previous](@previous)

import Foundation

//Considerin a case where funcition A calls B, and B call C but C throws and error. Who should handle the error?
enum PasswordError: Error {
    case empty
    case short
    case obvious
}

//First option, where A is oblivious to any error below it
func functionA() {
     functionB()
}
func functionB() {
    do {
        try functionC()
    } catch {
        print("Error")
    }
}



//The second option (ERROR PROPAGATON) is letting the errors bubble upwards

func functionA2() {
    do {
        try functionB2()
    } catch {
        print("Error")
    }
}
func functionB2() throws {
    try functionC() // This is okay as long as the function is marked as throws
}

//The third option is to let the function handle the error that seem more appropiate
func functionA3() {
    do {
        try functionB3()
    } catch {
        print("Error")
    }
}

func functionB3() throws {
    do {
        try functionC()
    } catch PasswordError.empty{
        print("Empty Password")
    }
        
}

func functionC() throws {
    throw PasswordError.short
}

//At some point there need to be a generic catch all statement
//: [Next](@next)
