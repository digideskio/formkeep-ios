import Result

enum KeychainError: ErrorType {
    case ValueNotFound
}

protocol SecureItem {
    static var key: String { get }
    
    init?(data: AnyObject)
    
    static func read() -> Result<Self, KeychainError>
}

extension SecureItem {
    static func read() -> Result<Self, KeychainError> {
        let obj = Keychain.objectForKey(key).flatMap(Self.init)
        
        return Result(obj, failWith: KeychainError.ValueNotFound)
    }
}