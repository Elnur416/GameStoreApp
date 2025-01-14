//
//  Header1View.swift
//  GameStore
//
//  Created by Elnur Mammadov on 02.01.25.
//

import UIKit

class Header1View: UICollectionReusableView {
    @IBOutlet private weak var collection: UICollectionView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var allGamesLabel: UILabel!
    @IBOutlet private weak var pageControl: UIPageControl!
    private var games = [Game]()
    var popularGames = [Game]()
    var itemSelection: ((Int) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        configureUI()
    }
    
    fileprivate func configureUI() {
        collection.dataSource = self
        collection.delegate = self
        collection.register(UINib(nibName: "\(HeaderCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(HeaderCell.self)")
        collection.showsHorizontalScrollIndicator = false
        pageControl.currentPage = 0
        let gradient = UIImage.gImage(frame: titleLabel.bounds, colours: [.red, .blue])
        titleLabel.font = UIFont.boldSystemFont(ofSize: 35)
        titleLabel.textColor = UIColor(patternImage: gradient)
        allGamesLabel.textColor = UIColor(patternImage: gradient)
        pageControl.tintColor = UIColor(patternImage: gradient)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HeaderCell.self)", for: indexPath) as! HeaderCell
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

