//
//  GamePageController.swift
//  GameStore
//
//  Created by Elnur Mammadov on 03.01.25.
//

import UIKit

class GamePageController: UIViewController {
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var discount: UILabel!
    
    var selectedGame: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "\(GamePageCell.self)", bundle: nil), forCellReuseIdentifier: "\(GamePageCell.self)")
        price.text = "\(selectedGame?.price ?? 0)"
        
        if selectedGame?.discountedPrice != 0 {
            discount.isHidden = false
            discount.text = "\(selectedGame?.price ?? 0)$"
            price.text = "\(selectedGame?.discountedPrice ?? 0)$"
        } else {
            discount.isHidden = true
            price.text = "\(selectedGame?.price ?? 0)$"
        }
        let text = discount.text ?? ""
        let attributes: [NSAttributedString.Key: Any] = [
            .strikethroughStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: UIColor.red
        ]
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        discount.attributedText = attributedString
    }
    
    @IBAction func buyNowButtonAction(_ sender: Any) {
    }
    
}

extension GamePageController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(GamePageCell.self)") as! GamePageCell
        cell.configure(item: selectedGame!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
                       
                       
                       
