//
//  WishStoringViewController.swift
//  panikulshinPW2
//
//  Created by Paul Nikulshin on 11.11.2023.
//

import UIKit

final class WishStoringViewController: UIViewController {
    
    private let defaults = UserDefaults.standard
    
    private var wishArray: [String] = [String]()
    
    private let table: UITableView = UITableView(frame: .zero)
    
    enum Constants {
        static let lineWidth: CGFloat = 200
        static let lineHeight: CGFloat = 3.4
        static let lineTop: CGFloat = 10
        static let lineRadius: CGFloat = 5
        
        static let tableOffset: CGFloat = 20
        static let tableRadius: CGFloat = 15
        static let numberOfSections: Int = 2
        static let wishesKey: String = "wishes"
    }
    
    override func viewDidLoad() {
        if(defaults.array(forKey: Constants.wishesKey) as? [String] != nil) {
            wishArray = (defaults.array(forKey: Constants.wishesKey) as? [String])!
        }
        configureUI()
     }
    
    private func configureUI() {
        view.backgroundColor = .blue
        
        configureLine()
        configureTable()
    }
    
    private func configureLine() {
        let line: UIView = UIView()
        view.addSubview(line)
        
        line.setWidth(Constants.lineWidth)
        line.setHeight(Constants.lineHeight)
        line.layer.cornerRadius = Constants.lineRadius
        line.backgroundColor = .gray
        
        line.pinCenterX(to: view)
        line.pinTop(to: view.topAnchor, Constants.lineTop)
    }
    
    private func configureTable() {
        view.addSubview(table)
        
        table.backgroundColor = .red
        table.dataSource = self
        table.separatorStyle = .none
        table.layer.cornerRadius = Constants.tableRadius
        
        table.pinCenterX(to: view)
        table.pinLeft(to: view, Constants.tableOffset)
        table.pinRight(to: view, Constants.tableOffset)
        table.pinBottom(to: view.bottomAnchor, Constants.tableOffset)
        table.pinTop(to: view.topAnchor, Constants.tableOffset)
        
        table.register(WrittenWishCell.self, forCellReuseIdentifier: WrittenWishCell.reuseId)
    }
}

// MARK: - UITableViewDataSource
extension WishStoringViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        if(section == 0) {
            return 1
        } else {
            return wishArray.count
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0) {
            let addCell = AddWishCell()
            
            addCell.addWish = addWish
            
            return addCell
        } else {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: WrittenWishCell.reuseId,
                for: indexPath
            )
            
            guard let wishCell = cell as? WrittenWishCell else { return cell }
            
            wishCell.configure(wish: wishArray[indexPath.row], position: indexPath.row)
            
            wishCell.deleteWish = deleteWish
            
            wishCell.editWish = editWish
            
            return wishCell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constants.numberOfSections
    }
    
    private func addWish(text: String) {
        wishArray.append(text)
        table.reloadData()
        defaults.set(wishArray, forKey: Constants.wishesKey)
    }
    
    private func editWish(text: String, id: Int) {
        wishArray[id] = text
        table.reloadData()
        defaults.set(wishArray, forKey: Constants.wishesKey)
    }
    
    private func deleteWish(id: Int) {
        wishArray.remove(at: id)
        table.reloadData()
        defaults.set(wishArray, forKey: Constants.wishesKey)
    }
}
