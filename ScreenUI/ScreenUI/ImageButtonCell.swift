//
//  ImageButtonCell.swift
//  ScreenUI
//
//  Created by Alexander Kurbatov on 01.09.2024.
//

import UIKit

// Ячейка для изображения и кнопки вверху екрана

class ImageButtonCell: UICollectionViewCell {
 static let identifier = "ImageButtonCell"
    
    // MARK: - Subviews
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Mask group")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        button.backgroundColor = UIColor(named: "CloseButtonColor")
        button.layer.cornerRadius = button.frame.size.width / 2
        button.layer.masksToBounds = true
        
        // Добавляем крестик
        let image = UIImage(systemName: "xmark")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = .darkGray // цвет крестика
        button.contentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.setContentHuggingPriority(.required, for: .vertical)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(image)
        contentView.addSubview(closeButton)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Constraints
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            image.heightAnchor.constraint(equalTo: image.widthAnchor, multiplier: 0.544),
            
            closeButton.topAnchor.constraint(equalTo: image.topAnchor, constant: 63),
            closeButton.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 327)
//            closeButton.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: -20),
//            closeButton.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -113)
            
        ])
    }
    
}
