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
    
    // Создаем сруктуру данных для ячейки
//    struct PinCellData {
//        let image: UIImage
//    }
//    
//    // Создаем массив данных для секции с ячейками TransactionCell
//    let sectionData: [PinCellData] = [
//        PinCellData(image: UIImage(named: "PinFilled")!),
//        PinCellData(image: UIImage(named: "Pin")!),
//        PinCellData(image: UIImage(named: "Pin")!),
//        PinCellData(image: UIImage(named: "Pin")!)
//    ]
    // MARK: - Subviews
    
//    // Созданм горизонтальный стэк для размещения в нем изображений пинов
//    private lazy var cellImage: UIStackView = {
//        let stack = UIStackView()
//        stack.backgroundColor = .white
//        stack.axis = .horizontal
//        stack.spacing = 8
//        stack.alignment = .fill
//        stack.distribution = .fill
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.contentMode = .scaleAspectFill
//        
//        return stack
//    }()
    
    private lazy var cellImage: UIImageView = {
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
        contentView.addSubview(cellImage)
        
        setupConstraints()
    }
    
    // MARK: Constraints
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
        ])
    }
    
    // Конфигурируем ячейку
    func configureCell(dataCell: UIImage) {
        cellImage.image = dataCell
    }
}
