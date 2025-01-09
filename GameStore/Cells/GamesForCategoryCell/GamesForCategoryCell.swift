//
//  GamesForCategoryCell.swift
//  GameStore
//
//  Created by Elnur Mammadov on 04.01.25.
//

import UIKit

class GamesForCategoryCell: UITableViewCell {
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var discountPrice: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        let text = discountPrice.text ?? ""
        let attributes: [NSAttributedString.Key: Any] = [
            .strikethroughStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: UIColor.red
        ]
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        discountPrice.attributedText = attributedString
    }
    
    func configure(model: Game) {
        titleName.text = model.name
        titleImage.image = UIImage(named: model.mainImage ?? "")
    }
    
    func configureForCart(model: GameForCart) {
        titleName.text = model.name
        titleImage.image = UIImage(named: model.mainImage ?? "")
    }
}
