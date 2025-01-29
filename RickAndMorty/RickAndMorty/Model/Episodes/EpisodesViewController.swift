//
//  EpisodesViewController.swift
//  RickAndMorty
//
//  Created by Alexander Kurbatov on 11.12.2024.
//

import UIKit
import Combine

final class EpisodesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var viewModel: EpisodesViewModelProtocol?
//    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Subviews
    
    private lazy var welcomeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: ImageName.launchScreenWelconeImageView)
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "Name or episode (ex.S01E01)..."
        
        // Убираем фон
        search.backgroundImage = UIImage()
        search.backgroundColor = .clear
        
        // Настройка прозрачности
        search.layer.opacity = 1 // 0 для полной прозрачности
        
        
        // Добавляем рамку к самому UISearchBar
        search.layer.cornerRadius = 8
        search.layer.masksToBounds = true
        search.layer.borderWidth = 1 // Толщина рамки
        search.layer.borderColor = UIColor.gray.cgColor
        
        search.searchTextField.backgroundColor = .clear
        search.searchTextField.font = UIFont(name: "Roboto-Regular", size: 16)
        
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    private lazy var filterButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "FilterButtonColor")
        
        // Закруглённые углы
        button.layer.cornerRadius = 4
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16) // padding
        button.clipsToBounds = false
        
        // Первая тень: 0px 2px 2px 0px #0000003D
        button.layer.shadowColor = UIColor.black.withAlphaComponent(0.24).cgColor // Прозрачность: #3D = ~24%
        button.layer.shadowOffset = CGSize(width: 0, height: 2) // Смещение тени
        button.layer.shadowRadius = 2 // Радиус размытия
        button.layer.shadowOpacity = 1 // Прозрачность

        // Вторая тень: 0px 0px 2px 0px #0000001F
        let secondShadowLayer = CALayer()
        secondShadowLayer.shadowColor = UIColor.black.withAlphaComponent(0.12).cgColor // Прозрачность: #1F = ~12%
        secondShadowLayer.shadowOffset = CGSize(width: 0, height: 0) // Без смещения
        secondShadowLayer.shadowRadius = 2 // Радиус размытия
        secondShadowLayer.shadowOpacity = 1 // Прозрачность
        secondShadowLayer.frame = button.layer.bounds // Совпадает с размерами кнопки
        secondShadowLayer.cornerRadius = 4 // Совпадает с закруглением кнопки
        
        // Добавление второго слоя в иерархию
        button.layer.addSublayer(secondShadowLayer)
        
        // Применяем шрифт Roboto Medium, размер 14
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 14)

        // Выравнивание текста по центру
        button.titleLabel?.textAlignment = .center

        // Установка letter-spacing (межбуквенного интервала)
        let attributedTitle = NSAttributedString(
            string: "ADVANCED FILTERS",
            attributes: [
                .kern: 1.25, // letter-spacing
                .font: UIFont(name: "Roboto-Medium", size: 14)!
            ]
        )
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.setTitleColor(UIColor(named: "FilterButtonTextColor"), for: .normal)
        
        button.addTarget(self, action: #selector(filterButtonTouchDown), for: .touchDown)
        button.addTarget(self, action: #selector(filterButtonTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var filterButtonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "FilterList")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var layout = UICollectionViewFlowLayout()
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemRed
        collection.contentInsetAdjustmentBehavior = .never
        collection.dataSource = self
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        //        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        return collection
    }()
    
    private lazy var favouritesButton: UIButton = {
        let button = UIButton()
        button.setTitle("CharacterDetails", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.backgroundColor = .red
        button.contentMode = .scaleAspectFit
        
//        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(favouritesButtonTouchDown), for: .touchDown)
        button.addTarget(self, action: #selector(favouritesButtonTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
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
        
        registerCells()
        setupSubviews()
        setupConstraints()
    }
    
    deinit {
        print("EpisodesViewController deinitialized")
    }
    
    // MARK: Actions
    
    // Кнопка становится прозрачной при нажатии
    @objc private func favouritesButtonTouchDown(sender: UIButton) {
        UIButton.animate(withDuration: 0.2) { [self] in
            favouritesButton.alpha = 0.1
            print("Button tapped!")
        }
    }
    
    // Восстанавливаем непрозрачность при отпускании или отмене нажатия и обрабатываем событие
    @objc private func favouritesButtonTouchUp(sender: UIButton) {
        UIButton.animate(withDuration: 0.2) { [self] in
            favouritesButton.alpha = 1
//            let selectedCharacter = "Rick Sanchez"
//            viewModel?.didTapCharacter(selectedCharacter) // Передаем событие во ViewModel
        }
    }
    
    // Кнопка становится прозрачной при нажатии
    @objc private func filterButtonTouchDown(sender: UIButton) {
        UIButton.animate(withDuration: 0.2) { [self] in
            filterButton.alpha = 0.1
            print("Button tapped!")
        }
    }
    
    // Восстанавливаем непрозрачность при отпускании или отмене нажатия и обрабатываем событие
    @objc private func filterButtonTouchUp(sender: UIButton) {
        UIButton.animate(withDuration: 0.2) { [self] in
            filterButton.alpha = 1
//            let selectedCharacter = "Rick Sanchez"
//            viewModel?.didTapCharacter(selectedCharacter) // Передаем событие во ViewModel
        }
    }
    
}

private extension EpisodesViewController {
    func setupSubviews() {
        view.backgroundColor = UIColor.systemBackground
        view.addSubview(welcomeImage)
        view.addSubview(searchBar)
        view.addSubview(filterButton)
        filterButton.addSubview(filterButtonImageView)
        view.addSubview(collectionView)
//        view.addSubview(favouritesButton)
    }
    
    private func   registerCells() {
        // Регистрация ячеек
        collectionView.register(
            WellcomeImageCell.self,
            forCellWithReuseIdentifier: WellcomeImageCell.identifier
        )}
    
    // MARK: Constraints
    func setupConstraints() {
        
        // Устанавливаем констрейнты для CollectionView
        NSLayoutConstraint.activate([
            welcomeImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 57),
            welcomeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            welcomeImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            searchBar.topAnchor.constraint(equalTo: welcomeImage.bottomAnchor, constant: 67),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            searchBar.heightAnchor.constraint(equalToConstant: 56),
            
            filterButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 12),
            filterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            filterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            filterButton.heightAnchor.constraint(equalToConstant: 56),
            
            filterButtonImageView.leadingAnchor.constraint(equalTo: filterButton.leadingAnchor, constant: 21),
            filterButtonImageView.topAnchor.constraint(equalTo: filterButton.topAnchor, constant: 21),
            filterButtonImageView.bottomAnchor.constraint(equalTo: filterButton.bottomAnchor, constant: -23),
            
            collectionView.topAnchor.constraint(equalTo: filterButton.bottomAnchor, constant: 30),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension EpisodesViewController {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1 // Количество ячеек типа ImageButtontCell
        case 1:
            return 1 // Количество ячеек типа TextHeaderCell
        case 2:
            return 1 //Количество ячеек типа TransactionCellCreditLimit
        case 3:
            return 1 // Количество ячеек типа InfoCell
        case 4:
            return 1 // Количество ячеек типа ContinueButtonCell
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: WellcomeImageCell.identifier,
                for: indexPath
            ) as! WellcomeImageCell
            
            return cell
            //        case 1:
            //            let cell = collectionView.dequeueReusableCell(
            //                withReuseIdentifier: TextHeaderCell.identifier,
            //                for: indexPath
            //            ) as! TextHeaderCell
            //
            //            return cell
            //        case 2:
            //            let cell = collectionView.dequeueReusableCell(
            //                withReuseIdentifier: TransactionCell.identifier,
            //                for: indexPath
            //            ) as! TransactionCell
            //            // Передача данных из массива для каждой ячейки второй секции
            //            let dataForCell = sectionData[indexPath.item]
            //            cell.configureCell(dataCell: dataForCell)
            //
            //            return cell
            //        case 3:
            //            let cell = collectionView.dequeueReusableCell(
            //                withReuseIdentifier: InfoCell.identifier,
            //                for: indexPath
            //            ) as! InfoCell
            //
            //            return cell
            //        case 4:
            //            let cell = collectionView.dequeueReusableCell(
            //                withReuseIdentifier: ContinueButtonCell.identifier,
            //                for: indexPath
            //            ) as! ContinueButtonCell
            //
            //            cell.delegate = self
            
//            return cell
        default:
            fatalError("Unexpected section")
        }
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: collectionView.bounds.width, height: 161)
        case 1:
            return CGSize(width: collectionView.bounds.width, height: 98)
        case 2:
            return CGSize(width: collectionView.bounds.width, height: 86)
        case 3:
            return CGSize(width: collectionView.bounds.width, height: 56)
        case 4:
            return CGSize(width: collectionView.bounds.width, height: 88)
        default:
            return CGSize.zero
        }
    }
    
    // MARK: - CustomButtonCellDelegate
    
    //       func didTapButton(in cell: ContinueButtonCell) {
    //           // Переход на второй экран при нажатии на кнопку
    ////           let pinView = PinCodeViewController()
    //
    //           // Переход с использованием push
    //           navigationController?.pushViewController(pinView, animated: true)
    ////           pinView.modalPresentationStyle = .fullScreen
    ////           present(pinView, animated: true)
    //       }
    //}
}

extension EpisodesViewController {
    struct Input {
        let onAppear: PassthroughSubject<String, Never>
    }
}

