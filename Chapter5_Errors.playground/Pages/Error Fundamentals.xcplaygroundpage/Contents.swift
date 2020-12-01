import UIKit

//All errors thrown must be an enum and comform to the Error protocol
enum PasswordError: Error {
    case empty
    case short(minChars: Int)
    case obvious(message: String)
}

//One must add throw before the return type to allow the function/method to return an error
func encrypt(_ str: String, with password: String) throws -> String {
    if password == "Rafael" {
        throw PasswordError.obvious(message: "Thats my friend's name")
    }
    
    let encrypted = password + str + password
    return String(encrypted.reversed())
}

do{
    let encrypted = try encrypt("Welcome", with: "A13x1s")
    print(encrypted)
} catch PasswordError.empty {
    print("You must provide a password")
} catch PasswordError.short(let minChars) where minChars < 5 {
    print("Password too short")
}catch PasswordError.obvious(let message) {
    print("Password Obvious: \(message)")
} catch {
    print("Error")
}
