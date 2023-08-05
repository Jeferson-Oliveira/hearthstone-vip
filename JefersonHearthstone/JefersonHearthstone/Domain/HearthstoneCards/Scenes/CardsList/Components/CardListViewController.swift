//
//  CardListViewController.swift
//  JefersonHearthstone
//
//  Created by Jeferson de Jesus on 05/08/23.
//

import UIKit

protocol CardListDisplayLogic: AnyObject {
    func showLoading()
    func hideLoading()
    func showError(message: String)
    func showCards(viewModel: HeartStoneCards.ListAllCards.ViewModel)
}

class CardListViewController: BaseViewController {
    var interactor: CardListBusinessLogic
    
    var viewModel: HeartStoneCards.ListAllCards.ViewModel? {
        didSet {
            mainView.collectionView.reloadData()
        }
    }
    
    init(interactor: CardListBusinessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var mainView: CardsListView = {
        let mainView = CardsListView()
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        mainView.searchBar.delegate = self
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchCards()
    }
    
    func setupView() {
        view.addSubview(mainView)
        mainView.fitAllConstraints(on: view)
    }
    
    private func fetchCards() {
        interactor.getCards(request: HeartStoneCards.ListAllCards.Request(name: mainView.searchBar.text ?? .empty))
    }
 
}

// MARK: Presenter protocol
extension CardListViewController: CardListDisplayLogic {
    func showLoading() {
        mainView.collectionView.refreshControl?.beginRefreshing()
    }
    
    func hideLoading() {
        mainView.collectionView.refreshControl?.endRefreshing()
    }
    
    func showError(message: String) {
        presentError(message: message, tryAgainCallback: fetchCards)
    }
    
    func showCards(viewModel: HeartStoneCards.ListAllCards.ViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: CollectionView Datasource and Delegate
extension CardListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.cards.count ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.self.description(), for: indexPath) as? CardCollectionViewCell,
              let item = viewModel?.cards[indexPath.row]
        else { return UICollectionViewCell() }
        cell.setup(with: item)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        mainView.searchBar.endEditing(true)
    }
}

extension CardListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        fetchCards()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        fetchCards()
    }
}
