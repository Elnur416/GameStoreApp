//
//  Header1Cell.swift
//  GameStore
//
//  Created by Elnur Mammadov on 02.01.25.
//

import UIKit

class Header1Cell: UICollectionViewCell {
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleView.layer.cornerRadius = 10
        let gradient = UIImage.gImage(frame: titleView.bounds, colours: [.systemBlue, .blue])
        titleView.backgroundColor = UIColor(patternImage: gradient)
        titleLabel.textColor = .white
    }

    func configure(text: Sections) {
        titleLabel.text = text.name
    }
    
    func updateView(isSelected: Bool) {
        let gradient = UIImage.gImage(frame: titleView.bounds, colours: [.systemBlue, .blue])
        titleView.backgroundColor = isSelected ? .darkGray: UIColor(patternImage: gradient)
    }
}
