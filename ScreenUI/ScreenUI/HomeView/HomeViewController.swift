//
//  ViewController.swift
//  ScreenUI
//
//  Created by Alexander Kurbatov on 31.08.2024.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, CustomButtonCellDelegate {
    
    // MARK: - Data and strucrure
    
    // Создаем сруктуру данных для ячейки
    struct TransactionCellData {
        let image: UIImage
        let titleText: String
        let subTitleText: String
    }
    
    // Создаем массив данных для секции с ячейками TransactionCell
    private let sectionData: [TransactionCellData] = [
        TransactionCellData(image: UIImage(named: "CellAvatar1")!, titleText: "Credit limit ₱10,000.00", subTitleText: "Revolving amount is ready to use over and over"),
        TransactionCellData(image: UIImage(named: "CellAvatar2")!, titleText: "Free forever", subTitleText: "No annual fee. If you don’t use it, you don’t pay"),
        TransactionCellData(image: UIImage(named: "CellAvatar3")!, titleText: "30 days interest-free period", subTitleText: "Pay the minimum payment in a month"),
        TransactionCellData(image: UIImage(named: "CellAvatar4")!, titleText: "Easy to use", subTitleText: "Send money, pay bills, make daily purchases via QR Ph with ease")
    ]
    
    // MARK: - Subviews
    
    private lazy var layout = UICollectionViewFlowLayout()
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //        collection.backgroundColor = .systemRed
        collection.contentInsetAdjustmentBehavior = .never
        collection.dataSource = self
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        //        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        return collection
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        view.addSubview(collectionView)
    }
    
    private func   registerCells() {
    // Регистрация ячеек
    collectionView.register(
        ImageButtonCell.self,
        forCellWithReuseIdentifier: ImageButtonCell.identifier
    )
    collectionView.register(
        TextHeaderCell.self,
        forCellWithReuseIdentifier: TextHeaderCell.identifier
    )
    collectionView.register(
        TransactionCell.self,
        forCellWithReuseIdentifier: TransactionCell.identifier
    )
    collectionView.register(
        InfoCell.self,
        forCellWithReuseIdentifier: InfoCell.identifier
    )
    collectionView.register(
        ContinueButtonCell.self,
        forCellWithReuseIdentifier: ContinueButtonCell.identifier
    )
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

extension HomeViewController {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1 // Количество ячеек типа ImageButtontCell
        case 1:
            return 1 // Количество ячеек типа TextHeaderCell
        case 2:
            return sectionData.count //Количество ячеек типа TransactionCellCreditLimit
        case 3:
            return 1 // Количество ячеек типа InfoCell
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
                withReuseIdentifier: ImageButtonCell.identifier,
                for: indexPath
            ) as! ImageButtonCell
            
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TextHeaderCell.identifier,
                for: indexPath
            ) as! TextHeaderCell
            
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TransactionCell.identifier,
                for: indexPath
            ) as! TransactionCell
            // Передача данных из массива для каждой ячейки второй секции
            let dataForCell = sectionData[indexPath.item]
            cell.configureCell(dataCell: dataForCell)
            
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: InfoCell.identifier,
                for: indexPath
            ) as! InfoCell
            
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ContinueButtonCell.identifier,
                for: indexPath
            ) as! ContinueButtonCell
            
            cell.delegate = self
            
            return cell
        default:
            fatalError("Unexpected section")
        }
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.width * 0.544)
        case 1:
            return CGSize(width: collectionView.bounds.width, height: 98)
        case 2:
            return CGSize(width: collectionView.bounds.width, height: 86)
        case 3:
            return CGSize(width: collectionView.bounds.width, height: 56)
        case 4:
            return CGSize(width: collectionView.bounds.width, height: 88)
        default:
            return CGSize.zero
        }
    }
    
    // MARK: - CustomButtonCellDelegate
       
       func didTapButton(in cell: ContinueButtonCell) {
           // Переход на второй экран при нажатии на кнопку
           let pinView = PinCodeViewController()
           
           // Переход с использованием push
           navigationController?.pushViewController(pinView, animated: true)
//           pinView.modalPresentationStyle = .fullScreen
//           present(pinView, animated: true)
       }
}
