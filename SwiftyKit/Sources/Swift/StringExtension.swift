//
//  StringExtension.swift
//  Speech
//
//  Created by Jean-Charles Neboit on 31/03/2021.
//

public extension Optional where Wrapped == String {
    var strongValue: String {
        return self ?? ""
    }
    
    var isEmptyOrNil: Bool {
        guard let self = self else { return true }
        return self.isEmpty
    }
    
    var nilIfEmpty: String? {
        guard !isEmptyOrNil else { return nil }
        return self
    }
}

public extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    var diacriticInsensitive: String {
        folding(options: .diacriticInsensitive, locale: .current)
    }
}

public extension String {
    subscript (i: Int) -> String {
        self[i..<i+1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, count) ..< count]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript(r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(count, r.lowerBound)),
                                            upper: min(count, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
