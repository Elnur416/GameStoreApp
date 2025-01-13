//
//  CardRegisterController.swift
//  GameStore
//
//  Created by Elnur Mammadov on 13.01.25.
//

import UIKit

class CardRegisterController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cardNumberTxt: UITextField!
    @IBOutlet weak var expiryDateTxt: UITextField!
    @IBOutlet weak var cvcTxt: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    let datePicker = UIDatePicker()
    let manager = UserDefaultsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        expiryDateTxt.addTarget(self, action: #selector(pickDateOfBirth), for: .touchDown)
    }
    
    @IBAction func submitButtonAction(_ sender: Any) {
        guard let cardNumber = cardNumberTxt.text, !cardNumber.isEmpty,
              let expiryDate = expiryDateTxt.text, !expiryDate.isEmpty,
              let cvc = cvcTxt.text, !cvc.isEmpty
        else {
            let alert = UIAlertController(title: "Error", message: "Please fill all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive))
            present(alert, animated: true)
            return
        }
        manager.setValue(value: true, key: .isCardAdded)
        dismiss(animated: true)
    }
    
    func configureUI() {
        let gradient = UIImage.gImage(frame: titleLabel.bounds, colours: [.red, .blue])
        titleLabel.font = UIFont.boldSystemFont(ofSize: 35)
        titleLabel.textColor = UIColor(patternImage: gradient)
        submitButton.tintColor = UIColor(patternImage: gradient)
    }
    
    @objc func pickDateOfBirth() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneButtonClicked))
        toolBar.items = [doneButton]
        expiryDateTxt.inputAccessoryView = toolBar
        expiryDateTxt.inputView = datePicker
        datePicker.datePickerMode = .yearAndMonth
        datePicker.minimumDate = Date()
    }
    
    @objc func doneButtonClicked() {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateFormat = "yyyy MMMM"
        expiryDateTxt.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}
