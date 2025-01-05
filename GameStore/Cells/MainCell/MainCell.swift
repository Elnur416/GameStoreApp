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
     
        configureUI()
    }
    
    func configureUI() {
        titleImage.layer.cornerRadius = 30
        titleView.layer.cornerRadius = 30
        let gradient = UIImage.gImage(frame: cellTitle.bounds, colours: [.systemBlue, .blue])
        cellTitle.font = UIFont.boldSystemFont(ofSize: 30)
        cellTitle.textColor = UIColor(patternImage: gradient)
        titleView.backgroundColor = .systemBlue
        discountPrice.isHidden = true
    }
    
    func configure(item: Game) {
        titleName.text = item.name
        titleImage.image = UIImage(named: item.mainImage ?? "")
        titlePrice.text = "\(item.price)"
    }
    
    func configureTitle(text: String, isHiddenDiscount: Bool) {
        cellTitle.text = text
        discountPrice.isHidden = isHiddenDiscount
    }
}
