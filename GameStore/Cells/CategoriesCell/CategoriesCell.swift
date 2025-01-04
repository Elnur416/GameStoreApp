//
//  CategoriesCell.swift
//  GameStore
//
//  Created by Elnur Mammadov on 04.01.25.
//

import UIKit

class CategoriesCell: UICollectionViewCell {
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        titleView.layer.cornerRadius = 30
        titleImage.layer.cornerRadius = 30
    }

}
