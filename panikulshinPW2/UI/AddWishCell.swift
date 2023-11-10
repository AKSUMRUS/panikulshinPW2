//
//  AddWishCell.swift
//  panikulshinPW2
//
//  Created by Paul Nikulshin on 11.11.2023.
//

import UIKit

final class AddWishCell: UITableViewCell {
    
    private let text: UITextView = UITextView()
    
    private let button: UIButton = UIButton(type: .system)
    
    var addWish: ((String) -> ())?
    
    private enum Constants {
        static let buttonText: String = "Add"
        static let offset: CGFloat = 10
    }
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.isUserInteractionEnabled = true
        
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        selectionStyle = .none
        backgroundColor = .clear
         
        configureButton()
        configureText()
    }
    
    private func configureText() {
        contentView.addSubview(text)
        text.backgroundColor = .systemRed
        text.pinCenterY(to: contentView)
        text.pinLeft(to: contentView.leadingAnchor, Constants.offset)
        text.pinRight(to: button.leadingAnchor, Constants.offset)
        text.pinTop(to: contentView.topAnchor)
        text.pinBottom(to: contentView.bottomAnchor)
        text.isEditable = true
    }
    
    private func configureButton() {
        contentView.addSubview(button)
        button.setTitle(Constants.buttonText, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.pinCenterY(to: contentView)
        button.pinRight(to: contentView, Constants.offset)
        button.addTarget(self, action: #selector(buttorPressed), for: .touchUpInside)
    }
    
    @objc
    private func buttorPressed() {
        if(!text.text.isEmpty && addWish != nil) {
            addWish!(text.text)
        }
    }
}
