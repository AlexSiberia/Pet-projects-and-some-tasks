//
//  RickAnd.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 28.12.2024.
//

import UIKit

class WellcomeImageCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    // MARK: - Subviews
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: ImageName.launchScreenWelconeImageView)
        image.contentMode = .scaleAspectFit
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
}

private extension WellcomeImageCell {
    func setupSubviews() {
        
        contentView.addSubview(image)
        setupConstraints()
    }
    
    // MARK: Constraints
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 57),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
//            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.widthAnchor.constraint(equalToConstant: 312),
            image.heightAnchor.constraint(equalToConstant: 104),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}
