//
//  HomeVC.swift
//  AppOne
//
//  Created by Asapu, Ajaikumar on 19.11.22.
//

import UIKit

class HomeVC: UIViewController {
    private var brandsCollectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<SectionTitles, Brands>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  configureCollectionView()
        configureDataSource()
        applySnapshot()
    }

    func configureCollectionView() {
//        brandsCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: configureLayout())
//        brandsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
//        view.addSubview(brandsCollectionView)
    }

//    func configureLayout() -> UICollectionViewLayout {
//        UICollectionViewCompositionalLayout.list(using: UICollectionLayoutListConfiguration(appearance: .plain))
//    }

    func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<SectionTitles, Brands> { cell, indexPath, item in
            var contentConfiguration = cell.defaultContentConfiguration()
            contentConfiguration.text = "\(item)"
            contentConfiguration.textProperties.color = .lightGray
            cell.contentConfiguration = contentConfiguration
        }

        dataSource = UICollectionViewDiffableDataSource<SectionTitles, Brands>(collectionView: brandsCollectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Int) -> UICollectionViewCell? in

            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration,
                                                                for: indexPath,
                                                                item: itemIdentifier)
        }
    }

    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<SectionTitles, Brands>()
        dataSource.apply(snapshot)
    }
}
