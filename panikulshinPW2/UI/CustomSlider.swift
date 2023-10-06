//
//  CustomSlider.swift
//  panikulshinPW2
//
//  Created by Paul Nikulshin on 03.10.2023.
//

import UIKit

final class CustomSlider: UIView {
    enum Constraints {
        static let titleTop: CGFloat = 10
        static let titleLeading: CGFloat = 20
        static let sliderBottom: CGFloat = -10
        static let sliderLeading: CGFloat = 20
    }
    
    var valueChanged: ((Double) -> Void)?
    
    let titleView = UILabel()
    let slider = UISlider()
    
    init(title: String, min: Double, max: Double) {
        super.init(frame: .zero)
        
        titleView.text = title
        
        slider.minimumValue = Float(min)
        slider.maximumValue = Float(max)
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        
        configureUI()
    }
    
    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        for view in [slider, titleView] {
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleView.topAnchor.constraint(equalTo: topAnchor, constant: Constraints.titleTop),
            titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constraints.titleLeading),
            
            slider.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            slider.centerXAnchor.constraint(equalTo: centerXAnchor),
            slider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constraints.sliderBottom),
            slider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constraints.sliderLeading)
        ])
    }
    
    @objc
    private func sliderValueChanged() {
        valueChanged?(Double(slider.value))
    }
    
}
