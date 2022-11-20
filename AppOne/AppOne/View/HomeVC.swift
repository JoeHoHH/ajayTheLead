//
//  HomeVC.swift
//  AppOne
//
//  Created by Asapu, Ajaikumar on 19.11.22.
//

import UIKit

class HomeVC: UIViewController {
    private var brandsCollectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Brands, Brands>!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureDataSource()
    }

    func configureCollectionView() {
        brandsCollectionView = UICollectionView(frame: view.bounds)
        view.addSubview(brandsCollectionView)
    }

    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: brandsCollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in

            return UICollectionViewCell()
        })
    }
}
