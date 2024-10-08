//
//  ViewController.swift
//  DelegatePattern
//
//  Created by Alexander Kurbatov on 21.09.2024.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func newTextForLabel(text: String)
}

class ViewController: UIViewController {
    
    private lazy var toSecondViewControllerButton: UIButton = {
        let button = UIButton()
        button.setTitle("To second view controller", for: .normal)
        button.addTarget(self, action: #selector(toSecondViewController), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var someLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, world!"
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        makeConstraints()
    }
    private func makeConstraints() {
        
        view.addSubview(toSecondViewControllerButton) // добавляем кнопку на view
        view.addSubview(someLabel)
        
        NSLayoutConstraint.activate([
            toSecondViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), // центр по оси Х
            toSecondViewControllerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor), // центр по оси Y
            
            someLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            someLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40)
        ])
    }
    
    @objc private func toSecondViewController() {
        let secondViewController = SecondViewController()
        secondViewController.delegate = self
        present(secondViewController, animated: true)
    }
    
}

extension ViewController: SecondViewControllerDelegate {
    func newTextForLabel(text: String) {
        someLabel.text = text
    }
}
