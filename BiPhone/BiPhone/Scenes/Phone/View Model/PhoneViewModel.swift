//
//  CallHistoryViewModel.swift
//  BiPhone
//
//  Created by Kerim Njuhovic on 19/12/2020.
//

import Foundation

protocol PhoneViewModelInput {
    func makeCall(number: String)
}

protocol PhoneViewModelOutput {
    var screenTitle: String { get }
}

typealias PhoneViewModel = PhoneViewModelInput & PhoneViewModelOutput

// MARK: - Default Implementation -

final class DefaultPhoneViewModel: PhoneViewModel {
    
    var screenTitle: String = ""
    private var account: VSLAccount! {
        get { return AppDelegate.shared.sipConnection?.account! }
    }
    private var call: VSLCall?
    private var callManager: VSLCallManager!
    
    init() {
        callManager = VialerSIPLib.sharedInstance().callManager
    }
    
    fileprivate func setupCall(number: String) {
        DispatchQueue.global(qos: .background).async {
            RealmDAO<CallHistoryItem>().save(data: [CallHistoryItem(phone: number, callType: .outgoing, date: NSDate())])
        }
        self.callManager.startCall(toNumber: number, for: account) { [weak self] (call, error) in
            if error != nil {
                print("Could not start call, \(String(describing: error))")
            } else {
                self?.call = call
                print(">>>>>> Success <<<<<<")
            }
        }
    }
    
    func makeCall(number: String) {
        if account.isRegistered {
            setupCall(number: number)
        } else {
            account.register { (success, error) in
                self.setupCall(number: number)
            }
        }
    }
    
}
