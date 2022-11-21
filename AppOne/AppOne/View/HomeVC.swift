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
        configureCollectionView()
        configureDataSource()
    }

    func configureCollectionView() {
        brandsCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: configureLayout())
        brandsCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        view.addSubview(brandsCollectionView)
    }

    func configureLayout() -> UICollectionViewLayout {
        UICollectionViewCompositionalLayout.list(using: UICollectionLayoutListConfiguration(appearance: .grouped))
    }

    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: brandsCollectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            let textLbl = UILabel()
            textLbl.text = itemIdentifier.name
            cell.contentView.addSubview(textLbl)
            return cell
        })
    }
}
