//
//  UserDefaults+PropertyWrapper.swift
//  BiPhone
//
//  Created by Kerim Njuhovic on 21/12/2020.
//

import Foundation

@propertyWrapper
struct UserDefaultsStorage {
    private let key: String
    private let defaultValue: String
    
    init(key: String, defaultValue: String) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: String {
        get {
            // Read value from UserDefaults
            return UserDefaults.standard.string(forKey: key) ?? defaultValue
        }
        set {
            // Set value to UserDefaults
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
