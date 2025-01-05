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
        viewModel.getRandomGame()
    }
    
    @IBAction func searchHandler(_ sender: UITextField) {
    }
    
    fileprivate func configureUI() {
        collection.dataSource = self
        collection.delegate = self
        collection.register(UINib(nibName: "\(Header1View.self)", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(Header1View.self)")
        collection.register(UINib(nibName: "\(FooterView.self)", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "\(FooterView.self)")
        collection.register(UINib(nibName: "\(MainCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(MainCell.self)")
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 400)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
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
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCell", for: indexPath) as! MainCell
        cell.configure(item: viewModel.randomGame[indexPath.row])
        switch viewModel.selectedSection?.name {
        case "Popular Games":
            cell.configureTitle(text: "Most Played Game", isHiddenDiscount: true)
            collection.reloadData()
        case "On Sale":
            cell.configureTitle(text: "Special Price", isHiddenDiscount: false)
            collection.reloadData()
        case "Coming Soon":
            cell.configureTitle(text: "Popular Upcoming", isHiddenDiscount: true)
            collection.reloadData()
        default:
            cell.configureTitle(text: "Most Played Game", isHiddenDiscount: true)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(Header1View.self)", for: indexPath) as! Header1View
            header.sectionAction = { section in
                self.viewModel.selectedSection = section
                self.collection.reloadData()
                let sectionIndex = IndexSet(integer: indexPath.section)
                self.collection.reloadSections(sectionIndex)
            }
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(FooterView.self)", for: indexPath) as! FooterView
            footer.configureData(data: viewModel.games)
            footer.itemSelection = { index in
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "\(GamePageController.self)") as!
                 GamePageController
                controller.selectedGame = self.viewModel.games[index]
                self.navigationController?.show(controller, sender: nil)
            }
            return footer
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: collectionView.frame.width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        .init(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/1-80, height: 420)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(GamePageController.self)") as! GamePageController
        controller.selectedGame = viewModel.randomGame[indexPath.row]
        navigationController?.show(controller, sender: nil)
    }
}

//MARK: - SearchController
extension ExploreController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            if let searchResultsVC = searchController.searchResultsController as? SearchResultsViewController {
                searchResultsVC.filterContent(for: searchText)
            }
        }
    }
}
