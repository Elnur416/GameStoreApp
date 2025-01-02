//
//  Header1View.swift
//  GameStore
//
//  Created by Elnur Mammadov on 02.01.25.
//

import UIKit

class Header1View: UICollectionReusableView {
    @IBOutlet weak var collection: UICollectionView!
    private var sectionItems: [String] = ["All Games", "Trending", "On Sale", "Coming Soon"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        collection.dataSource = self
        collection.delegate = self
        collection.register(UINib(nibName: "Header1Cell", bundle: nil), forCellWithReuseIdentifier: "Header1Cell")
        collection.showsHorizontalScrollIndicator = false
    }
    
}

extension Header1View: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sectionItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(Header1Cell.self)", for: indexPath) as! Header1Cell
        cell.configure(text: sectionItems[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.size.width/2 - 20, height: 30)
    }
}

