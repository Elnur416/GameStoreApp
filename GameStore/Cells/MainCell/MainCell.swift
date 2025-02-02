//
//  MainCell.swift
//  GameStore
//
//  Created by Elnur Mammadov on 14.01.25.
//

import UIKit

class MainCell: UICollectionViewCell {
    @IBOutlet private weak var titleView: UIView!
    @IBOutlet private weak var titlePrice: UILabel!
    @IBOutlet private weak var titleImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureUI()
    }

    private func configureUI() {
        titleView.layer.cornerRadius = 30
        titleImage.layer.cornerRadius = 30
        let gradient = UIImage.gImage(frame: titleView.bounds, colours: [.red, .blue])
        titleView.backgroundColor = UIColor(patternImage: gradient)
    }

    func configure(item: Game) {
        titleImage.image = UIImage(named: item.mainImage!)
        titlePrice.text = "\(item.price)"
    }
    
    func configureForProfile(item: GameForCart) {
        titleImage.image = UIImage(named: item.mainImage!)
        titlePrice.text = "\(item.price ?? 0)"
    }
}
