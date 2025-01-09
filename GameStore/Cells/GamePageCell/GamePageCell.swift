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
    
    @IBAction func likeButtonAction(_ sender: UIButton) {
        sender.isSelected.toggle()
        let liked = sender.isSelected
        sender.setImage(UIImage(systemName: sender.isSelected ? "heart.fill" : "heart"), for: .normal)
        sender.backgroundColor = .clear
        likeAction?(liked)
    }
    
    
    func configure(item: Game, addCartHidden: Bool) {
        titleImage.image = UIImage(named: item.customImage ?? "")
        gameName.text = item.name
        aboutGame.text = "\(item.about ?? "")"
        addCartButton.isHidden = addCartHidden
    }
    
    func configureForCart(item: GameForCart, addCartHidden: Bool) {
        titleImage.image = UIImage(named: item.customImage ?? "")
        gameName.text = item.name
        aboutGame.text = "\(String(describing: item.about))"
        addCartButton.isHidden = addCartHidden
    }
    
    func configureLikeButton(isLiked: Bool) {
        let liked = isLiked
        likeButton.setImage(UIImage(systemName: liked ? "heart.fill" : "heart"), for: .normal)
    }
}
