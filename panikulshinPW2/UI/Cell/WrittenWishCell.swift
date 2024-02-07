//
//  WrittenWishCell.swift
//  panikulshinPW2
//
//  Created by Paul Nikulshin on 11.11.2023.
//

import UIKit

final class WrittenWishCell: UITableViewCell {
    
    static let reuseId: String = "WrittenWishCell"
    
    private let text: UITextView = UITextView()
    
    private let buttonDelete: UIButton = UIButton(type: .system)
    private let buttonEdit: UIButton = UIButton(type: .system)
    
    var position: Int?
    
    var deleteWish: ((Int) -> ())?
    var editWish: ((String, Int) -> ())?
    
    private enum Constants {
        static let buttonDeleteText: String = "D"
        static let buttonEditText: String = "E"
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
         
        configureButtonDelete()
        configureButtonEdit()
        configureText()
    }
    
    private func configureText() {
        contentView.addSubview(text)
        text.backgroundColor = .systemRed
        text.pinCenterY(to: contentView)
        text.pinLeft(to: contentView.leadingAnchor, Constants.offset)
        text.pinRight(to: buttonEdit.leadingAnchor, Constants.offset)
        text.pinTop(to: contentView.topAnchor)
        text.pinBottom(to: contentView.bottomAnchor)
        text.isEditable = true
    }
    
    private func configureButtonDelete() {
        contentView.addSubview(buttonDelete)
        buttonDelete.setTitle(Constants.buttonDeleteText, for: .normal)
        buttonDelete.setTitleColor(.white, for: .normal)
        buttonDelete.pinCenterY(to: contentView)
        buttonDelete.pinRight(to: contentView, Constants.offset)
        buttonDelete.addTarget(self, action: #selector(buttorPressed), for: .touchUpInside)
    }
    
    private func configureButtonEdit() {
        contentView.addSubview(buttonEdit)
        buttonEdit.setTitle(Constants.buttonEditText, for: .normal)
        buttonEdit.setTitleColor(.white, for: .normal)
        buttonEdit.pinCenterY(to: contentView)
        buttonEdit.pinLeft(to: buttonDelete.leadingAnchor, Constants.offset)
        buttonEdit.addTarget(self, action: #selector(buttorEditPressed), for: .touchUpInside)
    }
    
    @objc
    private func buttorPressed() {
        if(deleteWish != nil && position != nil) {
            deleteWish!(position!)
        }
    }
    
    @objc
    private func buttorEditPressed() {
        if(editWish != nil && position != nil) {
            editWish!(text.text, position!)
            
        }
    }

    func configure(wish: String, position: Int) {
        text.text = wish
        self.position = position
    }
}
