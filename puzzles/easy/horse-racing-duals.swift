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

let N = Int(readLine()!)!
var P = [Int]()
var result = 10000000

if N > 0 {
    for i in 0 ... (N - 1) {
        let pi = Int(readLine()!)!
        P.append(pi)
    }

    P.sort()

    var index = 1

    while index < N, result != 0 {
        let previous = P[index - 1]
        let actual = P[index]
        let diff = actual - previous

        result = min(result, diff)

        index += 1
    }
}

// Write an answer using print("message...")
// To debug: print("Debug messages...", to: &errStream)

print(result)
