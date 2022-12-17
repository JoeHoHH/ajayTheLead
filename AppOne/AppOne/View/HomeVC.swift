//
//  HomeVC.swift
//  AppOne
//
//  Created by Asapu, Ajaikumar on 19.11.22.
//

import UIKit

final class HomeVC: UIViewController {
    private lazy var brandsCollection: UICollectionView = {
        let collectionV = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewCompositionalLayout.list(using: UICollectionLayoutListConfiguration(appearance: .plain)))
        collectionV.translatesAutoresizingMaskIntoConstraints = false
        return collectionV
    }()

    private lazy var homeVM = HomeViewModel()

    private lazy var dataSource: UICollectionViewDiffableDataSource<SectionTitle, Brand> = {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Brand> { cell, index, res  in
            var contentConfig = cell.defaultContentConfiguration()
            contentConfig.text = res.name
            contentConfig.secondaryText = res.headQuarters
            contentConfig.image = UIImage(named: "Flower.png")
            contentConfig.imageProperties.maximumSize = CGSize(width: 24, height: 24)
            cell.contentConfiguration = contentConfig
        }

        return UICollectionViewDiffableDataSource(collectionView: brandsCollection) { collectionView, indexPath, itemIdentifier in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(brandsCollection)
        applyConstrains()
        applySnapshot(sec: homeVM.fetchDataForSections(), bran: homeVM.fetchDataForItems())
    }

    private func fetchDataFromService() async {
//        Task {
//            try await ServiceLayer().fetchUsers()
//        }
    }

    private func applyConstrains() {
        NSLayoutConstraint.activate(
            [
                brandsCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                brandsCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                brandsCollection.topAnchor.constraint(equalTo: view.topAnchor),
                brandsCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ]
        )
    }

    private func applySnapshot(sec: [SectionTitle], bran: [Brand]) {
        var snapshot = dataSource.snapshot()
        snapshot.appendSections(sec)
        snapshot.appendItems(bran)
        dataSource.apply(snapshot)
    }
}
