//
//  WishCalendarViewController.swift
//  panikulshinPW2
//
//  Created by Paul Nikulshin on 07.02.2024.
//

import UIKit


final class WishCalendarViewController: UIViewController {
    
    private let defaults = UserDefaults.standard
    
    enum Constants {
        static let contentInset: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        static let collectionTop: CGFloat = 15
        
        static let collectionWidht: Double = 500
        
        static let addButtonTitle: String = "Add"
        static let addButtonBottom: CGFloat = 15
        static let addButtonHeight: Double = 40
        
        static let eventsKey: String = "events"
    }
    
    func getEventsData() -> [WishEventModel]? {
        if let data = defaults.value(forKey: Constants.eventsKey) as? Data {
            return try? PropertyListDecoder().decode(Array<WishEventModel>.self, from: data)
        }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.reloadData()
        
        configureUI()
    }
    
    private let collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    private let addButton: UIButton = UIButton()
    
    private func configureUI() {
        view.backgroundColor = .black
        
        configureCollection()
        configureAddButton()
    }
    
    private func configureCollection() {
        collectionView.setWidth(Constants.collectionWidht)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .black
        collectionView.alwaysBounceVertical = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = Constants.contentInset
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0

            layout.invalidateLayout()
        }
        
        /* Temporary line */
        collectionView.register(
            WishEventCell.self,
            forCellWithReuseIdentifier: WishEventCell.reuseIdentifier
        )
        
        view.addSubview(collectionView)

        collectionView.pinCenterX(to: view)
        collectionView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        collectionView.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constants.collectionTop)
    }
    
    private func configureAddButton() {
        addButton.setTitle(Constants.addButtonTitle, for: .normal)
        addButton.addTarget(self, action: #selector(addEvent), for: .touchUpInside)
        
        view.addSubview(addButton)
        
        addButton.pinCenterX(to: view)
        addButton.setHeight(Constants.addButtonHeight)
        addButton.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, Constants.addButtonBottom)
        
    }
    
    @objc
    private func addEvent() {
        present(WishEventCreationView(), animated: true)
    }
    
}

// MARK: - UICollectionViewDataSource
extension WishCalendarViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return getEventsData()!.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WishEventCell.reuseIdentifier, for: indexPath)
        
        guard let wishEventCell = cell as? WishEventCell else {
            return cell
        }
        
        wishEventCell.configure(
            with: getEventsData()![indexPath.row]
        )
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension WishCalendarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        // Adjust cell size as needed
        return CGSize(width: collectionView.bounds.width - 10, height: 100)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        print("Cell tapped at index \(indexPath.item)")
    }
}
