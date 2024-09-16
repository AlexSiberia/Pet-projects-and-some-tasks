//
//  TitleCell.swift
//  ScreenUI
//
//  Created by Alexander Kurbatov on 14.09.2024.
//

import UIKit

class TitleCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    // MARK: - Subviews
    
    private lazy var cellView: UIView = {
        let cellView = UIView()
        cellView.translatesAutoresizingMaskIntoConstraints = false
        
        return cellView
    }()
    
    
    private lazy var cellText: UILabel = {
        let label = UILabel()
        
        // Устанавливаем текст для label
        let textForSubHeader: String = "Код быстрого доступа"
        
        // Настраиваем атрибуты текста
        let atributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 24, weight: .semibold),
            .kern: -0.5
        ]
        
        let attributedText: NSAttributedString = NSAttributedString(string: textForSubHeader, attributes: atributes)
        label.attributedText = attributedText
    
        // Настраиваем цвет текста
        label.textColor = .black
        
        // Настраиваем выравнивание
        label.textAlignment = .center
        label.numberOfLines = 0

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
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        contentView.addSubview(cellView)
        cellView.addSubview(cellText)
        
        setupConstraints()
    }
    
    // MARK: Constraints
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            cellText.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 20),
            cellText.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),
            cellText.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            cellText.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),

        ])
    }
}


