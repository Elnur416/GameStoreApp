//
//  FooterView.swift
//  GameStore
//
//  Created by Elnur Mammadov on 02.01.25.
//

import UIKit

class FooterView: UICollectionReusableView {
    @IBOutlet weak var collection: UICollectionView!
    let navigation = UINavigationController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        collection.dataSource = self
        collection.delegate = self
        collection.register(UINib(nibName: "\(FooterCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(FooterCell.self)")
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 180)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 40, left: 20, bottom: 0, right: 20)
        collection.collectionViewLayout = layout
    }
    
}

extension FooterView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FooterCell.self)", for: indexPath) as! FooterCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/3, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(GamePageController.self)") as! GamePageController
        navigation.show(controller, sender: nil)
    }
}
