//
//  SearchResultsViewController.swift
//  GameStore
//
//  Created by Elnur Mammadov on 03.01.25.
//

import UIKit

class SearchResultsViewController: UIViewController {

    private var tableView: UITableView!
    private var filteredData = [Game]()
    private var allData = [Game]()
    var itemSelection: ((Int) -> Void)?
    var filteredGames: (([Game]) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    fileprivate func configureUI() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        tableView.register(UINib(nibName: "\(GamesForCategoryCell.self)", bundle: nil), forCellReuseIdentifier: "\(GamesForCategoryCell.self)")
    }
    
    func configure(items: [Game]) {
        allData = items
    }
    
    func filterContent(for searchText: String) {
        filteredData = allData.filter { $0.name?.lowercased().contains(searchText.lowercased()) ?? false }
        tableView.reloadData()
    }
}

extension SearchResultsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(GamesForCategoryCell.self)") as! GamesForCategoryCell
        cell.configure(model: filteredData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        filteredGames?(filteredData)
        itemSelection?(indexPath.item)
    }
}
