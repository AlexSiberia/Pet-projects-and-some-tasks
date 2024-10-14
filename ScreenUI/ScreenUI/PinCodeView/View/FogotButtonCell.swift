//
//  FogotButton.swift
//  ScreenUI
//
//  Created by Alexander Kurbatov on 23.09.2024.
//

import UIKit

protocol FogotButtonCellDelegate: AnyObject {
    func didTapFogotButton(in cell: FogotButtonCell)
}

class FogotButtonCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    weak var delegate: FogotButtonCellDelegate?
    
    // MARK: - Subviews
    
    private lazy var fogotButton: UIButton = {
        // Создаем саму кнопку
        let button = UIButton()
        
        // Устанавливаем текст для label
        let textForSubHeader: String = "Я забыл ПИН-код"
        
        // Настраиваем действие по нажатию кнопки - добавляем обработчики событий
        button.addTarget(self, action: #selector(buttonTouchDown), for: .touchDown)
        button.addTarget(self, action: #selector(buttonTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        
        // Настраиваем атрибуты текста
        let atributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14, weight: .semibold),
//            .kern: 0.38
        ]
        let attributedText: NSAttributedString = NSAttributedString(string: textForSubHeader, attributes: atributes)
        
        // Настраиваем кнопку
        button.backgroundColor = .white
        button.frame = CGRect(x: 0, y: 0, width: 116, height: 20)
        button.setAttributedTitle(attributedText, for: .normal)
        button.setTitleColor(UIColor(named: "FogotButtonTextColor"), for: .normal)
        button.titleLabel?.textColor = UIColor(named: "FogotButtonTextColor")
        button.titleLabel?.textAlignment = .center
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
        contentView.addSubview(fogotButton)
        setupConstraints()
    }
    
    // MARK: Constraints
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            fogotButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            fogotButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),    
            fogotButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    // MARK: Actions
    
    // Кнопка становится прозрачной при нажатии
    @objc private func buttonTouchDown() {
        UIButton.animate(withDuration: 0.2) { [self] in
            fogotButton.alpha = 0.5
      
        }
    }
    
    // Восстанавливаем непрозрачность при отпускании или отмене нажатия и обрабатываем событие
    @objc private func buttonTouchUp() {
        UIButton.animate(withDuration: 0.2) { [self] in
            fogotButton.alpha = 1.0
        }
        delegate?.didTapFogotButton(in: self)
    }
}


// MARK: - FirstPinEnteredDelegate

//extension FogotButtonCell: FirstPinEnteredDelegate {
//    func changePinScreenToConfirmScreen() {
//        fogotButton.isHidden = true
//    }
//}
