//
//  SettingsViewModel.swift
//  BiPhone
//
//  Created by Kerim Njuhovic on 19/12/2020.
//

import Foundation

protocol SettingsViewModelInput {
    func didUpdateAccount(_ newValue: String)
    func didUpdatePassword(_ newValue: String)
    func didUpdateDomain(_ newValue: String)
    func didUpdateProxy(_ newValue: String)
}

protocol SettingsViewModelOutput {
    var screenTitle: String { get }
    var account: String { get }
    var password: String { get }
    var domain: String { get }
    var proxy: String { get }
}

typealias SettingsViewModel = SettingsViewModelInput & SettingsViewModelOutput

// MARK: - Default Implementation -

final class DefaultSettingsViewModel: SettingsViewModel {
    
    @UserDefaultsStorage(key: "sip_account", defaultValue: Keys.SIP.Account)
    private var sipAccount: String
    
    @UserDefaultsStorage(key: "sip_password", defaultValue: Keys.SIP.Password)
    private var sipPassword: String
    
    @UserDefaultsStorage(key: "sip_domain", defaultValue: Keys.SIP.Domain)
    private var sipDomain: String
    
    @UserDefaultsStorage(key: "sip_proxy", defaultValue: Keys.SIP.Proxy)
    private var sipProxy: String
    
    var account: String {
        return self.sipAccount
    }
    
    var password: String {
        return self.sipPassword
    }
    
    var domain: String {
        return self.sipDomain
    }
    
    var proxy: String {
        return self.sipProxy
    }
        
    var screenTitle: String = "SETTINGS"
    
    // MARK: - Modifiers -
    
    func didUpdateAccount(_ newValue: String) {
        self.sipAccount = newValue
    }
    
    func didUpdatePassword(_ newValue: String) {
        self.sipPassword = newValue
    }
    
    func didUpdateDomain(_ newValue: String) {
        self.sipDomain = newValue
    }
    
    func didUpdateProxy(_ newValue: String) {
        self.sipProxy = newValue
    }
    
}
