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
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemRed
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
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
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
//        collectionView.register(
//            InfoCell.self,
//            forCellWithReuseIdentifier: InfoCell.identifier
//        )
//        collectionView.register(
//            ContinueButtonCell.self,
//            forCellWithReuseIdentifier: ContinueButtonCell.identifier
//        )
        
        setupSubviews()
        setupConstraints()
        
        // Настроим navBar
        navigationController?.navigationBar.backgroundColor = .yellow
//        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .close)
        // Скрытие кнопки назад
        self.navigationItem.hidesBackButton = true
        
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
        return 3
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
                withReuseIdentifier: InfoCell.identifier,
                for: indexPath
            ) as! InfoCell
            
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
            return CGSize(width: collectionView.bounds.width, height: 56)
        case 4:
            return CGSize(width: collectionView.bounds.width, height: 88)
        default:
            return CGSize.zero
        }
    }
    
    // MARK: - CustomButtonCellDelegate
    
    func didTapButton(in cell: NavigationBarCell) {
        // Возвращаемся на предыдущий экран
        navigationController?.popViewController(animated: true)
        
    }
}
