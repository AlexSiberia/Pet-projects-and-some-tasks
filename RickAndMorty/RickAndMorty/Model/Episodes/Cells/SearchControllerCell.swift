//
//  SearchController.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 28.12.2024.
//

import UIKit

class SearchControllerCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    // MARK: - Subviews
    
    private lazy var searchController: UISearchController = {
        let search = UISearchController()
      

//        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SearchControllerCell {
    func setupSubviews() {
        
//        contentView.addSubview(searchController)
        setupConstraints()
    }
    
    // MARK: Constraints
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
//            searchController.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 57),
//            searchController.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
//            imsearchControllerage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            searchController.widthAnchor.constraint(equalToConstant: 312),
//            searchController.heightAnchor.constraint(equalToConstant: 104),
//            searchController.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

