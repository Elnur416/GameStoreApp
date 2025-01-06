//
//  GamePageCell.swift
//  GameStore
//
//  Created by Elnur Mammadov on 03.01.25.
//

import UIKit

class GamePageCell: UITableViewCell {
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var aboutGame: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var addCartButton: UIButton!
    var likeAction: ((Bool) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func addCartButtonAction(_ sender: Any) {
    }
    
    @IBAction func addWishlistButton(_ sender: Any) {
        likeButton.isSelected.toggle()
        let liked = likeButton.isSelected
        likeButton.setImage(UIImage(systemName: liked ? "heart.fill" : "heart"), for: .normal)
        likeAction?(liked)
    }
    
    func configure(item: Game, addCartHidden: Bool) {
        titleImage.image = UIImage(named: item.customImage ?? "")
        gameName.text = item.name
        aboutGame.text = "\(item.about ?? "")"
        addCartButton.isHidden = addCartHidden
    }
}
