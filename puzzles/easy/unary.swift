import Foundation
import Glibc

public struct StderrOutputStream: TextOutputStream {
    public mutating func write(_ string: String) { fputs(string, stderr) }
}

public var errStream = StderrOutputStream()

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

let input = readLine()!

// Write an answer using print("message...")
// To debug: print("Debug messages...", to: &errStream)

var binaryResult = ""
for character in input {
    binaryResult += binaryRepresentation(from: character)
}

print(unaryRepresentation(from: binaryResult))

func binaryRepresentation(from character: String.Element) -> String {
    guard let asciiValue = character.asciiValue else {
        return ""
    }

    let binary = String(asciiValue, radix: 2)

    return String(repeating: "0", count: 7 - binary.count) + binary
}

func unaryRepresentation(from binary: String) -> String {
    guard var lastCharacter = binary.first else {
        return ""
    }
    var count = 0
    var result = ""

    let build = {
        if !result.isEmpty {
            result += " "
        }
        result += "\(lastCharacter == "1" ? "0" : "00") "
        result += String(repeating: "0", count: count)
    }

    for character in binary {
        if character != lastCharacter {
            build()

            count = 1
            lastCharacter = character
        } else {
            count += 1
        }
    }

    build()

    return result
}
