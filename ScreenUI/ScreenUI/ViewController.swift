//
//  ViewController.swift
//  ScreenUI
//
//  Created by Alexander Kurbatov on 31.08.2024.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
   
    
    
    // MARK: - Subviews
    
    private lazy var layout = UICollectionViewFlowLayout()

    private lazy var collectionView: UICollectionView = {
//        let collection = UICollectionView(frame: self.view.bounds)
        let collection = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
//        layout.itemSize = CGSize(width: collectionView.frame.width, height: 204)
        collection.backgroundColor = .white
        collection.dataSource = self
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        // Регистрация ячеек
//        collection.register(ImageButtonCell.self, forCellWithReuseIdentifier: ImageButtonCell.identifier)
        
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
        
//        let safeAreaGuide = view.safeAreaLayoutGuide
        
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            switch indexPath.section {
            case 0:
                return CGSize(width: collectionView.bounds.width, height: 204)
            case 1:
                return CGSize(width: collectionView.bounds.width / 2 - 10, height: 100)
            default:
                return CGSize.zero
            }
        }
}
