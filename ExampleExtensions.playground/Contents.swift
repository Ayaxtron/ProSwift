import UIKit

//Example 1: Squaring Integers

extension Int {
    func squared() -> Int {
        return self * self
    }
}

let i : Int = 8

print(i.squared())

//To make this extension work for other similar data types such as UInt, Int64 we need to make it for Binay Integer instead.

extension BinaryInteger {
    func squared() -> Self { //Capital S: "whatever data type is being used with"
        return self * self
    }
}

//Example 2: Clamping Integers

extension BinaryInteger {
    func clamping(min: Self, max: Self) -> Self {
        if self < min {
            return min
        } else if self > max {
            return max
        }
        return self
    }
}

var a = 5

a.clamping(min: 2, max: 7)
a.clamping(min: 7, max: 17)
a.clamping(min: 2, max: 3)

//Example 3: Matching Value Types

extension Equatable {
    func matches(array: [Self]) -> Bool {
        for item in array {
            if item != self {
                return false
            }
        }
        return true
    }
}

//Example 4: Comparing Arrays

extension Comparable {
    func lessThan (array: [Self]) -> Bool {
        for item in array {
            if self >= item {
                return false
            }
        }
        return true
    }
}

var b = 5.lessThan(array: [6,7,8])
var c = 5.lessThan(array: [5,6,7])
var d = "cat".lessThan(array: ["dog", "fish", "gorilla"])

//Example 5: Rewriting Constrains

extension Collection where Iterator.Element: Equatable {
    func myContains(element: Iterator.Element) -> Bool {
        for item in self {
            if item == element {
                return true
            }
        }
        return false
    }
}

//Example 6: Fuzzy Array Matching

extension Collection where Iterator.Element: Comparable {
    func fuzzyMatches(_ array: Self) -> Bool {
        let sort1 = self.sorted()
        let sort2 = array.sorted()
        return sort1 == sort2
    }
}
var e = [1, 2, 3].fuzzyMatches([1, 2, 3])
var f = [1, 2, 3].fuzzyMatches([3, 2, 1])
var g = [1, 2, 3].fuzzyMatches([1, 2])

//Example 7: Average String Lenght

extension Collection where Iterator.Element == String {
    func averageLength() -> Double {
        var sum = 0
        var count = 0
        
        self.forEach {
            sum += $0.count
            count += 1
        }
        return Double(sum) / Double(count)
    }
}

//Example 8: Counting Integers

extension Collection where Iterator.Element == Int {
    func numberFive() -> Int {
        var count = 0
        for item in self {
            let str = String(item)
            for letter in str {
                if letter == "5" {
                    count += 1
                }
            }
        }
        return count
    }
}

var h = [542,252342,1555,555].numberFive()

//Example 9: De-duping an array

extension Array where Element: Equatable {
    func uniqueValues() -> [Element] {
        var result = [Element]()
        for item in self {
            if !result.contains(item) {
                result.append(item)
            }
        }
        return result
    }
}

//Example 10: Array is Sorted

extension Array where Element: Comparable {
    func isSorted() -> Bool {
        for item in 0...self.count - 2{
            if self[item] > self[item+1] {
                return false
            }
        }
        return true
    }
}

var j = [1, 3, 4].isSorted()
var k = [5, 3, 1].isSorted()
