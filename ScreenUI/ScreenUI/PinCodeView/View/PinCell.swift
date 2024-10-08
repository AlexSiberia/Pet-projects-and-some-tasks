//
//  PinCell.swift
//  ScreenUI
//
//  Created by Alexander Kurbatov on 16.09.2024.
//

import UIKit

class PinCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    // MARK: - Subviews
    
    // Созданм горизонтальный стэк для размещения в нем изображений пинов
    private lazy var cellImageStack: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .white
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .fill
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.contentMode = .scaleAspectFill
        
        return stack
    }()
    
    private lazy var cellPin1Image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private lazy var cellPin2Image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private lazy var cellPin3Image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private lazy var cellPin4Image: UIImageView = {
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
        contentView.addSubview(cellImageStack)
        cellImageStack.addSubview(cellPin1Image)
        cellImageStack.addSubview(cellPin2Image)
        cellImageStack.addSubview(cellPin3Image)
        cellImageStack.addSubview(cellPin4Image)
        setupConstraints()
    }
    
    // MARK: Constraints
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            cellImageStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellImageStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellImageStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellImageStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellImageStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            cellPin1Image.topAnchor.constraint(equalTo: cellImageStack.topAnchor, constant: 72),
            cellPin1Image.leadingAnchor.constraint(equalTo: cellImageStack.leadingAnchor, constant: contentView.bounds.width / 2 - 98),
            cellPin1Image.widthAnchor.constraint(equalToConstant: 40),
            cellPin1Image.heightAnchor.constraint(equalToConstant: 40),
//            cellPin1Image.bottomAnchor.constraint(equalTo: cellImageStack.bottomAnchor, constant: 36),
            
            cellPin2Image.leadingAnchor.constraint(equalTo: cellPin1Image.trailingAnchor, constant: 12),
            cellPin2Image.topAnchor.constraint(equalTo: cellPin1Image.topAnchor),
            cellPin2Image.widthAnchor.constraint(equalToConstant: 40),
            cellPin2Image.heightAnchor.constraint(equalToConstant: 40),
            
            cellPin3Image.leadingAnchor.constraint(equalTo: cellPin2Image.trailingAnchor, constant: 12),
            cellPin3Image.topAnchor.constraint(equalTo: cellPin1Image.topAnchor),
            cellPin3Image.widthAnchor.constraint(equalToConstant: 40),
            cellPin3Image.heightAnchor.constraint(equalToConstant: 40),
            
            cellPin4Image.leadingAnchor.constraint(equalTo: cellPin3Image.trailingAnchor, constant: 12),
            cellPin4Image.topAnchor.constraint(equalTo: cellPin1Image.topAnchor),
            cellPin4Image.widthAnchor.constraint(equalToConstant: 40),
            cellPin4Image.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    // Конфигурируем ячейку
    func configureCell(dataCell: [UIImage]) {
        cellPin1Image.image = dataCell[0]
        cellPin2Image.image = dataCell[1]
        cellPin3Image.image = dataCell[2]
        cellPin4Image.image = dataCell[3]
    }
}
