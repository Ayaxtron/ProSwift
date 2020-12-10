//: [Previous](@previous)

import Foundation

let numbers = Array(1...10000)
let lazyFilter = numbers.lazy.filter { $0 % 2 == 0}
let lazyMap = numbers.lazy.map { $0 * 2}

print(lazyFilter.count)
print(lazyMap.count)
print(lazyFilter[5000])
print(lazyMap[5000])

//: [Next](@next)
