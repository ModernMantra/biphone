//
//  SipUser.swift
//  BiPhone
//
//  Created by Kerim Njuhovic on 17/12/2020.
//

import Foundation

class SipUser: NSObject, SIPEnabledUser {

    let sipAccount: String
    let sipPassword: String
    let sipDomain: String
    let sipProxy: String?
    let sipRegisterOnAdd: Bool

    init(sipAccount: String, sipPassword: String, sipDomain: String, sipProxy: String?) {
        self.sipAccount = sipAccount
        self.sipPassword = sipPassword
        self.sipDomain = sipDomain
        self.sipProxy = sipProxy
        sipRegisterOnAdd = false
        super.init()
    }

    convenience override init() {
        let account: String = UserDefaults.standard.string(forKey: "sip_account") ?? Keys.SIP.Account
        let password: String = UserDefaults.standard.string(forKey: "sip_password") ?? Keys.SIP.Password
        let domain: String = UserDefaults.standard.string(forKey: "sip_domain") ?? Keys.SIP.Domain
        let proxy: String = UserDefaults.standard.string(forKey: "sip_proxy") ?? Keys.SIP.Proxy
        
        self.init(
            sipAccount: account,
            sipPassword: password,
            sipDomain: domain,
            sipProxy: proxy.isEmpty ? nil : proxy
        )
    }
}
