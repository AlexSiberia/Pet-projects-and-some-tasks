//
//  ContinueButtonCell.swift
//  ScreenUI
//
//  Created by Alexander Kurbatov on 10.09.2024.
//

import UIKit

protocol CustomButtonCellDelegate: AnyObject {
    func didTapButton(in cell: ContinueButtonCell)
}

// Ячейка для текста
class ContinueButtonCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    weak var delegate: CustomButtonCellDelegate?
    
    // MARK: - Subviews
    
    private lazy var continueButton: UIButton = {
       
        // Создаем саму кнопку
        let button = UIButton()
        
        // Устанавливаем текст для label
        let textForSubHeader: String = "Continue"
        
        // Настраиваем действие по нажатию кнопки - lобавляем обработчики событий
        button.addTarget(self, action: #selector(buttonTouchDown), for: .touchDown)
        button.addTarget(self, action: #selector(buttonTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        
        // Настраиваем атрибуты текста
        let atributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 17, weight: .semibold),
            .kern: 0.38
        ]
        let attributedText: NSAttributedString = NSAttributedString(string: textForSubHeader, attributes: atributes)
        
        // Настраиваем кнопку
        button.backgroundColor = UIColor(named: "ContinueButtonColor")
        button.frame = CGRect(x: 0, y: 0, width: 335, height: 56)
        button.setAttributedTitle(attributedText, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.setContentHuggingPriority(.required, for: .vertical)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
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
        contentView.addSubview(continueButton)
        
        setupConstraints()
    }
    
    // MARK: Constraints
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            continueButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            continueButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            continueButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            continueButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            continueButton.heightAnchor.constraint(equalToConstant: 56)
            
        ])
    }
    
    // MARK: Actions
    
    // Кнопка становится прозрачной при нажатии
    @objc private func buttonTouchDown() {
        UIView.animate(withDuration: 0.2) {
            self.alpha = 0.5
        }
    }
    
    // Восстанавливаем непрозрачность при отпускании или отмене нажатия и обрабатываем событие
    @objc private func buttonTouchUp() {
        UIView.animate(withDuration: 0.2) {
            self.alpha = 1.0
        }
        delegate?.didTapButton(in: self)
    }
}

