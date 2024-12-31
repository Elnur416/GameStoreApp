//
//  FirstController.swift
//  GameStore
//
//  Created by Elnur Mammadov on 31.12.24.
//

import UIKit

class FirstController: UIViewController {
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var signUpButton: UIButton!
    @IBOutlet private weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    @IBAction func signUpButtonAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(RegisterController.self)") as! RegisterController
        navigationController?.show(controller, sender: nil)
    }
    
    @IBAction func logInButtonAction(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(LoginController.self)") as! LoginController
        navigationController?.show(controller, sender: nil)
    }
    
    func configureUI() {
        navigationController?.navigationBar.tintColor = .white
        let gradient = UIImage.gImage(frame: label.bounds, colours: [.red, .blue])
        label.text = "Game Store"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = UIColor(patternImage: gradient)
        signUpButton.tintColor = UIColor(patternImage: gradient)
        logInButton.tintColor = UIColor(patternImage: gradient)
    }
}

extension UIImage {
    static func gImage(frame: CGRect, colours: [UIColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.colors = colours.map(\.cgColor)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.6)
        gradientLayer.endPoint = .init(x: 1.0, y: 0.6)
        let render = UIGraphicsImageRenderer(bounds: frame)
        return render.image { context in
            gradientLayer.render(in: context.cgContext)
        }
    }
}
