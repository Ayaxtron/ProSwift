//: [Previous](@previous)

import Foundation

//CompactMap() does the same as map(), however when the operation has completed, all optionals get unwrapped and anyone with nil is discarded

let songs: [String?] = ["Oxygen", nil, "Dynamite", nil, "Broken Heart"]
let mapResults = songs.map { $0 } //Type [String?]
let compactMapResults = songs.compactMap { $0 } //Optionals gone, nil removed, type [String]
print(compactMapResults)

//Failable Operations
//Ccompact map allow us to take an array, map over its values and turn them to optionals, then compact the resulting array

let scores = ["100", "80", "Fish", "70"]
let compactMapScores = scores.compactMap { Int($0) }
print(compactMapScores)
//Another Example

let files = (1...100).compactMap { try? String(contentsOfFile: "someFile-\($0).text")}
print(files)
//: [Next](@next)
