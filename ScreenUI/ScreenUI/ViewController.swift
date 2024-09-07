//
//  ViewController.swift
//  ScreenUI
//
//  Created by Alexander Kurbatov on 31.08.2024.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    
    
    // MARK: - Subviews
    
    private lazy var layout = UICollectionViewFlowLayout()

    private lazy var collectionView: UICollectionView = {
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
        
        // Регистрация ячеек
        collectionView.register(ImageButtonCell.self, forCellWithReuseIdentifier: ImageButtonCell.identifier)
        collectionView.register(TextHeaderCell.self, forCellWithReuseIdentifier: TextHeaderCell.identifier)
        
        setupSubviews()
        setupConstraints()
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

extension ViewController {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
               case 0:
                   return 1 // Количество ячеек типа ImageButtontCell
               case 1:
                   return 1 // Количество ячеек типа TextHeaderCell
               default:
                   return 0
               }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
                case 0:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageButtonCell.identifier, for: indexPath) as! ImageButtonCell
                   
                    return cell
                case 1:
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextHeaderCell.identifier, for: indexPath) as! TextHeaderCell
                  
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
            default:
                return CGSize.zero
            }
        }
}
