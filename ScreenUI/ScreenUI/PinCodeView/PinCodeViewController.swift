//
//  PinCodeViewController.swift
//  ScreenUI
//
//  Created by Alexander Kurbatov on 14.09.2024.
//

import UIKit

class PinCodeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, CustomButtonGoBackCellDelegate {
    
    // MARK: - Subviews
    
    private lazy var layout = UICollectionViewFlowLayout()
    
    private lazy var collectionView: UICollectionView = {
        layout.scrollDirection = .vertical
        // layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemRed
        collection.contentInsetAdjustmentBehavior = .never
        collection.dataSource = self
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Настроим navBar
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.navigationBar.backgroundColor = .yellow
        // Скрытие кнопки назад
        self.navigationItem.hidesBackButton = true
        // navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .close)
        
        registerCells()
        setupSubviews()
        setupConstraints()  
    }
    
    func registerCells() {
        // Регистрация ячеек
        collectionView.register(
            NavigationBarCell.self,
            forCellWithReuseIdentifier: NavigationBarCell.identifier
        )
        collectionView.register(
            TitleCell.self,
            forCellWithReuseIdentifier: TitleCell.identifier
        )
        collectionView.register(
            SubTitleCell.self,
            forCellWithReuseIdentifier: SubTitleCell.identifier
        )
        collectionView.register(
            PinCell.self,
            forCellWithReuseIdentifier: PinCell.identifier
        )
    }
    
    
    
    private func setupSubviews() {
        view.addSubview(collectionView)
    }
    
    // MARK: Constraints
    
    private func setupConstraints() {
        
        // Устанавливаем констрейнты для CollectionView
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}


extension PinCodeViewController {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1 // Количество ячеек типа NavigationBarCell
        case 1:
            return 1 // Количество ячеек типа TitleCell
        case 2:
            return 1 //Количество ячеек типа SubTitleCell
        case 3:
            return 4 // Количество ячеек типа PinCell
        case 4:
            return 1 // Количество ячеек типа ContinueButtonCell
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: NavigationBarCell.identifier,
                for: indexPath
            ) as! NavigationBarCell
            
            cell.delegate = self
            
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TitleCell.identifier,
                for: indexPath
            ) as! TitleCell
            
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SubTitleCell.identifier,
                for: indexPath
            ) as! SubTitleCell
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PinCell.identifier,
                for: indexPath
            ) as! PinCell
            // Передача данных из массива для каждой ячейки второй секции
            let dataForCell = PinCell().sectionData[indexPath.item]
            cell.configureCell(dataCell: dataForCell)
            
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ContinueButtonCell.identifier,
                for: indexPath
            ) as! ContinueButtonCell
            
            return cell
        default:
            fatalError("Unexpected section")
        }
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: collectionView.bounds.width, height: 112)
        case 1:
            return CGSize(width: collectionView.bounds.width, height: 48)
        case 2:
            return CGSize(width: collectionView.bounds.width, height: 58)
        case 3:
            // Рассчитываем ширину ячейки, чтобы вмещалось 4 ячейки с учетом отступов
//            let numberOfItemsInRow: CGFloat = 4
//            let spacing: CGFloat = 12 // Отступы между ячейками
//            let totalSpacing = (numberOfItemsInRow - 1) * spacing
//            let availableWidth = collectionView.bounds.width - totalSpacing
//            let itemWidth = availableWidth / numberOfItemsInRow
            
            return CGSize(width: 40, height: 40)
        case 4:
            return CGSize(width: collectionView.bounds.width, height: 88)
        default:
            return CGSize.zero
        }
    }
//    // Отступы вокруг секции
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Отступы от краев секции
//    }
    
    // Минимальное расстояние между ячейками по горизонтали
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12 // Расстояние между элементами в строке
    }
    
    // Минимальное расстояние между строками
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10 // Расстояние между строками
//        
//        
//    }
    
    // MARK: - CustomButtonCellDelegate
    
    func didTapButton(in cell: NavigationBarCell) {
        // Возвращаемся на предыдущий экран
        navigationController?.popViewController(animated: true)
        
    }
}
