//
//  MainCell.swift
//  GameStore
//
//  Created by Elnur Mammadov on 02.01.25.
//

import UIKit


class MainCell: UICollectionViewCell {
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var titlePrice: UILabel!
    @IBOutlet weak var titleView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        configureUI()
    }
    
    func configureUI() {
        titleImage.layer.cornerRadius = 30
        titleView.layer.cornerRadius = 30
//        titleView.backgroundColor = .orange
    }
    
    func configure(item: Game) {
        titleName.text = item.name
        titleImage.image = UIImage(named: item.mainImage ?? "")
        titlePrice.text = "\(item.price)"
        }
    }

