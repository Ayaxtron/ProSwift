//: [Previous](@previous)

import Foundation


//Closures are a reference type and first-class data type
//When passing a closure into a function as a parameter

let closure = { (name: String) in    //name is a parameter
    print("I'm a closure named \(name)")
}

func someClosure(_ test: (String) -> Void) {// We have to specify the closures param and return value
    test("John")
}

someClosure(closure)
closure("Taylor") //Can also be called as a function

//Closures are able to capture data, that's how they can modify the original values to the reference

func testCapture() -> () -> Void { //It returns a closure that accepts no param and returns nothing
    
    var counter = 0
    return {
        counter += 1
        print("Counter is now \(counter)")
    }
}

let greetPerson = testCapture()
greetPerson()
greetPerson()
greetPerson()
let greetCopy = greetPerson
greetCopy()
greetPerson()
greetCopy()

//Filters an array so we end up with an array with only Michael
let names = ["Michael Jackson", "Taylor Swift", "Michael Caine", "Adele Adkins", "Michael Jordan"]

let result1 = names.filter{ name in //Swift knows it receives a String and returns a boolean so it can be simplified
    name.hasPrefix("Michael")//As we only have one line, Swift already knows it has to return a value se we can remove the return keyword
}

//This can be simplified using shorthand names, which are the anonimour arguments $0, $1, etc.
let result2 = names.filter{ $0.hasPrefix("Michael")}

print(result1)

//Closures and functions
let words = ["1989", "Fearless", "Red"]
let input = "My favorite album is Fearless"
/*
words.contains { (str) -> Bool in
return true
}
*/
words.contains(where: input.contains)

//Will apply the function to every item on the array, starting with the given value
let numbers = [1, 3, 5, 7, 9]
/*
numbers.reduce(0) { (int1, int2) -> Int in //int1 is the previous value and int2 the current one
return int1 + int2
}
 */
let results = numbers.reduce(0, +) //As + is already a function that accepts two param an returns one

//Escaping closures
//When passing a closure into a function, Swift considers it non-escaping by default. Unless we specify with the @escaping keyword
var queuedClosures: [() -> Void] = [] //Initialice an array of closures

func queueClosure(_ closure: @escaping () -> Void) { //Add the closures to the array
    queuedClosures.append(closure)
}

func execQueuedClosures() {//Loop and execute each closure
    for closure in queuedClosures {
        closure()
    }
}

queueClosure({print("Running closure 1")})
queueClosure({print("Running closure 1")})
queueClosure({print("Running closure 1")})

execQueuedClosures()

//@autoclosure is used in the same way, however it creates a closure from an expression u pass in
func printTest(_ result: @autoclosure () -> Void) {
    print("Before")
    result()
    print("After")
}
printTest(print("Hello"))//This line turns to a closure in the function printTest({ print("Hello") })
//: [Next](@next)
