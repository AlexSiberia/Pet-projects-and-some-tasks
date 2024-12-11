//
//  KeyCell.swift
//  ScreenUI
//
//  Created by Alexander Kurbatov on 22.09.2024.
//

import UIKit

class KeyCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    weak var delegate: KeyTapDelegate?
    
    // MARK: - Subviews
    
    // Созданм горизонтальный стэк для размещения в нем изображений пинов
    private lazy var keyButtonHorizontalStack1: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .clear
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .fill
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.contentMode = .scaleAspectFill
        
        return stack
    }()
    
    private lazy var keyButtonHorizontalStack2: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .clear
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .fill
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.contentMode = .scaleAspectFill
        
        return stack
    }()
    
    private lazy var keyButtonHorizontalStack3: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .clear
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .fill
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.contentMode = .scaleAspectFill
        
        return stack
    }()
    
    private lazy var keyButtonHorizontalStack4: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .clear
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .fill
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.contentMode = .scaleAspectFill
        
        return stack
    }()
    
    // Создаем вертикальный стек для группировки в нем горизонтальных стеков
    private lazy var keyVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .white
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .fill
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.contentMode = .scaleAspectFill
        
        return stack
    }()
    
    private let buttons: [UIButton] = (0...9).map { number in
        
        var configuration = UIButton.Configuration.filled()
        //        configuration.image = UIImage(named: "Key1")!
        //                    .applyingSymbolConfiguration(.init(pointSize: 100))
        
        configuration.cornerStyle = .capsule
        configuration.contentInsets = .zero
        configuration.titleAlignment = .center
        configuration.baseForegroundColor = UIColor(named: "TextKeyButton")
        //        configuration.imagePlacement = .leading
        //        configuration.imagePadding = -100
        
        
        let textForTitle: String = "\(number)"
        
        // Настраиваем атрибуты текста
        let atributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 36, weight: .regular)
            
        ]
        let attributedText: NSAttributedString = NSAttributedString(string: textForTitle, attributes: atributes)
        
        let button = UIButton(configuration: configuration)
        button.setAttributedTitle(attributedText, for: .normal)
        button.tag = number // Используем tag, чтобы понять какая кнопка была нажата
        
        button.configurationUpdateHandler = { button in
            var config = button.configuration
            config?.baseBackgroundColor = button.isHighlighted ?
            UIColor(named: "TappedKey") :
            UIColor.white
            button.configuration = config
        }
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(buttonTouchDown), for: .touchDown)
        button.addTarget(self, action: #selector(buttonTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        
        return button
    }
    //    private lazy var keyButton1: UIButton = {
    //        var configuration = UIButton.Configuration.filled()
    //        configuration.image = UIImage(named: "Key1")!
    //            .applyingSymbolConfiguration(.init(pointSize: 100))
    //        configuration.cornerStyle = .capsule
    //        configuration.contentInsets = .zero
    //
    //        let button = UIButton(configuration: configuration)
    //
    //        button.configurationUpdateHandler = { button in
    //            var config = button.configuration
    //            config?.baseBackgroundColor = button.isHighlighted ?
    //            UIColor(named: "TappedKey") :
    //            UIColor.white
    //            button.configuration = config
    //        }
    //
    //        button.translatesAutoresizingMaskIntoConstraints = false
    //
    //        button.addTarget(self, action: #selector(buttonTouchDown), for: .touchDown)
    //        button.addTarget(self, action: #selector(buttonTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
    //
    //        return button
    //    }()
    
    
    private lazy var keyButtonDel: UIButton = {
        var identifier: String {
            return String(describing: self)
        }
        
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(named: "KeyDel")!
            .applyingSymbolConfiguration(.init(pointSize: 100))
        configuration.cornerStyle = .capsule
        configuration.contentInsets = .zero
     
        let button = UIButton(configuration: configuration)
        
        button.configurationUpdateHandler = { button in
            var config = button.configuration
            config?.baseBackgroundColor = button.isHighlighted ?
            UIColor(named: "TappedKey") :
            UIColor.white
            button.configuration = config
        }
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(buttonTouchDown), for: .touchDown)
        button.addTarget(self, action: #selector(buttonTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        
        return button
    }()
    
    private lazy var cellKeyImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
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
        contentView.addSubview(keyVerticalStack)
        keyVerticalStack.addSubview(keyButtonHorizontalStack1)
        keyVerticalStack.addSubview(keyButtonHorizontalStack2)
        keyVerticalStack.addSubview(keyButtonHorizontalStack3)
        keyVerticalStack.addSubview(keyButtonHorizontalStack4)
        
        keyButtonHorizontalStack1.addSubview(buttons[1])
        keyButtonHorizontalStack1.addSubview(buttons[2])
        keyButtonHorizontalStack1.addSubview(buttons[3])
        
        keyButtonHorizontalStack2.addSubview(buttons[4])
        keyButtonHorizontalStack2.addSubview(buttons[5])
        keyButtonHorizontalStack2.addSubview(buttons[6])
        
        keyButtonHorizontalStack3.addSubview(buttons[7])
        keyButtonHorizontalStack3.addSubview(buttons[8])
        keyButtonHorizontalStack3.addSubview(buttons[9])
        
        keyButtonHorizontalStack4.addSubview(buttons[0])
        keyButtonHorizontalStack4.addSubview(keyButtonDel)
        
        setupConstraints()
    }
    
    // MARK: Constraints
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            keyVerticalStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            keyVerticalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            keyVerticalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            keyVerticalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            keyButtonHorizontalStack1.topAnchor.constraint(equalTo: keyVerticalStack.topAnchor),
            keyButtonHorizontalStack1.leadingAnchor.constraint(equalTo: keyVerticalStack.leadingAnchor),
            keyButtonHorizontalStack1.trailingAnchor.constraint(equalTo: keyVerticalStack.trailingAnchor),
            keyButtonHorizontalStack1.heightAnchor.constraint(equalToConstant: 80),
            
            buttons[1].heightAnchor.constraint(equalToConstant: 80),
            buttons[1].widthAnchor.constraint(equalToConstant: 80),
            buttons[1].topAnchor.constraint(equalTo: keyButtonHorizontalStack1.topAnchor),
            buttons[1].leadingAnchor.constraint(equalTo: keyButtonHorizontalStack1.leadingAnchor, constant: contentView.bounds.width / 2 - 160),
            
            buttons[2].heightAnchor.constraint(equalToConstant: 80),
            buttons[2].widthAnchor.constraint(equalToConstant: 80),
            buttons[2].topAnchor.constraint(equalTo: keyButtonHorizontalStack1.topAnchor),
            buttons[2].leadingAnchor.constraint(equalTo: buttons[1].trailingAnchor, constant: 40),
            
            buttons[3].heightAnchor.constraint(equalToConstant: 80),
            buttons[3].widthAnchor.constraint(equalToConstant: 80),
            buttons[3].topAnchor.constraint(equalTo: keyButtonHorizontalStack1.topAnchor),
            buttons[3].leadingAnchor.constraint(equalTo: buttons[2].trailingAnchor, constant: 40),
            
            keyButtonHorizontalStack2.topAnchor.constraint(equalTo: keyButtonHorizontalStack1.bottomAnchor,constant: 16),
            keyButtonHorizontalStack2.leadingAnchor.constraint(equalTo: keyVerticalStack.leadingAnchor),
            keyButtonHorizontalStack2.trailingAnchor.constraint(equalTo: keyVerticalStack.trailingAnchor),
            keyButtonHorizontalStack2.heightAnchor.constraint(equalToConstant: 80),
            
            buttons[4].heightAnchor.constraint(equalToConstant: 80),
            buttons[4].widthAnchor.constraint(equalToConstant: 80),
            buttons[4].topAnchor.constraint(equalTo: keyButtonHorizontalStack2.topAnchor),
            buttons[4].leadingAnchor.constraint(equalTo: keyButtonHorizontalStack2.leadingAnchor, constant: contentView.bounds.width / 2 - 160),
            
            buttons[5].heightAnchor.constraint(equalToConstant: 80),
            buttons[5].widthAnchor.constraint(equalToConstant: 80),
            buttons[5].topAnchor.constraint(equalTo: keyButtonHorizontalStack2.topAnchor),
            buttons[5].leadingAnchor.constraint(equalTo:             buttons[4].trailingAnchor, constant: 40),
            
            buttons[6].heightAnchor.constraint(equalToConstant: 80),
            buttons[6].widthAnchor.constraint(equalToConstant: 80),
            buttons[6].topAnchor.constraint(equalTo: keyButtonHorizontalStack2.topAnchor),
            buttons[6].leadingAnchor.constraint(equalTo:             buttons[5].trailingAnchor, constant: 40),
            
            keyButtonHorizontalStack3.topAnchor.constraint(equalTo: keyButtonHorizontalStack2.bottomAnchor,constant: 16),
            keyButtonHorizontalStack3.leadingAnchor.constraint(equalTo: keyVerticalStack.leadingAnchor),
            keyButtonHorizontalStack3.trailingAnchor.constraint(equalTo: keyVerticalStack.trailingAnchor),
            keyButtonHorizontalStack3.heightAnchor.constraint(equalToConstant: 80),
            
            buttons[7].heightAnchor.constraint(equalToConstant: 80),
            buttons[7].widthAnchor.constraint(equalToConstant: 80),
            buttons[7].topAnchor.constraint(equalTo: keyButtonHorizontalStack3.topAnchor),
            buttons[7].leadingAnchor.constraint(equalTo: keyButtonHorizontalStack2.leadingAnchor, constant: contentView.bounds.width / 2 - 160),
            
            buttons[8].heightAnchor.constraint(equalToConstant: 80),
            buttons[8].widthAnchor.constraint(equalToConstant: 80),
            buttons[8].topAnchor.constraint(equalTo: keyButtonHorizontalStack3.topAnchor),
            buttons[8].leadingAnchor.constraint(equalTo:             buttons[7].trailingAnchor, constant: 40),
            
            buttons[9].heightAnchor.constraint(equalToConstant: 80),
            buttons[9].widthAnchor.constraint(equalToConstant: 80),
            buttons[9].topAnchor.constraint(equalTo: keyButtonHorizontalStack3.topAnchor),
            buttons[9].leadingAnchor.constraint(equalTo:             buttons[8].trailingAnchor, constant: 40),
            
            keyButtonHorizontalStack4.topAnchor.constraint(equalTo: keyButtonHorizontalStack3.bottomAnchor,constant: 16),
            keyButtonHorizontalStack4.leadingAnchor.constraint(equalTo: keyVerticalStack.leadingAnchor),
            keyButtonHorizontalStack4.trailingAnchor.constraint(equalTo: keyVerticalStack.trailingAnchor),
            keyButtonHorizontalStack4.heightAnchor.constraint(equalToConstant: 80),
            
            buttons[0].heightAnchor.constraint(equalToConstant: 80),
            buttons[0].widthAnchor.constraint(equalToConstant: 80),
            buttons[0].topAnchor.constraint(equalTo: keyButtonHorizontalStack4.topAnchor),
            buttons[0].leadingAnchor.constraint(equalTo: keyButtonHorizontalStack4.leadingAnchor, constant: contentView.bounds.width / 2 - 40),
            
            keyButtonDel.heightAnchor.constraint(equalToConstant: 80),
            keyButtonDel.widthAnchor.constraint(equalToConstant: 80),
            keyButtonDel.topAnchor.constraint(equalTo: keyButtonHorizontalStack4.topAnchor),
            keyButtonDel.leadingAnchor.constraint(equalTo:             buttons[0].trailingAnchor, constant: 40),
            
        ])
    }
    
    // MARK: Actions
    
    // Кнопка становится прозрачной при нажатии
    @objc private func buttonTouchDown(sender: UIButton) {
        UIButton.animate(withDuration: 0.2) { [self] in
            buttons[sender.tag].alpha = 1
        }
    }
    
    // Восстанавливаем непрозрачность при отпускании или отмене нажатия и обрабатываем событие
    @objc private func buttonTouchUp(sender: UIButton) {
        UIButton.animate(withDuration: 0.2) { [self] in
            buttons[sender.tag].alpha = 1
        }
        
        let buttonValue = "\(sender.tag)"
        delegate?.didUpdateData(buttonValue)
        
        
    }
}


