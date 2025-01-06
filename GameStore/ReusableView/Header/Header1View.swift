//
//  Header1View.swift
//  GameStore
//
//  Created by Elnur Mammadov on 02.01.25.
//

import UIKit

class Header1View: UICollectionReusableView {
    @IBOutlet weak var collection: UICollectionView!
    private var sectionItems: [Sections] = [.init(name: "All Games", isSelected: false), .init(name: "On Sale", isSelected: false), .init(name: "Coming Soon", isSelected: false)]
    var sectionAction: ((Sections) -> Void)?
    
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collection.cellForItem(at: indexPath) as? Header1Cell {
            sectionItems[indexPath.row].isSelected = true
            cell.updateView(isSelected: true)
            let selectedSection = sectionItems[indexPath.row]
            sectionAction?(selectedSection)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collection.cellForItem(at: indexPath) as? Header1Cell {
            sectionItems[indexPath.row].isSelected = false
            cell.updateView(isSelected: false)
        }
    }
}

