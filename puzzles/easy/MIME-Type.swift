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

let N = Int(readLine()!)! // Number of elements which make up the association table.
let Q = Int(readLine()!)! // Number Q of file names to be analyzed.

var mimeTypes = [String: String]()
var filenames = [String]()

let unknown = "UNKNOWN"

if N > 0 {
    for i in 0...(N-1) {
        let inputs = (readLine()!).split(separator: " ").map(String.init)
        let EXT = inputs[0] // file extension
        let MT = inputs[1] // MIME type.
        mimeTypes[EXT.lowercased()] = MT
    }
}

if Q > 0 {
    for i in 0...(Q-1) {
        let FNAME = readLine()! // One file name per line.
        filenames.append(FNAME.lowercased())
    }
}

print("Filenames = \(filenames)", to: &errStream)
print("MIME Types = \(mimeTypes)", to: &errStream)

// Write an answer using print("message...")
// To debug: print("Debug messages...", to: &errStream)

// For each of the Q filenames, display on a line the corresponding MIME type. If there is no corresponding type, then display UNKNOWN.
for filename in filenames {
    print("--- filename = \(filename)", to: &errStream)

    let splitted = filename.split(separator: ".", omittingEmptySubsequences: false)
    if splitted.count > 1,
       let ext = splitted.last {
        print(mimeTypes["\(ext)", default: unknown])
    } else {
        print(unknown)
    }
}
