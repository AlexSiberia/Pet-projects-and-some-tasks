//
//  TransactionCellCreditLimit.swift
//  ScreenUI
//
//  Created by Alexander Kurbatov on 08.09.2024.
//

import UIKit

class TransactionCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
//    // Создаем сруктуру данных для ячейки
//    struct TransactionCellData {
//        let image: UIImage
//        let titleText: String
//        let subTitleText: String
//    }
//    
//    // Создаем массив данных для секции с ячейками TransactionCell
//    let sectionData: [TransactionCellData] = [
//        TransactionCellData(image: UIImage(named: "CellAvatar1")!, titleText: "Credit limit ₱10,000.00", subTitleText: "Revolving amount is ready to use over and over"), 
//        TransactionCellData(image: UIImage(named: "CellAvatar2")!, titleText: "Free forever", subTitleText: "No annual fee. If you don’t use it, you don’t pay"),
//        TransactionCellData(image: UIImage(named: "CellAvatar3")!, titleText: "30 days interest-free period", subTitleText: "Pay the minimum payment in a month"),
//        TransactionCellData(image: UIImage(named: "CellAvatar4")!, titleText: "Easy to use", subTitleText: "Send money, pay bills, make daily purchases via QR Ph with ease")
//    ]
    
    // MARK: - Subviews
    
    // Созданм горизонтальный стэк для размещения в нем изображения и вертикального стэка с текстом
    private lazy var cellStack: UIStackView = {
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
    
    // Создаем вертикальный стэк для размещения в нем двух лэйблов с текстом
    private lazy var textStack: UIStackView = {
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
    
    private lazy var cellTitleText: UILabel = {
        
        // Создаем UILabel
        let label = UILabel()
        
        // Устанавливаем текст для label
//        let textForHeader: String = "Credit limit ₱10,000.00"
//        
//        // Настраиваем атрибуты текста
//        let atributes: [NSAttributedString.Key: Any] = [
//            .font: UIFont.systemFont(ofSize: 17, weight: .semibold),
//            .kern: 0.38
//        ]
//        let attributedText: NSAttributedString = NSAttributedString(string: textForHeader, attributes: atributes)
//        label.attributedText = attributedText
        
        // Настраиваем выравнивание
        label.textAlignment = .left
        label.numberOfLines = 0
        
        // Отключаем автогенерируемые констрейты
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // Устанавливаем background color
        label.backgroundColor = .white
        
        return label
    }()
    
    
    private lazy var cellSubTitleText: UILabel = {
        let label = UILabel()
        
        // Устанавливаем текст для label
//        let textForSubHeader: String = "Revolving amount is ready to use over and over"
//        
//        // Настраиваем атрибуты текста
//        let atributes: [NSAttributedString.Key: Any] = [
//            .font: UIFont.systemFont(ofSize: 13, weight: .regular),
//            .kern: 0
//        ]
//        let attributedText: NSAttributedString = NSAttributedString(string: textForSubHeader, attributes: atributes)
//        label.attributedText = attributedText
        
        // Настраиваем выравнивание
        label.textAlignment = .left
        label.numberOfLines = 0
        
        // Устанавливаем background color
        label.backgroundColor = .white
        
        // Отключаем автогенерируемые констрейты
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
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
        contentView.addSubview(cellStack)
        cellStack.addSubview(cellImage)
        cellStack.addSubview(textStack)
        textStack.addSubview(cellTitleText)
        textStack.addSubview(cellSubTitleText)
        
        setupConstraints()
    }
    
    // MARK: Constraints
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            // Констрейты для позиции cellStack в родительском view
            cellStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            // Констрейты для позиции Image в горизонтальном стэке
            cellImage.topAnchor.constraint(equalTo: cellStack.topAnchor, constant: 12),
            cellImage.leadingAnchor.constraint(equalTo: cellStack.leadingAnchor, constant: 20),
            cellImage.bottomAnchor.constraint(equalTo: cellStack.bottomAnchor, constant: -26),
            cellImage.widthAnchor.constraint(equalToConstant: 48),
            cellImage.heightAnchor.constraint(equalToConstant: 48),
//            
            // Констрейты для позиции titleFrame label в родительском view
            textStack.leadingAnchor.constraint(equalTo: cellImage.trailingAnchor, constant: 16),
            textStack.trailingAnchor.constraint(equalTo: cellStack.trailingAnchor, constant: -37),
            textStack.topAnchor.constraint(equalTo: cellStack.topAnchor, constant: 14),
            textStack.bottomAnchor.constraint(equalTo: cellStack.bottomAnchor, constant: -28),
            textStack.heightAnchor.constraint(equalToConstant: 44),
           
            // Констрейты для позиции titleText в вертикальном стэке textStack
            cellTitleText.leadingAnchor.constraint(equalTo: textStack.leadingAnchor),
            cellTitleText.topAnchor.constraint(equalTo: textStack.topAnchor, constant: 2),
            cellTitleText.widthAnchor.constraint(equalToConstant: 254),
            
            // Констрейты для позиции subTitleText в вертикальном стэке textStack
            cellSubTitleText.leadingAnchor.constraint(equalTo: textStack.leadingAnchor),
            cellSubTitleText.topAnchor.constraint(equalTo: cellTitleText.bottomAnchor, constant: 4),
            // Устанавливаем размеры (ширина - fill, высота - hug)
            cellSubTitleText.widthAnchor.constraint(equalToConstant: 254),
        ])
    }
    
    // Конфигурируем ячейку
    func configureCell(dataCell: HomeViewController.TransactionCellData) {
        cellImage.image = dataCell.image

        // Настраиваем атрибуты текста для cellTitleText
        let atributesForTitle: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 17, weight: .semibold),
            .kern: 0.38
        ]
        let attributedTextForTitle: NSAttributedString = NSAttributedString(string: dataCell.titleText, attributes: atributesForTitle)
        
        cellTitleText.attributedText = attributedTextForTitle
        
        // Настраиваем атрибуты текста для subTitleText
        let atributesForSubTitle: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 13, weight: .regular),
            .kern: 0,
            .foregroundColor: UIColor(named: "TransCellSubTitleText") as Any
        ]
        let attributedTextForSubTitle: NSAttributedString = NSAttributedString(string: dataCell.subTitleText, attributes: atributesForSubTitle)
        
        cellSubTitleText.attributedText = attributedTextForSubTitle
    }
}
