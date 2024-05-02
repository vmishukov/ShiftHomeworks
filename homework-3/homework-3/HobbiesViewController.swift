//
//  HobbiesViewController.swift
//  homework-3
//
//  Created by Vladislav Mishukov on 30.04.2024.
//

import UIKit

final class HobbiesViewController: UIViewController {
    //MARK: - model
    private let model = HobbiesModel(
        body:    
    """
    Стараюсь выходить из дома, когда появляется такая возможность: погулять, сходить на концерт, покататься на велосипеде или на лыжах. Открыт ко многим активностям, главное, чтобы это не было что-то экстремальное.
    Иногда фотографирую что-то красивенькое, вот примеры:
    """,
        images: [.candles, .river, .tree]
    )
    //MARK: - UI
    private lazy var hobbiesScrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .systemBackground
        sv.isDirectionalLockEnabled = true
        sv.addSubview(hobbiesStackView)
        view.addSubview(sv)
        return sv
    }()
    
    private lazy var hobbiesStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [hobbiesTitleLabel, hobbiesBody])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = 16
        sv.axis = .vertical
        sv.distribution = .equalSpacing
        return sv
    }()
    
    private lazy var hobbiesTitleLabel = CommonUiFactory.createTitleLabel(title: HobbiesView.hobbiesTitle.rawValue)
    
    private lazy var hobbiesBody = CommonUiFactory.createBodyLabel(body: model.body)
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    //MARK: - setup ui
    private func setupUI() {
        model.images.forEach{
            hobbiesStackView.addArrangedSubview(CommonUiFactory.createDemoImageView(source: $0))
        }
        NSLayoutConstraint.activate([
            hobbiesScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            hobbiesScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            hobbiesScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            hobbiesScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            hobbiesStackView.topAnchor.constraint(equalTo: hobbiesScrollView.topAnchor,constant: 16),
            hobbiesStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            hobbiesStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            hobbiesStackView.bottomAnchor.constraint(equalTo: hobbiesScrollView.bottomAnchor),
        ])
        
    }
}
