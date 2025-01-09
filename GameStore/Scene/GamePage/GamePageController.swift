//
//  GamePageController.swift
//  GameStore
//
//  Created by Elnur Mammadov on 03.01.25.
//

import UIKit

class GamePageController: UIViewController {
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var buyView: UIView!
    let viewModel = GamePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        viewModel.readData()
        viewModel.readDataForWishlist()
    }
    
    @IBAction func buyNowButtonAction(_ sender: Any) {
    }
    
    @objc func likeButtonAction() {
        if viewModel.liked == true {
            viewModel.writeToWishlist()
        } else {
            viewModel.removeFromWishlist()
        }
    }
    
    @objc func addToCart() {
        if viewModel.selectedGame != nil {
            viewModel.writeData()
            let alert = UIAlertController(title: "Success", message: "\(viewModel.selectedGame!.name ?? "") added to cart", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "Game already added to cart", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
            present(alert, animated: true)
        }
    }
    
    func configureUI() {
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "\(GamePageCell.self)", bundle: nil), forCellReuseIdentifier: "\(GamePageCell.self)")
        price.text = "\(viewModel.selectedGame?.price ?? 0)"
//        if viewModel.selectedGame != nil {
//            if viewModel.selectedGame?.discountedPrice != 0 {
//                discount.isHidden = false
//                discount.text = "\(viewModel.selectedGame?.price ?? 0)$"
//                price.text = "\(viewModel.selectedGame?.discountedPrice ?? 0)$"
//            } else {
//                discount.isHidden = true
//                price.text = "\(viewModel.selectedGame?.price ?? 0)$"
//            }
//        } else {
//            if viewModel.selectedGameFromCart?.discountedPrice != 0 {
//                discount.isHidden = false
//                discount.text = "\(viewModel.selectedGameFromCart?.price ?? 0)$"
//                price.text = "\(viewModel.selectedGameFromCart?.discountedPrice ?? 0)$"
//            } else {
//                discount.isHidden = true
//                price.text = "\(viewModel.selectedGameFromCart?.price ?? 0)$"
//            }
//        }
        let text = discount.text ?? ""
        let attributes: [NSAttributedString.Key: Any] = [
            .strikethroughStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: UIColor.red
        ]
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        discount.attributedText = attributedString
    }
}

extension GamePageController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(GamePageCell.self)") as! GamePageCell
        if viewModel.selectedGame != nil {
            let game = viewModel.convertModel(game: viewModel.selectedGame!)
            if viewModel.gamesForWishlist.contains(game) {
                cell.configureLikeButton(isLiked: true)
            } else {
                cell.configureLikeButton(isLiked: false)
            }
            if viewModel.selectedGame?.price == 0 {
                title = "Coming Soon"
                cell.configure(item: viewModel.selectedGame!, addCartHidden: true)
                buyView.isHidden = true
            } else {
                cell.configure(item: viewModel.selectedGame!, addCartHidden: false)
            }
        } else {
            if viewModel.gamesForWishlist.contains(viewModel.selectedGameFromCart!) {
                cell.configureLikeButton(isLiked: true)
            } else {
                cell.configureLikeButton(isLiked: false)
            }
            if viewModel.selectedGameFromCart?.price == 0 {
                title = "Coming Soon"
                cell.configureForCart(item: viewModel.selectedGameFromCart!, addCartHidden: true)
                buyView.isHidden = true
            } else {
                cell.configureForCart(item: viewModel.selectedGameFromCart!, addCartHidden: false)
            }
        }
        cell.addCartButton.addTarget(self, action: #selector(addToCart), for: .touchUpInside)
        cell.likeButton.addTarget(self, action: #selector(likeButtonAction), for: .touchUpInside)
        cell.likeAction = { liked in
            self.viewModel.liked = liked
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
                       
                       
                       
