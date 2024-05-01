//
//  SkillsViewController.swift
//  homework-3
//
//  Created by Vladislav Mishukov on 29.04.2024.
//

import UIKit

final class SkillsViewController: UIViewController {
    //MARK: - UI
    private lazy var skillsLabelTitle: UILabel = CommonUiFactory.createTitleLabel(
        title:  "Как давно занимаетесь программированием? Какие языки изучали? "
    )
    private lazy var skillsLabelBody: UILabel = CommonUiFactory.createBodyLabel(
        body:
"""
2016 год. Я начал изучать тот самый Паскаль. Этот язык тогда считался идеальным, чтобы начать изучать программирование, с этим я не согласен - лучше сразу начинать изучать реальные языки программирования.
Затем я поступил в ВКИ НГУ. Там я полюбил язык C# и старался делать все на нём. После учебы, это был 2021 год, я пошёл работать аналитиком в банк. Там я мастерски освоил язык запросов SQL.
Желание заниматься программированием не покидало меня, писать запросы на SQL это круто, но не то. Так, в 2023 году я начал изучать язык Swift.
"""
    )
    
    private lazy var skillsLabelExpecTitle: UILabel = CommonUiFactory.createTitleLabel(
        title:  "Чего ждете от обучения?"
    )
    
    private lazy var skillsLabelExpecBody: UILabel = CommonUiFactory.createBodyLabel(
        body:  "Хочу прокачаться как разработчик. Послушать советов от опытных сотрудников ЦФТ. И, конечно же, найти тут свою работу"
    )
    
    private lazy var skillsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [skillsLabelTitle, skillsLabelBody,skillsLabelExpecTitle,skillsLabelExpecBody])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var skillsScrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .systemBackground
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.isDirectionalLockEnabled = true
        sv.addSubview(skillsStackView)
        view.addSubview(sv)
        return sv
    }()
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    //MARK: - setup ui
    private func setupUI() {
        NSLayoutConstraint.activate([
            skillsScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            skillsScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            skillsScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            skillsScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            skillsStackView.topAnchor.constraint(equalTo: skillsScrollView.topAnchor,constant: 16),
            skillsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            skillsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            skillsStackView.bottomAnchor.constraint(equalTo: skillsScrollView.bottomAnchor)
            
        ])
    }
}
