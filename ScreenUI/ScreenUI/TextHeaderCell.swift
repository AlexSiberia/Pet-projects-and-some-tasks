//
//  TextHeaderCell.swift
//  ScreenUI
//
//  Created by Alexander Kurbatov on 02.09.2024.
//

import UIKit

// Ячейка для текста
class TextHeaderCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    // MARK: - Subviews
    
    private lazy var textStack: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .white
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .fill
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.setContentHuggingPriority(.required, for: .horizontal)
//        stack.setContentHuggingPriority(.required, for: .vertical)
        stack.contentMode = .scaleAspectFill
        
        return stack
    }()
    
    private lazy var titleFrame: UILabel = {
        
        // Создаем UILabel
        let label = UILabel()
        
        // Устанавливаем текст для label
        let textForHeader: String = "Salmon Credit line"
        
        // Настраиваем атрибуты текста
        let atributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name:"ArchivoBlack-Regular", size: 28.0) ?? "",
            .kern: 0.38
        ]
        let attributedText: NSAttributedString = NSAttributedString(string: textForHeader, attributes: atributes)
        label.attributedText = attributedText
        
        // Настраиваем выравнивание
        label.textAlignment = .left
        label.numberOfLines = 0
        
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
        
        return label
    }()
    
    
    private lazy var subHeader: UILabel = {
        let label = UILabel()
        
        // Устанавливаем текст для label
        let textForSubHeader: String = "Pay freely for any purchases with QR Ph"
        
        // Настраиваем атрибуты текста
        let atributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 17, weight: .regular),
            .kern: 0
        ]
        let attributedText: NSAttributedString = NSAttributedString(string: textForSubHeader, attributes: atributes)
        label.attributedText = attributedText
        
        // Настраиваем выравнивание
        label.textAlignment = .left
        
        // Устанавливаем background color
        label.backgroundColor = .white
        
        // Отключаем автогенерируемые констрейты
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        contentView.addSubview(textStack)
        textStack.addSubview(titleFrame)
        textStack.addSubview(subHeader)
        
        setupConstraints()
    }
    
    // MARK: Constraints
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            // Констрейты для позиции textStack в родительском view
            textStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            textStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            textStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            textStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            // Констрейты для позиции titleFrame label в родительском view
            titleFrame.leadingAnchor.constraint(equalTo: textStack.leadingAnchor, constant: 20),
            titleFrame.trailingAnchor.constraint(equalTo: textStack.trailingAnchor, constant: -20),
            titleFrame.topAnchor.constraint(equalTo: textStack.topAnchor, constant: 12),
            titleFrame.bottomAnchor.constraint(equalTo: textStack.bottomAnchor, constant: -50),
            titleFrame.heightAnchor.constraint(equalToConstant: 36),
//            titleFrame.widthAnchor.constraint(equalToConstant: 335),
            
            // Устанавливаем размеры (ширина - fill, высота - hug)
//            titleFrame.widthAnchor.constraint(equalToConstant: 335),
//            titleFrame.heightAnchor.constraint(greaterThanOrEqualToConstant: 36)
            
            // Констрейты для позиции subHeader label в родительском view
            subHeader.leadingAnchor.constraint(equalTo: textStack.leadingAnchor, constant: 20),
            subHeader.trailingAnchor.constraint(equalTo: textStack.trailingAnchor, constant: -20),
            subHeader.topAnchor.constraint(equalTo: textStack.topAnchor, constant: 56),
            subHeader.bottomAnchor.constraint(equalTo: textStack.bottomAnchor, constant: -20),
            subHeader.heightAnchor.constraint(equalToConstant: 22),
//            subHeader.widthAnchor.constraint(equalToConstant: 335)
            
        ])
    }
}


