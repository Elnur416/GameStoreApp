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
        let text = discountPrice.text ?? ""
        let attributes: [NSAttributedString.Key: Any] = [
            .strikethroughStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: UIColor.red
        ]
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        discountPrice.attributedText = attributedString
    }
    
    func configure(item: Game, cellTitleName: String) {
        titleName.text = item.name
        titleImage.image = UIImage(named: item.mainImage ?? "")
        titlePrice.text = "\(item.price)"
        cellTitle.text = cellTitleName
        if item.discountedPrice != 0 {
            discountPrice.isHidden = false
            discountPrice.text = "\(item.price)$"
            titlePrice.text = "\(item.discountedPrice)$"
        } else {
            if item.price != 0 {
                discountPrice.isHidden = true
                titlePrice.text = "\(item.price)$"
            } else {
                discountPrice.isHidden = true
                titlePrice.text = ""
            }
        }
    }
}
