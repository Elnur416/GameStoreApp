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
    
    func colorFromString(_ color: String) -> UIColor {
        switch color {
        case "systemOrange":
            return UIColor.systemOrange
        case "systemBlue":
            return UIColor.systemBlue
        case "systemBrown":
            return UIColor.systemBrown
        case "systemGrey2":
            return UIColor.systemGray2
        case "systemRed":
            return UIColor.systemRed
        case "systemYellow":
            return UIColor.systemYellow
        default:
            
            if let hexColor = UIColor(hex: color) {
                return hexColor
            }
            return UIColor.clear 
        }
    }

    func configure(category: Category) {
        categoryName.text = category.name
        titleImage.image = UIImage(named: category.image!)
        titleView.backgroundColor = colorFromString(category.colour!)
    }
}
