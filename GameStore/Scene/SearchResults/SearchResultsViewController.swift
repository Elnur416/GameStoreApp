//
//  SearchResultsViewController.swift
//  GameStore
//
//  Created by Elnur Mammadov on 03.01.25.
//

import UIKit

class SearchResultsViewController: UIViewController {

    var tableView: UITableView!
        var filteredData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
    }
}

extension SearchResultsViewController: UITableViewDataSource, UITableViewDelegate {
    func filterContent(for searchText: String) {
        // Filtreleme mantığı (örnek veri)
        let allData = ["Forza", "Gta", "Red Dead", "Date", "Diablo"]
        filteredData = allData.filter { $0.lowercased().contains(searchText.lowercased()) }
        tableView.reloadData()
    }
    
    // TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
