//
//  SecondViewController.swift
//  DelegatePattern
//
//  Created by Alexander Kurbatov on 21.09.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    weak var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
    }
    
    deinit {
        self.delegate?.newTextForLabel(text: "Hello from SecondViewController")
    }
}
