//
//  CallHistoryItem.swift
//  BiPhone
//
//  Created by Kerim Njuhovic on 21/12/2020.
//

import Foundation
import RealmSwift

class CallHistoryItem: Object {
    @objc dynamic fileprivate (set) var phoneNumber: String = ""
    @objc dynamic fileprivate (set) var type: String = CallType.incoming.rawValue
    @objc dynamic fileprivate (set) var date: NSDate = NSDate()
    
    override init() {
        super.init()
    }
    
    init(phone: String, callType: CallType, date: NSDate) {
        self.phoneNumber = phone
        self.type = callType.rawValue
        self.date = date
    }

}

// MARK: - Call Type -

extension CallHistoryItem {
    enum CallType: String {
        case incoming
        case outgoing
        
        var icon: UIImage {
            switch self {
            case .incoming:
                return UIImage(named: "incoming_call")!
            case .outgoing:
                return UIImage(named: "outgoing_call")!
            }
        }
    }
}
