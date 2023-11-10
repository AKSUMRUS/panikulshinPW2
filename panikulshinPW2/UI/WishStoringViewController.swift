//
//  WishStoringViewController.swift
//  panikulshinPW2
//
//  Created by Paul Nikulshin on 11.11.2023.
//

import UIKit

final class WishStoringViewController: UIViewController {
    
    private let table: UITableView = UITableView(frame: .zero)
    
    enum Constants {
        static let lineWidth: CGFloat = 200
        static let lineHeight: CGFloat = 3.4
        static let lineTop: CGFloat = 10
        static let lineRadius: CGFloat = 5
        
        static let tableOffset: CGFloat = 20
        static let tableRadius: CGFloat = 15
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
        
        table.setWidth(100) // just for test
        table.setHeight(100) // just for test
        table.pinCenterX(to: view)
        table.pinTop(to: view.topAnchor, Constants.tableOffset)
    }
}

// MARK: - UITableViewDataSource
extension WishStoringViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
