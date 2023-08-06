//
//  CardDetailViewController.swift
//  JefersonHearthstone
//
//  Created by Jeferson de Jesus on 05/08/23.
//

import Foundation

protocol CardDetailDisplayLogic: AnyObject {
    func showLoading()
    func hideLoading()
    func showError(message: String)
    func showCard(viewModel: HeartStoneCards.DetailCard.ViewModel)
}

class CardDetailViewController: BaseViewController {
    
    var cardId: String
    var interactor: CardDetailBusinessLogic
    
    init(cardId: String,
         interactor: CardDetailBusinessLogic) {
        self.interactor = interactor
        self.cardId = cardId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var mainView: CardDetailView = {
        let mainView = CardDetailView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchCard()
    }
    
    func setupView() {
        view.addSubview(mainView)
        mainView.fitAllConstraints(on: view)
    }
    
    private func fetchCard() {
        interactor.fetchCard(request: HeartStoneCards.DetailCard.Request(itemId: cardId))
    }
 
}

// MARK: Presenter protocol
extension CardDetailViewController: CardDetailDisplayLogic {
    func showLoading() {
        //mainView.collectionView.refreshControl?.beginRefreshing()
    }
    
    func hideLoading() {
        //mainView.collectionView.refreshControl?.endRefreshing()
    }
    
    func showError(message: String) {
        presentError(message: message, tryAgainCallback: fetchCard)
    }
    
    func showCard(viewModel: HeartStoneCards.DetailCard.ViewModel){
        mainView.updateViewData(with: viewModel)
    }
}
