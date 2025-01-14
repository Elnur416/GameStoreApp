//
//  HeaderCell.swift
//  GameStore
//
//  Created by Elnur Mammadov on 14.01.25.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    @IBOutlet private weak var titleView: UIView!
    @IBOutlet private weak var titleImage: UIImageView!
    @IBOutlet private weak var titlePrice: UILabel!
    @IBOutlet private weak var titleName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        configureUI()
    }

    private func configureUI() {
        titleImage.layer.cornerRadius = 30
        titleView.layer.cornerRadius = 30
        let gradient = UIImage.gImage(frame: titleView.bounds, colours: [.red, .blue])
        titleView.backgroundColor = UIColor(patternImage: gradient)
    }
    
    func configure(item: Game) {
        titleName.text = item.name
        titleImage.image = UIImage(named: item.mainImage ?? "")
        titlePrice.text = "\(item.price)"
    }
}
