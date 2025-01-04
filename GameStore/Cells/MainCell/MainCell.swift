//
//  MainCell.swift
//  GameStore
//
//  Created by Elnur Mammadov on 02.01.25.
//

import UIKit


class MainCell: UICollectionViewCell {
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var titlePrice: UILabel!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var discountPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        titleImage.layer.cornerRadius = 30
        titleView.layer.cornerRadius = 30
        let gradient = UIImage.gImage(frame: cellTitle.bounds, colours: [.systemBlue, .blue])
        cellTitle.font = UIFont.boldSystemFont(ofSize: 35)
        cellTitle.textColor = UIColor(patternImage: gradient)
        titleView.backgroundColor = .systemBlue
        discountPrice.isHidden = true
    }
}
