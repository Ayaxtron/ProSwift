//: [Previous](@previous)

import Foundation

//"Non throwing functions are subtypes of throwing functions"
enum Failure: Error {
    case badNetwork(message: String)
    case broken
}

func fetchRemote() throws -> String {
    throw Failure.badNetwork(message: "Firewall block port")
}

func fetchLocal() -> String {
    return "Taylor"
}

//The closure isn't required to throw, it can but but it doesn't have to
func fetchUserData(using closure: () throws -> String) {
    do {
        let userData = try closure()
        print("User data received: \(userData)")
    } catch Failure.badNetwork(let message) {
        print("Message")
    } catch {
        print("Fetch error")
    }
}

//If we want to use error propagation with the throwing closure parameter
func fetchUserData2(using closure: () throws -> String) rethrows {
    let userData = try closure()
    print("User data received: \(userData)")
}
//Rethrows allow us to check individually if we need the try-catch statement or not
do {
    try fetchUserData2(using: fetchRemote)
} catch Failure.badNetwork(let message) {
    print(message)
} catch {
    print("fetchUserData(using: fetchLocal)")
}

fetchUserData2(using: fetchLocal)
//: [Next](@next)
