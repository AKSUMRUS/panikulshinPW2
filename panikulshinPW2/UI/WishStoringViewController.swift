//
//  WishStoringViewController.swift
//  panikulshinPW2
//
//  Created by Paul Nikulshin on 11.11.2023.
//

import UIKit

final class WishStoringViewController: UIViewController {
    
    private var wishArray: [String] = ["I wish to add cells to the table"]
    
    private let table: UITableView = UITableView(frame: .zero)
    
    enum Constants {
        static let lineWidth: CGFloat = 200
        static let lineHeight: CGFloat = 3.4
        static let lineTop: CGFloat = 10
        static let lineRadius: CGFloat = 5
        
        static let tableOffset: CGFloat = 20
        static let tableRadius: CGFloat = 15
        static let numberOfSections: Int = 2
    }
    
    override func viewDidLoad() {
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
            
            wishCell.configure(with: wishArray[indexPath.row])
            
            return wishCell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constants.numberOfSections
    }
    
    private func addWish(text: String) {
        wishArray.append(text)
        table.reloadData()
    }
}
