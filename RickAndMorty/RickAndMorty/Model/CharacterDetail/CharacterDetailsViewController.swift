//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 11.12.2024.
//

import UIKit

final class CharacterDetailsViewController: UIViewController {
    var viewModel: CharacterDetailsViewModelProtocol?
    
    // MARK: - Subviews
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setTitle(viewModel?.getCharacterName(), for: .normal)
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
        print("CharacterDetailsViewController deinitialized")
    }
    
    // MARK: Actions
    
    // Кнопка становится прозрачной при нажатии
    @objc private func buttonTouchDown(sender: UIButton) {
        UIButton.animate(withDuration: 0.2) { [self] in
            closeButton.alpha = 0.1
            print("Button tapped!")
        }
    }
    
    // Восстанавливаем непрозрачность при отпускании или отмене нажатия и обрабатываем событие
    @objc private func buttonTouchUp(sender: UIButton) {
        UIButton.animate(withDuration: 0.2) { [self] in
            closeButton.alpha = 1
            dismiss(animated: true, completion: nil)
        }
    }

}
//
private extension CharacterDetailsViewController {
    func setupSubviews() {
        view.backgroundColor = .yellow
        view.addSubview(closeButton)
    }
    
    // MARK: Constraints
    func setupConstraints() {
        
        // Устанавливаем констрейнты для launchScreenWelconeImageView
        NSLayoutConstraint.activate([
            closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            closeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            closeButton.widthAnchor.constraint(equalToConstant: 200),
            closeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
