//
//  PhoneViewController.swift
//  BiPhone
//
//  Created by Kerim Njuhovic on 19/12/2020.
//

import UIKit

class PhoneViewController: BaseViewController {
    
    // MARK: - Outlets -
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var nmbrOneBttn: KeypadButton!
    @IBOutlet var nmbrTwoBttn: KeypadButton!
    @IBOutlet var nmbrThreeBttn: KeypadButton!
    @IBOutlet var nmbrFourBttn: KeypadButton!
    @IBOutlet var nmbrFiveBttn: KeypadButton!
    @IBOutlet var nmbrSixBttn: KeypadButton!
    @IBOutlet var nmbrSevenBttn: KeypadButton!
    @IBOutlet var nmbrEightBttn: KeypadButton!
    @IBOutlet var nmbrNineBttn: KeypadButton!
    @IBOutlet var nmbrZeroBttn: KeypadButton!
    @IBOutlet var starBttn: KeypadButton!
    @IBOutlet var sharpBttn: KeypadButton!
    @IBOutlet var deleteButton: UIButton!
    
    // MARK: - Properties -
    
    fileprivate let viewModel: PhoneViewModel = DefaultPhoneViewModel()
    fileprivate var titleText: String = "" {
        didSet {
            self.titleLabel.text = titleText
            
            if titleText.isEmpty == true {
                self.deleteButton.alpha = 0
                self.deleteButton.isUserInteractionEnabled = false
            } else {
                self.deleteButton.alpha = 1
                self.deleteButton.isUserInteractionEnabled = true
            }
        }
    }
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        self.screenTitle = self.viewModel.screenTitle
    }
    
    // MARK: - Actions -
    
    @IBAction func phoneButtonAction(_ sender: UIButton) {
        if let text = sender.titleLabel?.text {
            self.titleText.append(text)
        }
    }
    
    @IBAction func callButtonAction(_ sender: UIButton) {
        self.viewModel.makeCall(number: self.titleLabel.text ?? "")
    }
    
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        self.titleText.removeLast()
    }
}
