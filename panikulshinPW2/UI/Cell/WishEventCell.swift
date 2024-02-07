//
//  WishEventCell.swift
//  panikulshinPW2
//
//  Created by Paul Nikulshin on 07.02.2024.
//

import UIKit

final class WishEventCell: UICollectionViewCell {
    
    enum Constants {
        static let offset: CGFloat = -15
        static let cornerRadius: CGFloat = 10
        static let backgroundColor: UIColor = .lightGray
        
        static let titleTop: CGFloat = 8
        static let titleLeading: CGFloat = 10
        static let titleFont: UIFont = .boldSystemFont(ofSize: 18)
        
        static let commonTop: CGFloat = 18
        static let commonLeading: CGFloat = 5
        
        static let height: Double = 90
        static let width: Double = 250
    }
    
    static let reuseIdentifier: String = "WishEventCell"
    
    private let wrapView: UIView = UIView()
    private let titleLabel: UILabel = UILabel()
    private let descriptionLabel: UILabel = UILabel()
    private let startDateLabel: UILabel = UILabel()
    private let endDateLabel: UILabel = UILabel()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureWrap()
        configureTitleLabel()
        configureDescriptionLabel()
        configureStartDateLabel()
        configureEndDateLabel()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Cell Configuration
    func configure(with event: WishEventModel) {
        titleLabel.text = event.title
        descriptionLabel.text = event.description
        startDateLabel.text = "Start Date: \(event.startDate)"
        endDateLabel.text = "End Date: \(event.endDate)"
    }
    
    // MARK: - UI Configuration
    private func configureWrap() {
        addSubview(wrapView)

        wrapView.pinCenter(to: self, Constants.offset)
        wrapView.layer.cornerRadius = Constants.cornerRadius
        wrapView.backgroundColor = Constants.backgroundColor
        
        wrapView.setWidth(Constants.width)
        wrapView.setHeight(Constants.height)
    }
    private func configureTitleLabel() {
        addSubview(titleLabel)
        
        titleLabel.textColor = .black
        titleLabel.pinTop(to: wrapView, Constants.titleTop)
        titleLabel.font = Constants.titleFont
        titleLabel.pinLeft(to: wrapView, Constants.titleLeading)
    }
    
    private func configureDescriptionLabel() {
        addSubview(descriptionLabel)
        
        descriptionLabel.textColor = .black
        descriptionLabel.pinTop(to: titleLabel, Constants.commonTop)
        descriptionLabel.pinLeft(to: wrapView, Constants.commonLeading)
    }
    
    private func configureStartDateLabel() {
        addSubview(startDateLabel)
        
        startDateLabel.textColor = .black
        startDateLabel.pinTop(to: descriptionLabel, Constants.commonTop)
        startDateLabel.pinLeft(to: wrapView, Constants.commonLeading)
    }
    
    private func configureEndDateLabel() {
        addSubview(endDateLabel)
        
        endDateLabel.textColor = .black
        endDateLabel.pinTop(to: startDateLabel, Constants.commonTop)
        endDateLabel.pinLeft(to: wrapView, Constants.commonLeading)
    }
}
