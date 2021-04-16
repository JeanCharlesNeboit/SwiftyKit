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
