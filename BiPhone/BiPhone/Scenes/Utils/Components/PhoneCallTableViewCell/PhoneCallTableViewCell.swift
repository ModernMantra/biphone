//
//  PhoneCallTableViewCell.swift
//  BiPhone
//
//  Created by Kerim Njuhovic on 20/12/2020.
//

import UIKit

class PhoneCallTableViewCell: UITableViewCell {
    
    // MARK: - Outlets -

    @IBOutlet var phoneNumberLabel: UILabel!
    
    // MARK: - Lifecycle -
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func initCell(with model: CallHistoryItem) {
        self.phoneNumberLabel.text = model.phoneNumber
    }
    
}
