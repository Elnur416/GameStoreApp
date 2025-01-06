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
        
        configureUI()
    }

    private func configureUI() {
        titleView.layer.cornerRadius = 30
        titleImage.layer.cornerRadius = 30
        let gradient = UIImage.gImage(frame: titleView.bounds, colours: [.systemBlue, .blue])
        titleView.backgroundColor = UIColor(patternImage: gradient)
        discountPrice.isHidden = true
        let text = discountPrice.text ?? ""
        let attributes: [NSAttributedString.Key: Any] = [
            .strikethroughStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: UIColor.red
        ]
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        discountPrice.attributedText = attributedString
    }
    
    func configure(item: Game) {
        titleImage.image = UIImage(named: item.mainImage!)
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
                titlePrice.text = "Coming Soon"
            }
        }
    }
}
