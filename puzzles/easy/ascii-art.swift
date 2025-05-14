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

let L = Int(readLine()!)!
let H = Int(readLine()!)!
let T = readLine()!.uppercased()

var result = ""
var rows = [String]()
if H > 0 {
    for i in 0...(H - 1) {
        let ROW = readLine()!
        rows.append(ROW)
    }

    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ?"
    var reference = ""
    for item in alphabet {
        reference += String(repeating: item, count: L)
    }

    for row in rows {
        var resultRow = ""

        for character in T {
            if let start = reference.firstIndex(of: character) ?? reference.firstIndex(of: "?"),
               let end = reference.lastIndex(of: character) ?? reference.lastIndex(of: "?") {
                resultRow += row[start...end]
            }
        }

        result += "\(resultRow)\n"
    }
}

// Write an answer using print("message...")
// To debug: print("Debug messages...", to: &errStream)

print(result)
