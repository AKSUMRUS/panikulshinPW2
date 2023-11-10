//
//  WrittenWishCell.swift
//  panikulshinPW2
//
//  Created by Paul Nikulshin on 11.11.2023.
//

import UIKit

final class WrittenWishCell: UITableViewCell {
    
    static let reuseId: String = "WrittenWishCell"
    
    private let wishLabel: UILabel = UILabel()

    private enum Constants {
        static let wrapColor: UIColor = .white
        static let wrapRadius: CGFloat = 16
        static let wrapOffsetV: CGFloat = 5
        static let wrapOffsetH: CGFloat = 10
        static let wishLabelOffset: CGFloat = 8
    }

    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with wish: String) {
         wishLabel.text = wish
    }
    
    private func configureUI() {
        selectionStyle = .none
        backgroundColor = .clear
         
        let wrap: UIView = UIView()
        addSubview(wrap)
         
        wrap.backgroundColor = Constants.wrapColor
        wrap.layer.cornerRadius = Constants.wrapRadius
        wrap.pinCenterY(to: self, Constants.wrapOffsetV)
        wrap.pinCenterX(to: self, Constants.wrapOffsetH)

        wrap.addSubview(wishLabel)
        wishLabel.pinCenter(to: wrap, Constants.wishLabelOffset)
    }
}
