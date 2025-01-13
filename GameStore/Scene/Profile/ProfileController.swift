//
//  ProfileController.swift
//  GameStore
//
//  Created by Elnur Mammadov on 04.01.25.
//

import UIKit

class ProfileController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var fullname: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!
    let viewModel = ProfileViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        viewModel.readUserData()
        viewModel.readGameData()
        configureUserData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.readGameData()
        collection.reloadData()
    }
    
    func configureUserData() {
        let index = viewModel.manager.getIndex(key: .getUserIndex)
        fullname.text = viewModel.users[index].fullname
        phone.text = viewModel.users[index].phone
        email.text = viewModel.users[index].email
    }
    
    func configureUI() {
        title = "Profile"
        collection.dataSource = self
        collection.delegate = self
        collection.register(UINib(nibName: "\(FooterCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(FooterCell.self)")
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 180)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collection.collectionViewLayout = layout
    }
}

extension ProfileController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FooterCell.self)", for: indexPath) as! FooterCell
        cell.configureForProfile(item: viewModel.games[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/3, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(GamePageController.self)") as! GamePageController
        controller.viewModel.selectedGameFromCart = viewModel.games[indexPath.row]
        navigationController?.show(controller, sender: nil)
    }
}
