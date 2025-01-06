//
//  FooterView.swift
//  GameStore
//
//  Created by Elnur Mammadov on 02.01.25.
//

import UIKit

class FooterView: UICollectionReusableView {
    @IBOutlet weak var collection: UICollectionView!
    
    var items = [Game]()
    var itemSelection: ((Int) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        configureUI()
    }
    
    func configureData(data: [Game]) {
        items = data
        self.collection.reloadData()
    }
    
    func configureUI() {
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
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FooterCell.self)", for: indexPath) as! FooterCell
        cell.configure(item: items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/3, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        itemSelection?(indexPath.item)
    }
}
