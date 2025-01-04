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
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    @IBAction func addCartButtonAction(_ sender: Any) {
    }
    @IBAction func addWishlistButton(_ sender: Any) {
    }
}
