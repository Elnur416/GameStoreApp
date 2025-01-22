//
//  WishListController.swift
//  GameStore
//
//  Created by Elnur Mammadov on 04.01.25.
//

import UIKit

class WishListController: UIViewController {
    @IBOutlet private weak var table: UITableView!
    private let viewModel = WishListViewModel()
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        viewModel.readData()
    }
    
    fileprivate func configureUI() {
        title = "WishList"
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "\(GamesForCategoryCell.self)", bundle: nil), forCellReuseIdentifier: "\(GamesForCategoryCell.self)")
        table.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
    }
    
    @objc private func refreshAction() {
        viewModel.readData()
        table.reloadData()
        refreshControl.endRefreshing()
    }
}

extension WishListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(GamesForCategoryCell.self)") as! GamesForCategoryCell
        cell.configureForCart(model: viewModel.games[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(identifier: "\(GamePageController.self)") as! GamePageController
        controller.viewModel.selectedGameFromCart = viewModel.games[indexPath.row]
        navigationController?.show(controller, sender: nil)
    }
}
