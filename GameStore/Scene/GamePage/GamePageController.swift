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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "\(GamePageCell.self)", bundle: nil), forCellReuseIdentifier: "\(GamePageCell.self)")
    }
    @IBAction func buyNowButtonAction(_ sender: Any) {
    }
    
}

extension GamePageController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(GamePageCell.self)") as! GamePageCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    UITableView.automaticDimension
    }
}
                       
                       
                       
