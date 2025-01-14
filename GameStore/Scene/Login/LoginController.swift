//
//  LoginController.swift
//  GameStore
//
//  Created by Elnur Mammadov on 31.12.24.
//

import UIKit

class LoginController: UIViewController {
    @IBOutlet private weak var loginView: UIView!
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var emailTxt: UITextField!
    @IBOutlet private weak var passwordTxt: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var signUpButton: UIButton!
    private let toggleButton = UIButton(type: .custom)
    private let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configurePasswordTxt()
        viewModel.readData()
        errorHandler()
        successHandler()
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        guard let email = emailTxt.text, !email.isEmpty,
              let password = passwordTxt.text, !password.isEmpty
        else {
            let alert = UIAlertController(title: "Error", message: "Please fill all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alert, animated: true)
            return
        }
        viewModel.checkUser(email: email, password: password)
    }
    
    @IBAction func signUpButtonAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(RegisterController.self)") as! RegisterController
        navigationController?.show(controller, sender: nil)
    }
    
    @objc func togglePasswordVisibility() {
        toggleButton.isSelected.toggle()
        passwordTxt.isSecureTextEntry.toggle()
        if let existingText = passwordTxt.text, !passwordTxt.isSecureTextEntry {
            passwordTxt.text = ""
            passwordTxt.insertText(existingText)
        }
    }
    
    fileprivate func configureUI() {
        let gradient = UIImage.gImage(frame: label.bounds, colours: [.red, .blue])
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textColor = UIColor(patternImage: gradient)
        loginButton.tintColor = UIColor(patternImage: gradient)
        signUpButton.tintColor = UIColor(patternImage: gradient)
        loginView.layer.cornerRadius = 30
    }
    
    private func configurePasswordTxt() {
        passwordTxt.isSecureTextEntry = true
        passwordTxt.borderStyle = .roundedRect
        toggleButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        toggleButton.setImage(UIImage(systemName: "eye"), for: .selected)
        toggleButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        toggleButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        toggleButton.tintColor = .white
        passwordTxt.rightView = toggleButton
        passwordTxt.rightViewMode = .always
    }
    
    private func errorHandler() {
        viewModel.error = {
            let alert = UIAlertController(title: "Error", message: "Account not found", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    private func successHandler() {
        viewModel.success = {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            guard let sceneDelegate = windowScene.delegate as? SceneDelegate else { return }
            sceneDelegate.tabbarRoot()
            self.viewModel.manager.setValue(value: true, key: .isLoggedIn)
        }
    }
}
