//
//  PhoneButton.swift
//  BiPhone
//
//  Created by Kerim Njuhovic on 19/12/2020.
//

import Foundation

@IBDesignable
class KeypadButton: UIButton {
    
    // MARK: - Initialisation -
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2.0
    }
    
}
