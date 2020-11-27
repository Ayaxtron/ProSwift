
import UIKit
import Foundation

typealias name = (name: String, surname: String)

func marriedCouple (man: name, woman: name) -> (man: name, woman: name) {
    return (man, (woman.name, man.surname))
}

var father = (name: "Jason", surname: "Black")
var mother = (name: "Marie", surmane: "Blue")


struct deque <T> {
    
    var array = [T]()
    
    mutating func pushBack(_ opt: T) {
        array.append(opt)
    }
    
    mutating func pushFront(_ opt: T) {
        array.insert(opt, at: 0)
    }
    
    mutating func popFront() -> T? {
        return array.popLast()
    }
    
    mutating func popFirst() -> T? {
        if array.isEmpty {
            return nil
        }else{
            return array.removeFirst()
        }
    }
}

var test = deque<Int>()

test.pushBack(5)
test.pushFront(2)
test.popFront()
test.popFirst()


struct TestCountedSet <T: Any> {
    
    var set = NSCountedSet()
    
    mutating func add(_ to: T) {
        set.add(to)
    }
    
    mutating func remove(_ to: T) {
        set.remove(to)
    }
    
    mutating func count(for to: String) -> Int {
        return set.count(for: to)
    }
}

var setTest = TestCountedSet<String>()

setTest.add("Hola")
setTest.add("Hola")
setTest.count(for: "Hola")
