import Foundation
import KeychainSwift

/**
*  Store that persist the data on a secure environment
*/
public struct SecureStore: KeyValueStore {
    
    // MARK: - Attributes
    
    /// Keychain object to persist the data
    let keychain = KeychainSwift()
    
    
    // MARK: - KeyValueStore
    
    public func setString(value: String, key: String) {
        keychain.set(value, forKey: key)
    }
    
    public func setData(value: NSData, key: String) {
        keychain.set(value, forKey: key)
    }
    
    public func getData(key: String) -> NSData? {
        return keychain.getData(key)
    }
    
    public func getString(key: String) -> String? {
        return keychain.get(key)
    }
    
    
    // MARK: - Helpers
    
    public func clear(key: String) {
        keychain.delete(key)
    }
    
    public func clearAll() {
        keychain.clear()
    }
}