//: [Previous](@previous)

import Foundation
import UIKit

//When calling a function marked with throws, there's three different ways of handling it
//try: Uses a catch block to handle the errors
//try?: You dont need to catch them, but the value turns optional as in case of returning an error it becomes nil
//try!: The application will crash in case of an error

if let saveText = try? String(contentsOfFile: "file.txt") {
    //loadText(saveText)
} else {
    //showFirstRunScreen()
}
//Using coalescing ?? in case of nil
let savedText = (try? String(contentsOfFile: "file.txt")) ?? "No file found"

//"...if you don’t care what the return value is and you just want to make an attempt to do something, try? is for you"

//_ = try? string.write(toFile: somePathHere, atomically: true, encoding: String.Encoding.utf8)
//: [Next](@next)
