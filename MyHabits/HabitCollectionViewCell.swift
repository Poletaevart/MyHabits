//
//  HabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Artem Poletaev on 02.10.2022.
//

import UIKit

class HabitCollectionViewCell: UICollectionViewCell {
    var updatingDelegate: UpdatingCollectionDataDelegate?
    static let identifier = "HabitCollectionViewCell"
    var checkMarkIsChecked = false
    
    public var habit: Habit? {
        didSet {
            habitNameLb.text = habit?.name
            habitNameLb.textColor = habit?.color
            habitTimeLb.text = habit?.dateString
            checkMark.layer.borderColor = habit?.color.cgColor
            habitCountLb.text = "Счетчик: \((habit?.trackDates.count)!)"
        }
    }
    
    private lazy var habitNameLb: UILabel = {
        let habitNameLb = UILabel()
        habitNameLb.numberOfLines = 2
        habitNameLb.translatesAutoresizingMaskIntoConstraints = false
        return habitNameLb
    }()
    
    private lazy var habitTimeLb: UILabel = {
        let habitTimeLb = UILabel()
        habitTimeLb.font = .systemFont(ofSize: 12)
        habitTimeLb.textColor = .systemGray2
        habitTimeLb.translatesAutoresizingMaskIntoConstraints = false
        return habitTimeLb
    }()
    
    private lazy var habitCountLb: UILabel = {
        let habitCountLb = UILabel()
        habitCountLb.font = .systemFont(ofSize: 13)
        habitCountLb.textColor = .systemGray2
        habitCountLb.translatesAutoresizingMaskIntoConstraints = false
        return habitCountLb
    }()
    
    public lazy var checkMark: UIImageView = {
       let checkMark = UIImageView()
        checkMark.contentMode = .scaleAspectFit
        checkMark.backgroundColor = .white
        checkMark.layer.borderWidth = 2.0
        checkMark.layer.cornerRadius = 19
        checkMark.isUserInteractionEnabled = true
        checkMark.translatesAutoresizingMaskIntoConstraints = false
        return checkMark
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(changeCheckMark))
        checkMark.addGestureRecognizer(tap)
    }
    
    func setupView() {
        contentView.addSubview(habitNameLb)
        contentView.addSubview(habitTimeLb)
        contentView.addSubview(habitCountLb)
        contentView.addSubview(checkMark)
        
        NSLayoutConstraint.activate([
            habitNameLb.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            habitNameLb.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            habitNameLb.heightAnchor.constraint(equalToConstant: 22),
            
            habitTimeLb.topAnchor.constraint(equalTo: habitNameLb.bottomAnchor, constant: 4),
            habitTimeLb.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            habitTimeLb.heightAnchor.constraint(equalToConstant: 16),
            
            habitCountLb.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            habitCountLb.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            habitCountLb.heightAnchor.constraint(equalToConstant: 18),
            
            checkMark.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkMark.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            checkMark.heightAnchor.constraint(equalToConstant: 38),
            checkMark.widthAnchor.constraint(equalToConstant: 38),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func changeCheckMark() {
        if checkMarkIsChecked == false && habit?.isAlreadyTakenToday == false {
            checkMark.backgroundColor = habit?.color
            checkMark.image = UIImage(systemName: "checkmark")
            checkMark.tintColor = .white
            checkMarkIsChecked = true
            HabitsStore.shared.track(habit!)
            self.updatingDelegate?.updateCollection()
            print("Пользователь успешно добавил привычку")
        } else {
            print("Привычка уже отслеживается до сегодняшнего дня")
        }
    }
}



