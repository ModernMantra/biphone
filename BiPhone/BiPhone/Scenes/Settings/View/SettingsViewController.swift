//
//  SettingsViewController.swift
//  BiPhone
//
//  Created by Kerim Njuhovic on 19/12/2020.
//

import UIKit

class SettingsViewController: BaseViewController {
    
    // MARK: - Outlets -
    
    @IBOutlet var accountTextField: UITextField! {
        didSet {
            self.accountTextField.delegate = self
            self.accountTextField.text = self.viewModel.account
        }
    }
    @IBOutlet var passwordTextField: UITextField! {
        didSet {
            self.passwordTextField.delegate = self
            self.passwordTextField.text = self.viewModel.password
        }
    }
    @IBOutlet var domainTextField: UITextField! {
        didSet {
            self.domainTextField.delegate = self
            self.domainTextField.text = self.viewModel.domain
        }
    }
    @IBOutlet var proxyTextField: UITextField! {
        didSet {
            self.proxyTextField.delegate = self
            self.proxyTextField.text = self.viewModel.proxy
        }
    }
    
    // MARK: - Properties -
    
    private let viewModel: SettingsViewModel = DefaultSettingsViewModel()
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        self.screenTitle = self.viewModel.screenTitle
    }

}

// MARK: - Text Field Delegate -

extension SettingsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case accountTextField:
            accountTextField.resignFirstResponder()
            viewModel.didUpdateAccount(accountTextField.text ?? "")
        case passwordTextField:
            passwordTextField.resignFirstResponder()
            viewModel.didUpdatePassword(passwordTextField.text ?? "")
        case domainTextField:
            domainTextField.resignFirstResponder()
            viewModel.didUpdateDomain(domainTextField.text ?? "")
        case proxyTextField:
            proxyTextField.resignFirstResponder()
            viewModel.didUpdateProxy(proxyTextField.text ?? "")
        default:
            break
        }
        
        return true
    }
}
