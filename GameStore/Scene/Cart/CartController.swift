//
//  CartController.swift
//  GameStore
//
//  Created by Elnur Mammadov on 04.01.25.
//

import UIKit

class CartController: UIViewController {
    @IBOutlet private weak var table: UITableView!
    @IBOutlet weak var totalPrice: UILabel!
    let viewModel = CartViewModel()
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.readData()
        configureUI()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        table.refreshControl = refreshControl
    }
    
    @objc func refresh(_ sender: Any) {
        viewModel.readData()
        table.reloadData()
        refreshControl.endRefreshing()
        let formattedPrice = String(format: "%.2f", viewModel.getTotalPrice())
        totalPrice.text = "\(formattedPrice)"
    }
    
    func configureUI() {
        title = "Payment"
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "\(GamesForCategoryCell.self)", bundle: nil), forCellReuseIdentifier: "\(GamesForCategoryCell.self)")
        let formattedPrice = String(format: "%.2f", viewModel.getTotalPrice())
        totalPrice.text = "\(formattedPrice)"
    }
    
    @IBAction func confirmOrderButtonAction(_ sender: Any) {
        
    }
}

extension CartController: UITableViewDataSource, UITableViewDelegate {
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
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(GamePageController.self)") as! GamePageController
        controller.viewModel.selectedGameFromCart = viewModel.games[indexPath.row]
        navigationController?.show(controller, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.games.remove(at: indexPath.row)
            viewModel.writeData()
            table.deleteRows(at: [indexPath], with: .fade)
            let formattedPrice = String(format: "%.2f", viewModel.getTotalPrice())
            totalPrice.text = "\(formattedPrice)"
            table.reloadData()
            return
        }
    }
}
