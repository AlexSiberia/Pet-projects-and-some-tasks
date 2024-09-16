//
//  InfoCell.swift
//  ScreenUI
//
//  Created by Alexander Kurbatov on 10.09.2024.
//

import UIKit

// Ячейка для текста
class InfoCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
        
    }
    
    // MARK: - Subviews
    
    private lazy var cellText: UILabel = {
        let label = UILabel()
        
        // Устанавливаем текст для label
        let textForSubHeader: String = "More about the Credit line"
        
        // Создаем атрибуты для текста
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.black.withAlphaComponent(0.25) // Цвет тени с прозрачностью
        shadow.shadowOffset = CGSize(width: 0, height: 4) // Смещение тени
        shadow.shadowBlurRadius = 4 // Радиус размытия тени
        
        // Настраиваем атрибуты текста
        let atributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 17, weight: .regular),
            .kern: 0,
            .shadow: shadow
        
        ]
        
        let attributedText: NSAttributedString = NSAttributedString(string: textForSubHeader, attributes: atributes)
        label.attributedText = attributedText
        
        // Настраиваем цвет текста
        label.textColor = UIColor(named: "InfoCellTextColor")
        
        // Настраиваем выравнивание
        label.textAlignment = .left
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
        contentView.addSubview(cellText)
        
        setupConstraints()
    }
    
    // MARK: Constraints
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            cellText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cellText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -37),
            cellText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17),
            cellText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -17),
            cellText.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
}
