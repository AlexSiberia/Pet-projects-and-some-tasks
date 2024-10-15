//
//  ConfirmPinViewController.swift
//  ScreenUI
//
//  Created by Alexander Kurbatov on 12.10.2024.
//

import UIKit

class HappyScreenViewController: UIViewController {
    
    // MARK: - Subviews
    
    private lazy var layout = UICollectionViewFlowLayout()
    
    private lazy var collectionView: UICollectionView = {
        layout.scrollDirection = .vertical
        // layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
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

// MARK: - UICollectionViewDataSource

extension HappyScreenViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1 // Количество ячеек типа NavigationBarCell
        case 1:
            return 1 // Количество ячеек типа TitleCell
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        print("Section: \(indexPath.section), Row: \(indexPath.item)")
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: NavigationBarCell.identifier,
                for: indexPath
            ) as! NavigationBarCell
            
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TitleCell.identifier,
                for: indexPath
            ) as! TitleCell
            print(indexPath)
            cell.configure(with: "Happy End!!!")
  
            return cell
            
        default:
            fatalError("Unexpected section")
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HappyScreenViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: collectionView.bounds.width, height: 112)
        case 1:
            return CGSize(width: collectionView.bounds.width, height: 48)

        default:
            return CGSize.zero
        }
    }
//        // Отступы вокруг секции
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Отступы от краев секции
//        }
    
//     Минимальное расстояние между ячейками по горизонтали
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 12 // Расстояние между элементами в строке
        }
    
    // Минимальное расстояние между строками
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        return 10 // Расстояние между строками
    //
    //
    //    }
}

