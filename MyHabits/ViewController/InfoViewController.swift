//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Artem Poletaev on 20.09.2022.
//

import UIKit

class InfoViewController: UIViewController {
    let myTitle = "Информация"
    
    private lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var contenierView: UIView = {
       let contenierView = UIView()
        contenierView.translatesAutoresizingMaskIntoConstraints = false
        return contenierView
    }()
    
    private let textTitle: UILabel = {
        let textTitle = UILabel()
        textTitle.text = "Привычка за 21 день"
        textTitle.textColor = .black
        textTitle.font = .boldSystemFont(ofSize: 24)
        textTitle.numberOfLines = 1
        return textTitle
    }()
    private let textHeader: UILabel = {
        let textHeader = UILabel()
        textHeader.textColor = .black
        textHeader.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:"
        textHeader.numberOfLines = 0
        return textHeader
    }()
    
    private let textPartOne: UILabel = {
        let textPartOne = UILabel()
        textPartOne.textColor = .black
        textPartOne.text = "1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага."
        textPartOne.numberOfLines = 0
        return textPartOne
    }()
    
    private let textPartTwo: UILabel = {
        let textPartTwo = UILabel()
        textPartTwo.textColor = .black
        textPartTwo.text = "2. Выдержать 2 дня в прежнем состоянии самоконтроля."
        textPartTwo.numberOfLines = 0
        return textPartTwo
    }()
    
    private let textPartThree: UILabel = {
        let textPartThree = UILabel()
        textPartThree.textColor = .black
        textPartThree.text = "3. Отметить в дневнике первую неделю изменений и подвести первые итоги — что оказалось тяжело, что — легче, с чем еще предстоит серьезно бороться."
        textPartThree.numberOfLines = 0
        return textPartThree
    }()
    
    private let textPartFour: UILabel = {
        let textPartFour = UILabel()
        textPartFour.textColor = .black
        textPartFour.text = "4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств."
        textPartFour.numberOfLines = 0
        return textPartFour
    }()
    
    private let textPartFive: UILabel = {
        let textPartFive = UILabel()
        textPartFive.textColor = .black
        textPartFive.text = "5. Держать планку 40 дней. Практикующий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой."
        textPartFive.numberOfLines = 0
        return textPartFive
    }()
    
    private let textPartSix: UILabel = {
        let textPartSix = UILabel()
        textPartSix.textColor = .black
        textPartSix.text = "6. На 90-й день соблюдения техники все лишнее из «прошлой жизни» перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся."
        textPartSix.numberOfLines = 0
        return textPartSix
    }()
    
    // Info text footer
    private let footNote: UILabel = {
        let footNote = UILabel()
        footNote.textColor = .black
        footNote.text = "Источник: psychbook.ru"
        return footNote
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem = UITabBarItem(title: self.myTitle, image: UIImage(named: "info.circle.fill"), tag: 1)
        title = self.myTitle
        view.backgroundColor = .white
        setupView()
    }
    
    func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contenierView)
        contenierView.addSubviews(
            textTitle,
            textHeader,
            textPartOne,
            textPartTwo,
            textPartThree,
            textPartFour,
            textPartFive,
            textPartSix,
            footNote
        )
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contenierView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contenierView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contenierView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contenierView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contenierView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            
            textTitle.topAnchor.constraint(equalTo: contenierView.topAnchor, constant: 22),
            textTitle.leadingAnchor.constraint(equalTo: contenierView.leadingAnchor, constant: 10),
            textTitle.trailingAnchor.constraint(equalTo: contenierView.trailingAnchor, constant: -10),
            
            textHeader.topAnchor.constraint(equalTo: textTitle.bottomAnchor, constant: 15),
            textHeader.leadingAnchor.constraint(equalTo: contenierView.leadingAnchor, constant: 10),
            textHeader.trailingAnchor.constraint(equalTo: contenierView.trailingAnchor, constant: -10),
            
            textPartOne.topAnchor.constraint(equalTo: textHeader.bottomAnchor, constant: 10),
            textPartOne.leadingAnchor.constraint(equalTo: contenierView.leadingAnchor, constant: 10),
            textPartOne.trailingAnchor.constraint(equalTo: contenierView.trailingAnchor, constant: -10),
            
            textPartTwo.topAnchor.constraint(equalTo: textPartOne.bottomAnchor, constant: 10),
            textPartTwo.leadingAnchor.constraint(equalTo: contenierView.leadingAnchor, constant: 10),
            textPartTwo.trailingAnchor.constraint(equalTo: contenierView.trailingAnchor, constant: -10),
            
            textPartThree.topAnchor.constraint(equalTo: textPartTwo.bottomAnchor, constant: 10),
            textPartThree.leadingAnchor.constraint(equalTo: contenierView.leadingAnchor, constant: 10),
            textPartThree.trailingAnchor.constraint(equalTo: contenierView.trailingAnchor, constant: -10),
            
            textPartFour.topAnchor.constraint(equalTo: textPartThree.bottomAnchor, constant: 10),
            textPartFour.leadingAnchor.constraint(equalTo: contenierView.leadingAnchor, constant: 10),
            textPartFour.trailingAnchor.constraint(equalTo: contenierView.trailingAnchor, constant: -10),
            
            textPartFive.topAnchor.constraint(equalTo: textPartFour.bottomAnchor, constant: 10),
            textPartFive.leadingAnchor.constraint(equalTo: contenierView.leadingAnchor, constant: 10),
            textPartFive.trailingAnchor.constraint(equalTo: contenierView.trailingAnchor, constant: -10),
            
            textPartSix.topAnchor.constraint(equalTo: textPartFive.bottomAnchor, constant: 10),
            textPartSix.leadingAnchor.constraint(equalTo: contenierView.leadingAnchor, constant: 10),
            textPartSix.trailingAnchor.constraint(equalTo: contenierView.trailingAnchor, constant: -10),
            
            footNote.topAnchor.constraint(equalTo: textPartSix.bottomAnchor, constant: 15),
            footNote.leadingAnchor.constraint(equalTo: contenierView.leadingAnchor, constant: 10),
            footNote.trailingAnchor.constraint(equalTo: contenierView.trailingAnchor, constant: -10),
            footNote.bottomAnchor.constraint(equalTo: contenierView.bottomAnchor, constant: -15)
        ])
        
    }

}

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
}
