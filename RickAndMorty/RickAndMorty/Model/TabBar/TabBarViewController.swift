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
            UITabBarItem(title: nil, image: UIImage(named: ImageName.homeTabBarComponent), selectedImage: UIImage(named: ImageName.homeFilledTabBarComponent)),
            UITabBarItem(title: nil, image: UIImage(named: ImageName.favouritesTabBarComponent), selectedImage: UIImage(named: ImageName.favouritesFilledTabBarComponent))
        ]
        
        // Убираем подписи
        tabItems.forEach { item in
            item.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
//            item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0)
        }
        
        tabBar.itemPositioning = .centered // Центрирует элементы
        tabBar.itemSpacing = 65 // Расстояние между элементами
        tabBar.itemWidth = 30 // Ширина элементов
        
        
        
        // Проверка: количество viewControllers и tabItems должно совпадать
        guard tabItems.count == viewControllers.count else {
            fatalError("Количество viewControllers и tabItems должно совпадать")
        }
        print(viewControllers)
        
        tabBar.backgroundColor = .blue
        tabBar.items = tabItems
        
        // Устанавливаем активным первый элемент
        if let firstItem = tabBar.items?.first {
            tabBar.selectedItem = firstItem
        }
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
            tabBar.heightAnchor.constraint(equalToConstant: 61),
            tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

