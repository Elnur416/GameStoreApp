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
    @IBOutlet weak var confirmButton: UIButton!
    let viewModel = CartViewModel()
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.readData()
        configureUI()
        viewModel.readFromCollection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.readData()
        viewModel.readFromCollection()
        table.reloadData()
        configureTotalPrice()
    }
    
    func configureUI() {
        title = "Payment"
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "\(GamesForCategoryCell.self)", bundle: nil), forCellReuseIdentifier: "\(GamesForCategoryCell.self)")
        let gradient = UIImage.gImage(frame: confirmButton.bounds, colours: [.red, .blue])
        confirmButton.tintColor = UIColor(patternImage: gradient)
        configureTotalPrice()
    }
    
    func configureTotalPrice() {
        let formattedPrice = String(format: "%.2f", viewModel.getTotalPrice())
        totalPrice.text = "\(formattedPrice)"
    }
    
    @IBAction func confirmOrderButtonAction(_ sender: Any) {
        if viewModel.games.isEmpty {
            let alert = UIAlertController(title: "Error", message: "Cart is empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .destructive))
            present(alert, animated: true)
        } else {
            if viewModel.manager.getBool(key: .isCardAdded) {
                viewModel.getCollection()
                viewModel.games.removeAll()
                viewModel.writeData()
                configureTotalPrice()
                table.reloadData()
                let controller = storyboard?.instantiateViewController(withIdentifier: "\(SuccessController.self)") as! SuccessController
                navigationController?.present(controller, animated: true)
            } else {
                let controller = storyboard?.instantiateViewController(withIdentifier: "\(CardRegisterController.self)") as! CardRegisterController
                navigationController?.present(controller, animated: true)
            }
        }
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
            configureTotalPrice()
            table.reloadData()
            return
        }
    }
}
