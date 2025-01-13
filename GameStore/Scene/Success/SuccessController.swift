//
//  SuccessController.swift
//  GameStore
//
//  Created by Elnur Mammadov on 13.01.25.
//

import UIKit

class SuccessController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    @IBAction func okButtonAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func configureUI() {
        let gradient = UIImage.gImage(frame: titleLabel.bounds, colours: [.red, .blue])
        titleLabel.font = UIFont.boldSystemFont(ofSize: 35)
        titleLabel.textColor = UIColor(patternImage: gradient)
        okButton.tintColor = UIColor(patternImage: gradient)
    }
}
