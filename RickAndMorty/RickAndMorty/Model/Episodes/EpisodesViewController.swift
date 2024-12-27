//
//  EpisodesViewController.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 11.12.2024.
//

import UIKit
import Combine

final class EpisodesViewController: UIViewController {
    var viewModel: EpisodesViewModelProtocol?
//    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Subviews
    private lazy var favouritesButton: UIButton = {
        let button = UIButton()
        button.setTitle("CharacterDetails", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.backgroundColor = .red
        button.contentMode = .scaleAspectFit
        
//        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonTouchDown), for: .touchDown)
        button.addTarget(self, action: #selector(buttonTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
//    private lazy var loadingComponent: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: ImageName.loadingComponent)
//        imageView.contentMode = .scaleAspectFit
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        
//        return imageView
//    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        setupConstraints()
    }
    
    deinit {
        print("EpisodesViewController deinitialized")
    }
    
    // MARK: Actions
    
    // Кнопка становится прозрачной при нажатии
    @objc private func buttonTouchDown(sender: UIButton) {
        UIButton.animate(withDuration: 0.2) { [self] in
            favouritesButton.alpha = 0.1
            print("Button tapped!")
        }
    }
    
    // Восстанавливаем непрозрачность при отпускании или отмене нажатия и обрабатываем событие
    @objc private func buttonTouchUp(sender: UIButton) {
        UIButton.animate(withDuration: 0.2) { [self] in
            favouritesButton.alpha = 1
            let selectedCharacter = "Rick Sanchez"
            viewModel?.didTapCharacter(selectedCharacter) // Передаем событие во ViewModel
        }
    }
    
}

private extension EpisodesViewController {
    func setupSubviews() {
        view.backgroundColor = .cyan
        view.addSubview(favouritesButton)
    }
    
    // MARK: Constraints
    func setupConstraints() {
        
        // Устанавливаем констрейнты для launchScreenWelconeImageView
        NSLayoutConstraint.activate([
            favouritesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            favouritesButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            favouritesButton.widthAnchor.constraint(equalToConstant: 200),
            favouritesButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension EpisodesViewController {
    struct Input {
        let onAppear: PassthroughSubject<String, Never>
    }
}
