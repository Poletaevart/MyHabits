//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Artem Poletaev on 28.09.2022.
//

import UIKit

class  HabitViewController: UIViewController{
    
    public lazy var myTitle: String = ""
    private lazy var habitColor: UIColor = .black
    
    private lazy var namelabelHabit: UILabel = {
        let nameHabitLb = UILabel()
        nameHabitLb.font = .systemFont(ofSize: 13, weight: .bold)
        nameHabitLb.text = "НАЗВАНИЕ"
        nameHabitLb.textColor = .black
        nameHabitLb.translatesAutoresizingMaskIntoConstraints = false
        return nameHabitLb
    }()
    
    public lazy var nameTextFieldHabit: UITextField = {
        let nameHabitTF = UITextField()
        nameHabitTF.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        nameHabitTF.font = .systemFont(ofSize: 17)
        nameHabitTF.textColor = .black
        nameHabitTF.layer.borderWidth = 0.5
        nameHabitTF.layer.borderColor = UIColor.lightGray.cgColor
        nameHabitTF.tintColor = UIColor.lightText
        nameHabitTF.autocapitalizationType = .none
        nameHabitTF.returnKeyType = .done
        nameHabitTF.translatesAutoresizingMaskIntoConstraints = false
        return nameHabitTF
    }()
    
    private lazy var nameLabelColor: UILabel = {
        let nameColorLb = UILabel()
        nameColorLb.font = .systemFont(ofSize: 13, weight: .bold)
        nameColorLb.text = "ЦВЕТ"
        nameColorLb.textColor = .black
        nameColorLb.translatesAutoresizingMaskIntoConstraints = false
        return nameColorLb
    }()
    
    public lazy var colorView: UIView = {
        let colorView = UIView()
        colorView.backgroundColor = habitColor
        colorView.isUserInteractionEnabled = true
        colorView.translatesAutoresizingMaskIntoConstraints = false
        return colorView
    }()
    
    private lazy var timeLabel: UILabel = {
        let timeLb = UILabel()
        timeLb.font = .systemFont(ofSize: 13, weight: .bold)
        timeLb.text = "ВРЕМЯ"
        timeLb.textColor = .black
        timeLb.translatesAutoresizingMaskIntoConstraints = false
        return timeLb
    }()
    
    private lazy var habitTimeTextLabel: UILabel = {
        let habitTimeTextLb = UILabel()
        habitTimeTextLb.font = .systemFont(ofSize: 17)
        habitTimeTextLb.text = "Каждый день в "
        habitTimeTextLb.textColor = .black
        habitTimeTextLb.translatesAutoresizingMaskIntoConstraints = false
        return habitTimeTextLb
    }()
    
    public lazy var habitTimeDateTextLabel: UILabel = {
        let habitTimeDateTextLb = UILabel()
        habitTimeDateTextLb.font = .systemFont(ofSize: 17)
        habitTimeDateTextLb.textColor = UIColor.purple
        habitTimeDateTextLb.translatesAutoresizingMaskIntoConstraints = false
        return habitTimeDateTextLb
    }()
    
    public lazy var habitTimeDatePicker: UIDatePicker = {
        let habitTimeDatePicker = UIDatePicker()
        habitTimeDatePicker.datePickerMode = .time
        habitTimeDatePicker.preferredDatePickerStyle = .wheels
        habitTimeDatePicker.translatesAutoresizingMaskIntoConstraints = false
        return habitTimeDatePicker
    }()
    
    public lazy var deleteHabitButton: UIButton = {
        let deleteHabitButton = UIButton(type: .system)
        deleteHabitButton.setTitle("Удалить привычку", for: .normal)
        deleteHabitButton.setTitleColor(.red, for: .normal)
        deleteHabitButton.isHidden = true
        deleteHabitButton.translatesAutoresizingMaskIntoConstraints = false
        return deleteHabitButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = myTitle
        
        self.navigationController?.navigationBar.tintColor = UIColor.systemPurple
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(cancelButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(addButton))
        setupView()
    }
    
    private func setupView() {
        
        view.addSubview(namelabelHabit)
        view.addSubview(nameTextFieldHabit)
        view.addSubview(nameLabelColor)
        view.addSubview(colorView)
        view.addSubview(timeLabel)
        view.addSubview(habitTimeTextLabel)
        view.addSubview(habitTimeDateTextLabel)
        view.addSubview(habitTimeDatePicker)
        view.addSubview(deleteHabitButton)
        
        NSLayoutConstraint.activate([
            namelabelHabit.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            namelabelHabit.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 21),
            namelabelHabit.heightAnchor.constraint(equalToConstant: 18),
            
            nameTextFieldHabit.topAnchor.constraint(equalTo: namelabelHabit.bottomAnchor, constant: 7),
            nameTextFieldHabit.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameTextFieldHabit.heightAnchor.constraint(equalToConstant: 22),
            nameTextFieldHabit.widthAnchor.constraint(equalToConstant: 295),
            
            nameLabelColor.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameLabelColor.topAnchor.constraint(equalTo: nameTextFieldHabit.bottomAnchor, constant: 15),
            nameLabelColor.heightAnchor.constraint(equalToConstant: 18),
            
            colorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            colorView.topAnchor.constraint(equalTo: nameLabelColor.bottomAnchor, constant: 7),
            colorView.widthAnchor.constraint(equalToConstant: 30),
            colorView.heightAnchor.constraint(equalToConstant: 30),
            
            timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            timeLabel.topAnchor.constraint(equalTo: colorView.bottomAnchor, constant: 15),
            timeLabel.heightAnchor.constraint(equalToConstant: 18),
            
            habitTimeTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            habitTimeTextLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 7),
            habitTimeTextLabel.heightAnchor.constraint(equalToConstant: 22),
            
            habitTimeDateTextLabel.leadingAnchor.constraint(equalTo: habitTimeTextLabel.trailingAnchor),
            habitTimeDateTextLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 7),
            habitTimeDateTextLabel.heightAnchor.constraint(equalToConstant: 22),
            
            habitTimeDatePicker.topAnchor.constraint(equalTo: habitTimeDateTextLabel.bottomAnchor, constant: 15),
            habitTimeDatePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            habitTimeDatePicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            deleteHabitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -18),
            deleteHabitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
    @objc func cancelButton() {
        navigationController?.popViewController(animated: true)
    }
    @objc func addButton() {
    }
}
