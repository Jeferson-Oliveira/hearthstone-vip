//
//  CardListViewController.swift
//  JefersonHearthstone
//
//  Created by Jeferson de Jesus on 05/08/23.
//

import UIKit

protocol CardListDisplayLogic: AnyObject {
    func showError(message: String)
    func showCards(viewModel: HeartStoneCards.ListAllCards.ViewModel)
}

class CardListViewController: BaseViewController {
    
    let interactor: CardListBusinessLogic
    let router: CardListRouterProtocol
    
    var viewModel: HeartStoneCards.ListAllCards.ViewModel? {
        didSet {
            mainView.collectionView.reloadData()
        }
    }
    
    init(router: CardListRouterProtocol,
         interactor: CardListBusinessLogic) {
        self.interactor = interactor
        self.router = router
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
    
    func fetchCards() {
        showLoadingView()
        interactor.getCards(request: HeartStoneCards.ListAllCards.Request(name: mainView.searchBar.text ?? .empty))
    }
 
}

// MARK: Presenter protocol
extension CardListViewController: CardListDisplayLogic {
    func showError(message: String) {
        hideLoadingView()
        presentError(message: message, tryAgainCallback: fetchCards)
    }
    
    func showCards(viewModel: HeartStoneCards.ListAllCards.ViewModel) {
        self.viewModel = viewModel
        hideLoadingView()
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

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let itemId = viewModel?.cards[indexPath.row].id else { return }
        router.goToDetails(idCard: itemId)
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
