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
            frame: view.bounds,
            collectionViewLayout: UICollectionViewCompositionalLayout.list(using: UICollectionLayoutListConfiguration(appearance: .plain)))
        collectionV.translatesAutoresizingMaskIntoConstraints = false
        return collectionV
    }()

    private lazy var dataSource: UICollectionViewDiffableDataSource<SectionTitle, Brand> = {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Brand> { cell, index, res  in
            var contentConfig = cell.defaultContentConfiguration()
            contentConfig.text = res.name
            contentConfig.secondaryText = res.headQuarters
//            contentConfig.image = UIImage(named: "Flower.png")
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
        applySnapshot(sec: SectionTitle(title: "Test"), bran: Brand(name: "Mr.Q", headQuarters: "CA", ceo: "Mr.Space"))
    }

    private func applyConstrains() {
        NSLayoutConstraint.activate([
            brandsCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            brandsCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            brandsCollection.topAnchor.constraint(equalTo: view.topAnchor),
            brandsCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func applySnapshot(sec: SectionTitle, bran: Brand) {
        var snapshot = NSDiffableDataSourceSnapshot<SectionTitle, Brand>()
        snapshot.appendSections([sec])
        snapshot.appendItems([bran])
        dataSource.apply(snapshot)
    }
}
