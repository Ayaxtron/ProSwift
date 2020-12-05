//: [Previous](@previous)

import Foundation

//A Never function will never return/come back, Void returns nothing but still returns

//FatalError(), which will terminate the app in case of an error, uses the Never return type

class ExampleClass: NSObject {
    
}

func makeObject() -> NSObject {
    return ExampleClass()
}

func testObject() -> NSObject {
    let obj = makeObject()
    guard let customObj = obj as? ExampleClass else { return obj }
    
    return customObj
}

func testObject2() -> NSObject {
    guard let obj = makeObject() as? ExampleClass else { fatalError() }

    return obj
}

//Using fatalError() means it needs to work or failure is not an option
//: [Next](@next)

