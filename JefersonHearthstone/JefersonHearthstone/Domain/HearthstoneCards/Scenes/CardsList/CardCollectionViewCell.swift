//
//  CardCollectionViewCell.swift
//  JefersonHearthstone
//
//  Created by Jeferson de Jesus on 05/08/23.
//

import UIKit
import Kingfisher

class CardCollectionViewCell: UICollectionViewCell {
    
    static let cellSize = CGSize(width: 100, height: 180)
    
    private let coverImageView: UIImageView = {
        let coverImageView = UIImageView()
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        coverImageView.contentMode = .scaleAspectFit
        coverImageView.kf.indicatorType = .activity
        coverImageView.roundCorners(with: 8)
        return coverImageView
    }()
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 1
        nameLabel.textAlignment = .center
        nameLabel.textColor = .white
        return nameLabel
    }()
        
    func setup(with viewModel: HeartStoneCards.ListAllCards.CardListItemViewModel) {
        coverImageView.kf.setImage(with: viewModel.imageUrl, placeholder: UIImage(named: "no_image_icon"))
        nameLabel.text = viewModel.name
        
        setupContentView()
        setupCoverImageView()
        setupNameLabel()
        setupAccessibilty()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        coverImageView.image = nil
        coverImageView.contentMode = .scaleAspectFill
    }
    
    private func setupAccessibilty() {
        contentView.isAccessibilityElement = true
        contentView.accessibilityLabel = nameLabel.text
        contentView.accessibilityHint = "tapToDetail".localizable()
        nameLabel.isAccessibilityElement = false
    }
    
    private func setupContentView() {
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalToConstant: CardCollectionViewCell.cellSize.width),
            contentView.heightAnchor.constraint(equalToConstant: CardCollectionViewCell.cellSize.height)
        ])
    }
    
    private func setupCoverImageView() {
        contentView.addSubview(coverImageView)
        NSLayoutConstraint.activate([
            coverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            coverImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            coverImageView.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
    }
    
    private func setupNameLabel() {
        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: coverImageView.bottomAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
