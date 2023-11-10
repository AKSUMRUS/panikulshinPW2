//
//  WishStoringViewController.swift
//  panikulshinPW2
//
//  Created by Paul Nikulshin on 11.11.2023.
//

import UIKit

final class WishStoringViewController: UIViewController {
    
    enum Constants {
        static let lineWidth: CGFloat = 200
        static let lineHeight: CGFloat = 3.4
        static let lineTop: CGFloat = 10
        static let lineRadius: CGFloat = 5
    }
    
    override func viewDidLoad() {
        configureUI()
     }
    
    private func configureUI() {
        view.backgroundColor = .blue
        
        configureLine()
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
}
