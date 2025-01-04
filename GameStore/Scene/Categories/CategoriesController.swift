//
//  CategoriesController.swift
//  GameStore
//
//  Created by Elnur Mammadov on 04.01.25.
//

import UIKit

class CategoriesController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    var categories = [Category]()
    let managerCategory = CoreDataForCategory(context: AppDelegate().persistentContainer.viewContext)
    let gameDatas = GameDatas()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Categories"
        collection.dataSource = self
        collection.delegate = self
        collection.register(UINib(nibName: "\(CategoriesCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(CategoriesCell.self)")
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 180)
        layout.sectionInset = UIEdgeInsets(top: 0, left:20, bottom: 0, right: 20)
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        collection.collectionViewLayout = layout
        
        gameDatas.loadData()
        
        managerCategory.fetchData { data in
            self.categories = data
        }
    }
    

}

extension CategoriesController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CategoriesCell.self)", for: indexPath) as! CategoriesCell
        cell.configure(category: categories[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.size.width/2 - 40, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(GamesForCategoryController.self)") as! GamesForCategoryController
        navigationController?.show(controller, sender: nil)
    }
}

extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
