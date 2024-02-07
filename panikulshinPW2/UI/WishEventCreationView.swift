//
//  WishEventCreationView.swift
//  panikulshinPW2
//
//  Created by Paul Nikulshin on 07.02.2024.
//

import UIKit

final class WishEventCreationView: UIViewController {
    
    private let defaults = UserDefaults.standard
    
    private var eventsArray: [WishEventModel] = [WishEventModel]()
    
    enum Constants {
        static let width: CGFloat = 200
        static let height: CGFloat = 3.4
        static let top: CGFloat = 10
        static let radius: CGFloat = 5
        
        static let tableOffset: CGFloat = 20
        static let tableRadius: CGFloat = 15
        static let eventsKey: String = "events"
        
        static let buttonText: String = "Add"
        static let offset: CGFloat = 15
        static let cornerRadius: CGFloat = 10
        static let backgroundColor: UIColor = .lightGray
        
        static let commonTop: CGFloat = 20
        static let commonLeading: CGFloat = 5
        
        static let commonHeight: Double = 120
        static let commonWidth: Double = 250
    }
    
    private let wrapView: UIView = UIView()
    private let titleText: UITextView = UITextView()
    private let descriptionText: UITextView = UITextView()
    private let startDateText: UITextView = UITextView()
    private let endDateText: UITextView = UITextView()
    private let button: UIButton = UIButton(type: .system)
    
    func saveEventsData(events: [WishEventModel]) {
        defaults.set(try? PropertyListEncoder().encode(events), forKey: Constants.eventsKey)
    }

    func getEventsData() -> [WishEventModel]? {
        if let data = defaults.value(forKey: Constants.eventsKey) as? Data {
            return try? PropertyListDecoder().decode(Array<WishEventModel>.self, from: data)
        }
        return nil
    }
    
    override func viewDidLoad() {
        if(getEventsData() != nil) {
            eventsArray = getEventsData()!
        }
        configureUI()
     }
    
    private func configureUI() {
        view.backgroundColor = .black
        
        configureWrap()
        configureTitle()
        configureDescription()
        configureStartDate()
        configureEndDate()
        configureButton()
    }
    
    // MARK: - UI Configuration
    private func configureWrap() {
        view.addSubview(wrapView)

        wrapView.pinCenter(to: view, Constants.offset)
        wrapView.layer.cornerRadius = Constants.cornerRadius
        wrapView.backgroundColor = Constants.backgroundColor
        
        wrapView.setWidth(Constants.commonWidth)
        wrapView.setHeight(Constants.commonHeight)
    }
    private func configureTitle() {
        view.addSubview(titleText)
        
        titleText.textColor = .black
        titleText.pinTop(to: wrapView, Constants.commonTop)
        titleText.setHeight(20)
        titleText.pinRight(to: wrapView)
        titleText.pinLeft(to: wrapView, Constants.commonLeading)
        titleText.isEditable = true
    }
    
    private func configureDescription() {
        view.addSubview(descriptionText)
        
        descriptionText.textColor = .black
        descriptionText.pinTop(to: titleText, Constants.commonTop)
        descriptionText.setHeight(20)
        descriptionText.pinRight(to: wrapView)
        descriptionText.pinLeft(to: wrapView, Constants.commonLeading)
        descriptionText.isEditable = true
    }
    
    private func configureStartDate() {
        view.addSubview(startDateText)
        
        startDateText.textColor = .black
        startDateText.pinTop(to: descriptionText, Constants.commonTop)
        startDateText.setHeight(20)
        startDateText.pinRight(to: wrapView)
        startDateText.pinLeft(to: wrapView, Constants.commonLeading)
        startDateText.isEditable = true
    }
    
    private func configureEndDate() {
        view.addSubview(endDateText)
        
        endDateText.textColor = .black
        endDateText.pinTop(to: startDateText, Constants.commonTop)
        endDateText.setHeight(20)
        endDateText.pinRight(to: wrapView)
        endDateText.pinLeft(to: wrapView, Constants.commonLeading)
        endDateText.isEditable = true
    }
    
    private func configureButton() {
        view.addSubview(button)
        button.setTitle(Constants.buttonText, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.pinCenterX(to: wrapView)
        button.pinTop(to: wrapView.bottomAnchor, Constants.offset)
        button.addTarget(self, action: #selector(addEvent), for: .touchUpInside)
    }
    
    @objc
    private func addEvent() {
        if(
            !titleText.text.isEmpty &&
            !startDateText.text.isEmpty &&
            !endDateText.text.isEmpty
        ) {
            let event = WishEventModel(title: titleText.text, description: descriptionText.text, startDate: startDateText.text, endDate: endDateText.text)
            eventsArray.append(event)
            saveEventsData(events: eventsArray)
            dismiss(animated: true)
        }
    }
}
