//
//  GamePageController.swift
//  GameStore
//
//  Created by Elnur Mammadov on 03.01.25.
//

import UIKit

class GamePageController: UIViewController {
    @IBOutlet private weak var table: UITableView!
    @IBOutlet private weak var price: UILabel!
    @IBOutlet private weak var buyView: UIView!
    @IBOutlet private weak var addCartButton: UIButton!
    let viewModel = GamePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        viewModel.readData()
        viewModel.readDataForWishlist()
        viewModel.readDataFromCollection()
    }
    
    @IBAction func addCartButtonAction(_ sender: UIButton) {
        if viewModel.selectedGame != nil {
            if viewModel.gamesForCart.contains(viewModel.convertModel(game: viewModel.selectedGame!)) {
                let alert = UIAlertController(title: "Error", message: "\(viewModel.selectedGame?.name ?? "") already added", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .destructive))
                present(alert, animated: true)
            } else {
                if viewModel.gamesOnCollection.contains(viewModel.convertModel(game: viewModel.selectedGame!)) {
                    let alert = UIAlertController(title: "Error", message: "\(viewModel.selectedGame?.name ?? "") already on your collection", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .destructive))
                    present(alert, animated: true)
                } else {
                    let alert = UIAlertController(title: "Success", message: "\(viewModel.selectedGame?.name ?? "") added to cart", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default))
                    present(alert, animated: true)
                    viewModel.writeData()
                }
            }
        } else {
            if viewModel.gamesForCart.contains(viewModel.selectedGameFromCart!) {
                let alert = UIAlertController(title: "Error", message: "\(viewModel.selectedGameFromCart?.name ?? "") already added", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .destructive))
                present(alert, animated: true)
            } else {
                if viewModel.gamesOnCollection.contains(viewModel.selectedGameFromCart!) {
                    let alert = UIAlertController(title: "Error", message: "\(viewModel.selectedGameFromCart?.name ?? "") already on your collection", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .destructive))
                    present(alert, animated: true)
                } else {
                    let alert = UIAlertController(title: "Success", message: "\(viewModel.selectedGameFromCart?.name ?? "") added to cart", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default))
                    present(alert, animated: true)
                    viewModel.writeData()
                }
            }
        }
    }
    
    fileprivate func configureUI() {
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "\(GamePageCell.self)", bundle: nil), forCellReuseIdentifier: "\(GamePageCell.self)")
        if viewModel.selectedGame != nil {
            price.text = "\(viewModel.selectedGame?.price ?? 0)"
        } else {
            price.text = "\(viewModel.selectedGameFromCart?.price ?? 0)"
        }
        let gradient = UIImage.gImage(frame: addCartButton.bounds, colours: [.red, .blue])
        addCartButton.tintColor = UIColor(patternImage: gradient)
        navigationController?.navigationBar.tintColor = .white
    }
}

extension GamePageController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(GamePageCell.self)") as! GamePageCell
        if viewModel.selectedGame != nil {
            cell.configure(item: viewModel.selectedGame!)
        } else {
            cell.configureForCart(item: viewModel.selectedGameFromCart!)
        }
        cell.likeAction = { like in
            self.viewModel.isGameLiked = like
            if like == true {
                self.viewModel.writeToWishlist()
            } else {
                self.viewModel.removeFromWishlist()
            }
        }
        cell.configureLikeButton(isLiked: viewModel.isGameLikedAction())
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
                       
                       
                       
