import SwiftUI

@propertyWrapper public struct CodingStylePropertyWrapper {
   
    public enum Style: String {
        case CamelCase  = " "
        case SnakeCase  = "_"
        case KebabCase  = "-"
    }
    
    private var value: String
    private var style: Style
    
    public var wrappedValue: String {
        get { сoncatenation(array: get()) }
        set { value = newValue }
    }
    
    public var projectedValue: Style {
        get { style }
        set { style = newValue }
    }
    
    public init(wrappedValue: String, style: Style) {
        self.value = wrappedValue
        self.style = style
    }
    
    //  MARK: - Private functions
    
    private func camelCase() -> String {
        var newString: String = ""
        
        value.forEach { character in
            if character.isUppercase { newString.append(" ") }
            newString.append(character)
        }
        
        if newString.first == " " { newString.removeFirst() }
        
        return newString
    }
    
    private func get() -> [String] {
        let substrings: [String] = camelCase().split { separator in
            if separator == " " || separator == "-" || separator == "_" { return true }
            return false
        }.map { String($0).lowercased() }
        
        return substrings
    }
    
    private func сoncatenation(array: [String]) -> String {
        var output: String = ""
        
        switch style {
        case .CamelCase:
            array.forEach { output += $0.prefix(1).uppercased() + $0.dropFirst() }
            
        default:
            array.forEach { output += $0 + style.rawValue }
            if !output.isEmpty { output.removeLast() }
        }
        return output
    }
}
