//
//  NavigationBar.swift
//  ScreenUI
//
//  Created by Alexander Kurbatov on 15.09.2024.
//

import UIKit

protocol CustomButtonGoBackCellDelegate: AnyObject {
    func didTapButton(in cell: NavigationBarCell)
}

class NavigationBarCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    weak var delegate: CustomButtonGoBackCellDelegate?
    
    // MARK: - Subviews
    
    private lazy var navBarView: UIView = {
        let navBarView = UIView()
        
        navBarView.backgroundColor = .white
        navBarView.translatesAutoresizingMaskIntoConstraints = false
        
        return navBarView
    }()
    
    private lazy var closeButton: UIButton = {
        
        // Конфигурация SFSymbol
        let configGrayColor = UIImage.SymbolConfiguration(hierarchicalColor: UIColor(named: "CloseButtonPinCodeColor")!) // цвет крестика
        let configWeight = UIImage.SymbolConfiguration(weight: .regular)
        let configGrayAndBold = configGrayColor.applying(configWeight)
        let configLarge = UIImage.SymbolConfiguration(scale: .large)
        let configCrayBoldSmall = configGrayAndBold.applying(configLarge)
        
        var buttonConfiguration = UIButton.Configuration.filled()
        
        // Добавляем крестик и применяем конфигурацию SF Symbol для крестика
        buttonConfiguration.image = UIImage(systemName: "xmark", withConfiguration: configCrayBoldSmall)
        buttonConfiguration.baseBackgroundColor = UIColor.clear

        
        // Создаем саму кнопку
        let button = UIButton(configuration: buttonConfiguration)
        // Настраиваем кнопку
        button.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        //        button.layer.cornerRadius = button.frame.size.width / 2
        button.layer.masksToBounds = true
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.setContentHuggingPriority(.required, for: .vertical)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // Настраиваем действие по нажатию кнопки - lобавляем обработчики событий
        button.addTarget(self, action: #selector(buttonTouchDown), for: .touchDown)
        button.addTarget(self, action: #selector(buttonTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        
        return button
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
        contentView.addSubview(navBarView)
        navBarView.addSubview(closeButton)
        setupConstraints()
    }
    
    // MARK: Constraints
    
    private func setupConstraints() {
        
        // Устанавливаем констрейнты для CollectionView
        NSLayoutConstraint.activate([
            
            navBarView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            navBarView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            navBarView.topAnchor.constraint(equalTo: contentView.topAnchor),
            navBarView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            navBarView.heightAnchor.constraint(equalToConstant: 53),
            
            closeButton.topAnchor.constraint(equalTo: (navBarView.topAnchor), constant: 71),
            closeButton.leadingAnchor.constraint(equalTo: (navBarView.leadingAnchor), constant: 335),
            closeButton.trailingAnchor.constraint(equalTo: (navBarView.trailingAnchor), constant: -16),
//            closeButton.bottomAnchor.constraint(equalTo: (navBarView.bottomAnchor), constant: -17)
           
        ])
    }
    
    // MARK: Actions
    
    // Кнопка становится прозрачной при нажатии
    @objc private func buttonTouchDown() {
        UIButton.animate(withDuration: 0.2) { [self] in
            closeButton.alpha = 0.5
        }
    }
    
    // Восстанавливаем непрозрачность при отпускании или отмене нажатия и обрабатываем событие
    @objc private func buttonTouchUp() {
        UIButton.animate(withDuration: 0.2) { [self] in
            closeButton.alpha = 1.0
        }
        delegate?.didTapButton(in: self)
    }

}
