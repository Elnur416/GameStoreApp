//
//  GamesForCategoryCell.swift
//  GameStore
//
//  Created by Elnur Mammadov on 04.01.25.
//

import UIKit

class GamesForCategoryCell: UITableViewCell {
    @IBOutlet private weak var titleImage: UIImageView!
    @IBOutlet private weak var titleName: UILabel!
    @IBOutlet private weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configure(model: Game) {
        titleName.text = model.name
        titleImage.image = UIImage(named: model.mainImage ?? "")
        price.text = "\(model.price)"
    }
    
    func configureForCart(model: GameForCart) {
        titleName.text = model.name
        titleImage.image = UIImage(named: model.mainImage ?? "")
        price.text = "\(model.price ?? 0.0)"
    }
}
