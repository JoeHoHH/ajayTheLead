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
        return collectionV
    }()

    private lazy var dataSource: UICollectionViewDiffableDataSource<SectionTitles, Brands> = {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Brands> { cell, index, res  in
            var contentConfig = cell.defaultContentConfiguration()
            contentConfig.text = res.name
            cell.contentConfiguration = contentConfig
        }

        return UICollectionViewDiffableDataSource(collectionView: brandsCollection) { collectionView, indexPath, itemIdentifier in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(brandsCollection)
        brandsCollection.translatesAutoresizingMaskIntoConstraints = false
        applyConstrains()
        applySnapshot(sec: SectionTitles(title: "Test"), bran: Brands(name: "Mr.Q", headQuarters: "CA", ceo: "Mr.Space"))
    }

    private func applyConstrains() {
        NSLayoutConstraint.activate([
            brandsCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            brandsCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            brandsCollection.topAnchor.constraint(equalTo: view.topAnchor),
            brandsCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func applySnapshot(sec: SectionTitles, bran: Brands) {
        var snapshot = NSDiffableDataSourceSnapshot<SectionTitles, Brands>()
        snapshot.appendSections([sec])
        snapshot.appendItems([bran])
        dataSource.apply(snapshot)
    }
}
