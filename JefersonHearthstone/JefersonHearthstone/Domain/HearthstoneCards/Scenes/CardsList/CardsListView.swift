//
//  CardsListView.swift
//  JefersonHearthstone
//
//  Created by Jeferson de Jesus on 05/08/23.
//

import Foundation
import UIKit

class CardsListView: UIView {
    
    private let collectionViewContainerView = UIView()
    
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.estimatedItemSize = CardCollectionViewCell.cellSize
        flowLayout.itemSize = CardCollectionViewCell.cellSize
        flowLayout.minimumInteritemSpacing = 8
        flowLayout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.self.description())
        collectionView.refreshControl = UIRefreshControl()
        collectionView.setCollectionViewLayout(flowLayout, animated: false)
        collectionView.backgroundColor = .black
        return collectionView
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.barStyle = .black
        searchBar.prompt = "hearth_stone_cards".localizable()
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "search".localizable()
        searchBar.showsCancelButton = true
        return searchBar
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        backgroundColor = .black
        setupSearchBar()
        setupCollectionView()
    }
        
    private func setupSearchBar() {
        addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    private func setupCollectionView() {
        addSubview(collectionViewContainerView)
        collectionViewContainerView.addSubview(collectionView)
        collectionViewContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionViewContainerView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 8),
            collectionViewContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            collectionViewContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 8),
            collectionViewContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: collectionViewContainerView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: collectionViewContainerView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: collectionViewContainerView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: collectionViewContainerView.bottomAnchor)
        ])
    }
    
}
