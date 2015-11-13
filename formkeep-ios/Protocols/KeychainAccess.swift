import LUKeychainAccess

protocol KeychainAccess {
    func objectForKey(key: String!) -> AnyObject!
}

extension LUKeychainAccess: KeychainAccess { }