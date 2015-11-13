import LUKeychainAccess

struct Keychain {
    static var keychain: KeychainAccess = LUKeychainAccess.standardKeychainAccess()

    static func objectForKey(key: String) -> AnyObject? {
        return keychain.objectForKey(key)
    }
}