//
//  AddWishCell.swift
//  panikulshinPW2
//
//  Created by Paul Nikulshin on 11.11.2023.
//

import UIKit

final class AddWishCell: UITableViewCell {
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        let text = UITextView()
        addSubview(text)
        
        text.text = "Add wish" // just for test
        text.setHeight(30) // just for test
        text.setWidth(30) // just for test
        text.backgroundColor = .yellow // just for test
    }
}
