//
//  Header1View.swift
//  GameStore
//
//  Created by Elnur Mammadov on 02.01.25.
//

import UIKit

class Header1View: UICollectionReusableView {
    @IBOutlet weak var collection: UICollectionView!
    private var games = [Game]()
    var popularGames = [Game]()
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    var itemSelection: ((Int) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        configureUI()
    }
    
    func configureUI() {
        collection.dataSource = self
        collection.delegate = self
        collection.register(UINib(nibName: "MainCell", bundle: nil), forCellWithReuseIdentifier: "MainCell")
        collection.showsHorizontalScrollIndicator = false
        pageControl.currentPage = 0
    }
    
    func configureData(data: [Game]) {
        self.games = data
        getPopularGames()
        collection.reloadData()
    }
    
    func getPopularGames() {
        popularGames = games.filter{ $0.isPopular }
    }
}

extension Header1View: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,  UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        popularGames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MainCell.self)", for: indexPath) as! MainCell
        cell.configure(item: popularGames[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width-80, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.numberOfPages = popularGames.count
        pageControl.currentPage = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        itemSelection?(indexPath.item)
    }
}

