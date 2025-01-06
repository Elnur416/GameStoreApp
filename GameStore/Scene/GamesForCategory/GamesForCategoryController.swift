//
//  GamesForCategoryController.swift
//  GameStore
//
//  Created by Elnur Mammadov on 04.01.25.
//

import UIKit

class GamesForCategoryController: UIViewController {
    @IBOutlet weak var table: UITableView!
    let viewModel = GamesForCategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        viewModel.fetchGames()
        viewModel.getGamesForCategory()
    }
    
    func configureUI() {
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "\(GamesForCategoryCell.self)", bundle: nil), forCellReuseIdentifier: "\(GamesForCategoryCell.self)")
    }
}

extension GamesForCategoryController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.gamesForcategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(GamesForCategoryCell.self)") as! GamesForCategoryCell
        cell.configure(model: viewModel.gamesForcategory[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(GamePageController.self)") as! GamePageController
        controller.selectedGame = viewModel.gamesForcategory[indexPath.row]
        navigationController?.show(controller, sender: nil)
    }
}
