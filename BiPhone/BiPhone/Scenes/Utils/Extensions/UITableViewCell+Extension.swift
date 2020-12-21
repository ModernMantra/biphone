//
//  UITableViewCell+Extension.swift
//  BiPhone
//
//  Created by Kerim Njuhovic on 21/12/2020.
//

import UIKit

extension UITableViewCell {
    
    /// Identifier that can be used when registering cell for table view
    public static var identifier: String {
        return String(describing: self)
    }
    
}
