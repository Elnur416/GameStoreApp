//
//  ExploreController.swift
//  GameStore
//
//  Created by Elnur Mammadov on 02.01.25.
//

import UIKit

class ExploreController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    private let searchController = UISearchController(searchResultsController: SearchResultsViewController())
    let viewModel = ExploreViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        loadData()
        viewModel.fetchGames()
    }
    
    fileprivate func configureUI() {
        collection.dataSource = self
        collection.delegate = self
        collection.register(UINib(nibName: "\(Header1View.self)", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(Header1View.self)")
        collection.register(UINib(nibName: "\(FooterCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(FooterCell.self)")
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 400)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        collection.collectionViewLayout = layout
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search Items"
        navigationItem.searchController = searchController
    }
    
    func loadData() {
        if viewModel.manager.getBool(key: .isDataLoaded) {
            return
        } else {
            viewModel.loadData()
            viewModel.manager.setValue(value: true, key: .isDataLoaded)
        }
    }
}

//MARK: - DataSource, Delegate
extension ExploreController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FooterCell", for: indexPath) as! FooterCell
        cell.configure(item: viewModel.games[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(Header1View.self)", for: indexPath) as! Header1View
            header.configureData(data: viewModel.games)
            return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: collectionView.frame.width, height: 440)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/2-20, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(GamePageController.self)") as! GamePageController
        navigationController?.show(controller, sender: nil)
    }
}

//MARK: - SearchController
extension ExploreController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            if let controller = searchController.searchResultsController as? SearchResultsViewController {
                controller.configure(items: viewModel.games)
                controller.filterContent(for: searchText)
                controller.filteredGames = { data in
                    self.viewModel.filteredGames = data
                }
                controller.itemSelection = { index in
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "\(GamePageController.self)") as!
                     GamePageController
                    vc.viewModel.selectedGame = self.viewModel.filteredGames[index]
                    self.navigationController?.show(vc, sender: nil)
                }
            }
        }
    }
}
