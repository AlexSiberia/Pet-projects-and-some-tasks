//
//  TextHeaderCell.swift
//  ScreenUI
//
//  Created by Alexander Kurbatov on 02.09.2024.
//

import UIKit

// Ячейка для текста
class TextHeaderCell: UICollectionViewCell {
    static let identifier = "TextHeaderCell"
    
    // MARK: - Subviews
    
    let titleFrame: UILabel = {
        
        // Создаем UILabel
        let label = UILabel()
        
        // Устанавливаем текст для label
        label.text = "Salmon Credit line"
        label.textAlignment = .left
        
        // Отключаем автогенерируемые констрейты
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // Устанавливаем background color
        label.backgroundColor = .white
        
        // Устанавливаем границы (border)
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1
        
        // Устанавливаем тень (shadow)
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = CGSize(width: 0, height: 4)
        label.layer.shadowOpacity = 0.25
        label.layer.shadowRadius = 4
        
        // Устанавливаем непрозрачность (opacity)
        label.alpha = 0
        
        return label
    }()
    
    
    let subHeader: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleFrame)
        contentView.addSubview(subHeader)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Constraints
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
//            // Констрейты для позиции label в родительском view
//            titleFrame.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            titleFrame.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            titleFrame.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
//            titleFrame.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 50),
//            
//            // Устанавливаем размеры (ширина - fill, высота - hug)
//            titleFrame.widthAnchor.constraint(equalToConstant: 335),
//            titleFrame.heightAnchor.constraint(greaterThanOrEqualToConstant: 36)
        ])
    }
}


