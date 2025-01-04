//
//  WishListController.swift
//  GameStore
//
//  Created by Elnur Mammadov on 04.01.25.
//

import UIKit

class WishListController: UIViewController {
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       title = "WishList"
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "\(GamesForCategoryCell.self)", bundle: nil), forCellReuseIdentifier: "\(GamesForCategoryCell.self)")
        
    }
    

}

extension WishListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(GamesForCategoryCell.self)") as! GamesForCategoryCell
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(identifier: "\(GamePageController.self)") as! GamePageController
        navigationController?.show(controller, sender: nil)
    }
}
