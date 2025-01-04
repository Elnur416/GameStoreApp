//
//  FooterCell.swift
//  GameStore
//
//  Created by Elnur Mammadov on 02.01.25.
//

import UIKit

class FooterCell: UICollectionViewCell {
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var titlePrice: UILabel!
    @IBOutlet weak var discountPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleView.layer.cornerRadius = 30
        titleImage.layer.cornerRadius = 30
        
        let gradient = UIImage.gImage(frame: titleView.bounds, colours: [.systemBlue, .blue])
        titleView.backgroundColor = UIColor(patternImage: gradient)
        discountPrice.isHidden = true
    }

}
