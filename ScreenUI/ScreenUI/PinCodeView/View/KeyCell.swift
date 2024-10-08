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
    
    private lazy var keyButton1: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(named: "Key1")!
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
    
    private lazy var keyButton2: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(named: "Key2")!
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
    
    private lazy var keyButton3: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(named: "Key3")!
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
    
    private lazy var keyButton4: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(named: "Key4")!
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
    
    private lazy var keyButton5: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(named: "Key5")!
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
    
    private lazy var keyButton6: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(named: "Key6")!
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
    private lazy var keyButton7: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(named: "Key7")!
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
    
    private lazy var keyButton8: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(named: "Key8")!
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
    
    private lazy var keyButton9: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(named: "Key9")!
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
    
    private lazy var keyButton0: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(named: "Key0")!
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
        button.addTarget(keyButtonDel, action: #selector(buttonTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        return button
    }()
    
    private lazy var keyButtonDel: UIButton = {
        var identifier: String {
            return String(describing: self)
        }
        
        var configuration = UIButton.Configuration.filled()
        configuration.image = UIImage(named: "KeyDel")!
            .applyingSymbolConfiguration(.init(pointSize: 100))
        configuration.cornerStyle = .capsule
        configuration.contentInsets = .zero
//        configuration.title = "Del"
        
        
        
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
        
        keyButtonHorizontalStack1.addSubview(keyButton1)
        keyButtonHorizontalStack1.addSubview(keyButton2)
        keyButtonHorizontalStack1.addSubview(keyButton3)
        
        keyButtonHorizontalStack2.addSubview(keyButton4)
        keyButtonHorizontalStack2.addSubview(keyButton5)
        keyButtonHorizontalStack2.addSubview(keyButton6)
        
        keyButtonHorizontalStack3.addSubview(keyButton7)
        keyButtonHorizontalStack3.addSubview(keyButton8)
        keyButtonHorizontalStack3.addSubview(keyButton9)
        
        keyButtonHorizontalStack4.addSubview(keyButton0)
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
            
            keyButton1.heightAnchor.constraint(equalToConstant: 80),
            keyButton1.widthAnchor.constraint(equalToConstant: 80),
            keyButton1.topAnchor.constraint(equalTo: keyButtonHorizontalStack1.topAnchor),
            keyButton1.leadingAnchor.constraint(equalTo: keyButtonHorizontalStack1.leadingAnchor, constant: contentView.bounds.width / 2 - 160),
            
            keyButton2.heightAnchor.constraint(equalToConstant: 80),
            keyButton2.widthAnchor.constraint(equalToConstant: 80),
            keyButton2.topAnchor.constraint(equalTo: keyButtonHorizontalStack1.topAnchor),
            keyButton2.leadingAnchor.constraint(equalTo: keyButton1.trailingAnchor, constant: 40),
            
            keyButton3.heightAnchor.constraint(equalToConstant: 80),
            keyButton3.widthAnchor.constraint(equalToConstant: 80),
            keyButton3.topAnchor.constraint(equalTo: keyButtonHorizontalStack1.topAnchor),
            keyButton3.leadingAnchor.constraint(equalTo: keyButton2.trailingAnchor, constant: 40),
            
            keyButtonHorizontalStack2.topAnchor.constraint(equalTo: keyButtonHorizontalStack1.bottomAnchor,constant: 16),
            keyButtonHorizontalStack2.leadingAnchor.constraint(equalTo: keyVerticalStack.leadingAnchor),
            keyButtonHorizontalStack2.trailingAnchor.constraint(equalTo: keyVerticalStack.trailingAnchor),
            keyButtonHorizontalStack2.heightAnchor.constraint(equalToConstant: 80),
            
            keyButton4.heightAnchor.constraint(equalToConstant: 80),
            keyButton4.widthAnchor.constraint(equalToConstant: 80),
            keyButton4.topAnchor.constraint(equalTo: keyButtonHorizontalStack2.topAnchor),
            keyButton4.leadingAnchor.constraint(equalTo: keyButtonHorizontalStack2.leadingAnchor, constant: contentView.bounds.width / 2 - 160),
            
            keyButton5.heightAnchor.constraint(equalToConstant: 80),
            keyButton5.widthAnchor.constraint(equalToConstant: 80),
            keyButton5.topAnchor.constraint(equalTo: keyButtonHorizontalStack2.topAnchor),
            keyButton5.leadingAnchor.constraint(equalTo: keyButton4.trailingAnchor, constant: 40),
            
            keyButton6.heightAnchor.constraint(equalToConstant: 80),
            keyButton6.widthAnchor.constraint(equalToConstant: 80),
            keyButton6.topAnchor.constraint(equalTo: keyButtonHorizontalStack2.topAnchor),
            keyButton6.leadingAnchor.constraint(equalTo: keyButton5.trailingAnchor, constant: 40),
            
            keyButtonHorizontalStack3.topAnchor.constraint(equalTo: keyButtonHorizontalStack2.bottomAnchor,constant: 16),
            keyButtonHorizontalStack3.leadingAnchor.constraint(equalTo: keyVerticalStack.leadingAnchor),
            keyButtonHorizontalStack3.trailingAnchor.constraint(equalTo: keyVerticalStack.trailingAnchor),
            keyButtonHorizontalStack3.heightAnchor.constraint(equalToConstant: 80),
            
            keyButton7.heightAnchor.constraint(equalToConstant: 80),
            keyButton7.widthAnchor.constraint(equalToConstant: 80),
            keyButton7.topAnchor.constraint(equalTo: keyButtonHorizontalStack3.topAnchor),
            keyButton7.leadingAnchor.constraint(equalTo: keyButtonHorizontalStack2.leadingAnchor, constant: contentView.bounds.width / 2 - 160),
            
            keyButton8.heightAnchor.constraint(equalToConstant: 80),
            keyButton8.widthAnchor.constraint(equalToConstant: 80),
            keyButton8.topAnchor.constraint(equalTo: keyButtonHorizontalStack3.topAnchor),
            keyButton8.leadingAnchor.constraint(equalTo: keyButton7.trailingAnchor, constant: 40),
            
            keyButton9.heightAnchor.constraint(equalToConstant: 80),
            keyButton9.widthAnchor.constraint(equalToConstant: 80),
            keyButton9.topAnchor.constraint(equalTo: keyButtonHorizontalStack3.topAnchor),
            keyButton9.leadingAnchor.constraint(equalTo: keyButton8.trailingAnchor, constant: 40),
            
            keyButtonHorizontalStack4.topAnchor.constraint(equalTo: keyButtonHorizontalStack3.bottomAnchor,constant: 16),
            keyButtonHorizontalStack4.leadingAnchor.constraint(equalTo: keyVerticalStack.leadingAnchor),
            keyButtonHorizontalStack4.trailingAnchor.constraint(equalTo: keyVerticalStack.trailingAnchor),
            keyButtonHorizontalStack4.heightAnchor.constraint(equalToConstant: 80),
            
            keyButton0.heightAnchor.constraint(equalToConstant: 80),
            keyButton0.widthAnchor.constraint(equalToConstant: 80),
            keyButton0.topAnchor.constraint(equalTo: keyButtonHorizontalStack4.topAnchor),
            keyButton0.leadingAnchor.constraint(equalTo: keyButtonHorizontalStack4.leadingAnchor, constant: contentView.bounds.width / 2 - 40),
            
            keyButtonDel.heightAnchor.constraint(equalToConstant: 80),
            keyButtonDel.widthAnchor.constraint(equalToConstant: 80),
            keyButtonDel.topAnchor.constraint(equalTo: keyButtonHorizontalStack4.topAnchor),
            keyButtonDel.leadingAnchor.constraint(equalTo: keyButton0.trailingAnchor, constant: 40),
            
        ])
    }
    
    // MARK: Actions
    
    // Кнопка становится прозрачной при нажатии
    @objc private func buttonTouchDown() {
        UIButton.animate(withDuration: 0.2) { [self] in
            keyButtonDel.alpha = 1
        }
    }
    
    // Восстанавливаем непрозрачность при отпускании или отмене нажатия и обрабатываем событие
    @objc private func buttonTouchUp(sender: UIButton) {
        UIButton.animate(withDuration: 0.2) { [self] in
            keyButtonDel.alpha = 1.0
        }
        delegate?.didUpdateData(String(sender.currentImage.hashValue))
//        print(String(describing: type(of: self)))
//        delegate?.didTapFogotButton(in: self)
        
    }
}


