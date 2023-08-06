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
        backgroundImageView.contentMode = .scaleAspectFill
        return backgroundImageView
    }()
    
    let overviewTitleLabel: UILabel = {
        let overviewTitleLabel = UILabel()
        overviewTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        return overviewTitleLabel
    }()
    
    let overviewTextView: UITextView = {
        let overviewTextView = UITextView()
        overviewTextView.font = .systemFont(ofSize: 18)
        overviewTextView.translatesAutoresizingMaskIntoConstraints = false
        return overviewTextView
    }()
    
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        setupHeaderView()
        setupOverviewTextView()
    }
    
    private func setupHeaderView() {
        addSubview(headerView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -8),
            headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 8),
            headerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8)
        ])
        setupBackgroundImageView()
    }
    
    func updateViewData(with viewModel: HeartStoneCards.DetailCard.ViewModel) {
        overviewTitleLabel.text = viewModel.name
        overviewTextView.text = viewModel.flavor
        backgroundImageView.kf.setImage(with: viewModel.imageUrl)
    }
    
    private func setupBackgroundImageView() {
        headerView.addSubview(backgroundImageView)
        backgroundImageView.fitAllConstraints(on: headerView)
    }
    
    private func setupOverviewTextView() {
        let stackView = UIStackView(arrangedSubviews: [overviewTitleLabel, overviewTextView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 8),
        ])
        
        overviewTextView.accessibilityTraits = .header
        overviewTextView.isEditable = false
        overviewTextView.backgroundColor = .black
    }
}
