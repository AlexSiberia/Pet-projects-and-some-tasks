//
//  LanchViewController.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 11.12.2024.
//

import UIKit

final class LaunchViewController: UIViewController {
    
    // MARK: - Subviews
    private lazy var launchScreenWelconeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: ImageName.launchScreenWelconeImageView)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var loadingComponent: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: ImageName.loadingComponent)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        setupConstraints()
    }
    
    deinit {
        print("LaunchViewController deinitialized")
    }
}


private extension LaunchViewController {
    func setupSubviews() {
        view.backgroundColor = UIColor.theme.background
        view.addSubview(launchScreenWelconeImageView)
        view.addSubview(loadingComponent)
        startRotationAnimation()
    }
    
    // MARK: - Rotation Animation
    func startRotationAnimation() {
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.toValue = CGFloat.pi * 2 // Полный оборот (360 градусов)
        rotation.duration = 2.0 // Длительность одного оборота (в секундах)
        rotation.repeatCount = Float.infinity // Бесконечное повторение
        loadingComponent.layer.add(rotation, forKey: "rotationAnimation")
    }
    
    // MARK: Constraints
    func setupConstraints() {
        
        // Устанавливаем констрейнты для launchScreenWelconeImageView
        NSLayoutConstraint.activate([
            launchScreenWelconeImageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 97),
            launchScreenWelconeImageView.widthAnchor.constraint(equalToConstant: 312),
            launchScreenWelconeImageView.heightAnchor.constraint(equalToConstant: 104),
            launchScreenWelconeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loadingComponent.topAnchor.constraint(equalTo: view.topAnchor, constant: 347),
            loadingComponent.heightAnchor.constraint(equalToConstant: 200),
            loadingComponent.widthAnchor.constraint(equalToConstant: 200),
            loadingComponent.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

