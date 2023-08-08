//
//  CardDetailView.swift
//  JefersonHearthstone
//
//  Created by Jeferson de Jesus on 05/08/23.
//

import Foundation
import UIKit

class CardDetailView: UIView {
        
    let headerView: UIView = {
        let headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    let backgroundImageView: UIImageView = {
        let backgroundImageView = UIImageView()
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.kf.indicatorType = .activity
        backgroundImageView.roundCorners(with: 16)
        backgroundImageView.contentMode = .scaleAspectFit
        return backgroundImageView
    }()
    
    lazy var infoStackView: UIStackView = {
        let infoStackView = UIStackView(arrangedSubviews: [overviewTitleLabel])
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.axis = .vertical
        infoStackView.distribution = .fillProportionally
        infoStackView.spacing = 8
        return infoStackView
    }()
    
    let overviewTitleLabel: UILabel = {
        let overviewTitleLabel = UILabel()
        overviewTitleLabel.accessibilityTraits = .header
        overviewTitleLabel.font = .systemFont(ofSize: 18, weight: .bold)
        overviewTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return overviewTitleLabel
    }()
    
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func updateViewData(with viewModel: HeartStoneCards.DetailCard.ViewModel) {
        overviewTitleLabel.text = viewModel.name
        backgroundImageView.kf.setImage(with: viewModel.imageUrl)
        infoStackView.addArrangedSubview(getInfoLabel(viewModel.flavor, numberOfLines: 0))
        infoStackView.addArrangedSubview(getInfoLabel(viewModel.shortDescription))
        infoStackView.addArrangedSubview(getInfoLabel(viewModel.health))
        infoStackView.addArrangedSubview(getInfoLabel(viewModel.faction))
        infoStackView.addArrangedSubview(getInfoLabel(viewModel.cost))
        infoStackView.addArrangedSubview(getInfoLabel(viewModel.atack))
        infoStackView.addArrangedSubview(getInfoLabel(viewModel.type))
    }
    
    func setup() {
        backgroundColor = .black
        setupHeaderView()
        setupOverviewTextView()
    }
    
    private func setupHeaderView() {
        addSubview(headerView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -8),
            headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 8),
            headerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5)
        ])
        setupBackgroundImageView()
    }
    
    private func setupBackgroundImageView() {
        headerView.addSubview(backgroundImageView)
        backgroundImageView.fitAllConstraints(on: headerView)
    }
    
    private func setupOverviewTextView() {
        addSubview(infoStackView)
        NSLayoutConstraint.activate([
            infoStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 16),
            infoStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 8),
            infoStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            infoStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 8),
        ])
    }
    
    private func getInfoLabel(_ text: String?, numberOfLines: Int = 1) -> UILabel {
        let infoLabel = UILabel()
        infoLabel.numberOfLines = numberOfLines
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.text = text
        return infoLabel
    }
    
}
