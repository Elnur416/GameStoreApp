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
    var likeAction: ((Bool) -> Void)?
    var isLiked: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func likeButtonAction(_ sender: UIButton) {
        isLiked.toggle()
        updateLikeButton()
        likeAction?(isLiked)
    }
    
    private func updateLikeButton() {
            let imageName = isLiked ? "heart.fill" : "heart"
            likeButton.setImage(UIImage(systemName: imageName), for: .normal)
        }
    
    func configure(item: Game) {
        titleImage.image = UIImage(named: item.customImage ?? "")
        gameName.text = item.name
        aboutGame.text = "\(item.about ?? "")"
    }
    
    func configureForCart(item: GameForCart) {
        titleImage.image = UIImage(named: item.customImage ?? "")
        gameName.text = item.name
        aboutGame.text = "\(String(describing: item.about))"
    }
    
    func configureLikeButton(isLiked: Bool) {
        self.isLiked = isLiked
        updateLikeButton()
    }
}
