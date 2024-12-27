//
//  TabBarViewController.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 14.12.2024.
//

import UIKit

final class TabBarViewController: UIViewController, UITabBarDelegate {
    private let tabBar = UITabBar()
    var viewControllers: [UIViewController] = []
    var tabItems: [UITabBarItem] = []
    
    private var currentViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        setupTabBar()
        setupConstraints()
        
        // Отображаем первый экран
        if !viewControllers.isEmpty {
            selectViewController(at: 0)
        }
    }
    
    // MARK: - UITabBarDelegate
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let index = tabItems.firstIndex(of: item) {
            selectViewController(at: index)
        }
    }
    
}

private extension TabBarViewController {
   
    func setupSubviews() {
//        view.backgroundColor = UIColor.theme.background
        view.backgroundColor = .brown
        view.addSubview(tabBar)
       
    }
    
    func setupTabBar() {
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        tabBar.delegate = self
        
        // Инициализация tabItems
        tabItems = [
            UITabBarItem(title: "Лента", image: UIImage(systemName: "list.bullet"), selectedImage: UIImage(systemName: "list.bullet.rectangle")),
            UITabBarItem(title: "Избранное", image: UIImage(systemName: "star"), selectedImage: UIImage(systemName: "star.fill"))
        ]
        
        // Проверка: количество viewControllers и tabItems должно совпадать
        guard tabItems.count == viewControllers.count else {
            fatalError("Количество viewControllers и tabItems должно совпадать")
        }
        print(viewControllers)
        
        tabBar.backgroundColor = .blue
        tabBar.items = tabItems
    }
    
    func selectViewController(at index: Int) {
        guard index < viewControllers.count else { return }
        
        // Удаляем текущий контроллер, если он есть
        currentViewController?.view.removeFromSuperview()
        currentViewController?.removeFromParent()
        
        // Устанавливаем новый контроллер
        let newViewController = viewControllers[index]
        addChild(newViewController)
        view.addSubview(newViewController.view)
        newViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            newViewController.view.bottomAnchor.constraint(equalTo: tabBar.topAnchor)
        ])
        
        currentViewController = newViewController
    }
    
  
    
    // MARK: Constraints
    func setupConstraints() {
        
        // Устанавливаем констрейнты для launchScreenWelconeImageView
        NSLayoutConstraint.activate([
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBar.heightAnchor.constraint(equalToConstant: 100),
            tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

