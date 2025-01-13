//
//  RegisterController.swift
//  GameStore
//
//  Created by Elnur Mammadov on 31.12.24.
//

import UIKit

class RegisterController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var registerView: UIView!
    @IBOutlet weak var fullnameTxt: UITextField!
    @IBOutlet weak var phoneTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    private let toggleButton = UIButton(type: .custom)
    let viewModel = RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configurePasswordTxt()
        viewModel.readData()
        errorHandler()
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        guard let fullname = fullnameTxt.text, !fullname.isEmpty,
              let phone = phoneTxt.text, !phone.isEmpty,
              let email = emailTxt.text, !email.isEmpty,
              let password = passwordTxt.text, !password.isEmpty
        else {
            let alert = UIAlertController(title: "Error", message: "Please fill all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alert, animated: true)
            return
        }
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        guard let sceneDelegate = windowScene.delegate as? SceneDelegate else { return }
        sceneDelegate.tabbarRoot()
        
        let user = User(fullname: fullname, phone: phone, email: email, password: password)
        viewModel.manager.setValue(value: true, key: .isLoggedIn)
        viewModel.getUserIndex(email: email, password: password)
        viewModel.writeData(user: user)
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(LoginController.self)") as! LoginController
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
    
    func configureUI() {
        let gradient = UIImage.gImage(frame: label.bounds, colours: [.red, .blue])
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textColor = UIColor(patternImage: gradient)
        loginButton.tintColor = UIColor(patternImage: gradient)
        registerButton.tintColor = UIColor(patternImage: gradient)
        registerView.layer.cornerRadius = 30
    }
    
    func configurePasswordTxt() {
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
    
    func errorHandler() {
        viewModel.error = {
            let alert = UIAlertController(title: "Error", message: "Account already exists", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
        }
    }
}


