//
//  ImageButtonCell.swift
//  ScreenUI
//
//  Created by Alexander Kurbatov on 01.09.2024.
//

import UIKit

// Ячейка для изображения и кнопки вверху екрана

@available(iOS 15.0, *)
class ImageButtonCell: UICollectionViewCell {
 static let identifier = "ImageButtonCell"
    
    // MARK: - Subviews
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Mask group")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var closeButton: UIButton = {
        
        let configGrayColor = UIImage.SymbolConfiguration(hierarchicalColor: .gray) // цвет крестика
        let configWeight = UIImage.SymbolConfiguration(weight: .bold)
        let configGrayAndBold = configGrayColor.applying(configWeight)
        let configSmall = UIImage.SymbolConfiguration(scale: .small)
        let configCrayBoldSmall = configGrayAndBold.applying(configSmall)
        
        var buttonConfiguration = UIButton.Configuration.filled()
        // Добавляем крестик
        buttonConfiguration.image = UIImage(systemName: "xmark", withConfiguration: configCrayBoldSmall)
 
        buttonConfiguration.baseBackgroundColor = UIColor(named: "CloseButtonColor")

        buttonConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 9 , leading: 9, bottom: 9, trailing: 9)
       
        let button = UIButton(configuration: buttonConfiguration)

        button.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        button.layer.cornerRadius = button.frame.size.width / 2
        button.layer.masksToBounds = true
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
            
//            closeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 63), // смещаем от верхней границы
//            closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            closeButton.widthAnchor.constraint(equalToConstant: 28),
            closeButton.heightAnchor.constraint(equalToConstant: 28),
            closeButton.topAnchor.constraint(equalTo: image.topAnchor, constant: 63),
            closeButton.leadingAnchor.constraint(equalTo: image.leadingAnchor, constant: 327)
            //            closeButton.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: -20),
            //            closeButton.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -113)
            
        ])
    }
    
}
