//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Artem Poletaev on 02.10.2022.
//

import UIKit

class HabitDetailsViewController: UIViewController {
    public let habit: Habit
    
    private var habitViewController = HabitViewController()
    public var updatingDelegate: UpdatingCollectionDataDelegate?
    
    private let dateFormatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:a"
            dateFormatter.locale = Locale(identifier: "en_US")
            return dateFormatter
        }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 100
        tableView.register(HabitDetailsHeaderView.self, forHeaderFooterViewReuseIdentifier: HabitDetailsHeaderView.headerViewReuseIdentifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultcell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init(habit: Habit) {
        self.habit = habit
        super.init(nibName: nil, bundle: nil)
        title = habit.name
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.systemPurple
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .plain, target: self, action: #selector(editHabit))
        setupView()
        
    }
    
    func setupView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func editHabit() {
        habitViewController.myTitle = "Сохранить"
        habitViewController.check = false
        habitViewController.habitDetailsViewController = self
        
        self.navigationController?.pushViewController(habitViewController, animated: true)
        self.habitViewController.deleteHabitButton.isHidden = false
        self.habitViewController.nameTextFieldHabit.text = self.habit.name
        self.habitViewController.habitTimeDatePicker.date = self.habit.date
        self.habitViewController.colorView.backgroundColor = self.habit.color
        self.habitViewController.habitTimeDateTextLabel.text = self.dateFormatter.string(from: habit.date)
        self.updatingDelegate?.updateCollection()
    }
    
    @objc func showDeleteAlert(_ sender: UIButton) {
        let deleteAlertController = UIAlertController(title: "Удалить привычку?", message: "Вы хотите удалить привычку '\(habit.name)'?", preferredStyle: .alert)
        let cancelDeleteAction = UIAlertAction(title: "Отмена", style: .default) { _ in
        }
        let completeDeleteAction = UIAlertAction(title: "Удалить", style: .destructive) { _ in
            if let oldHabit = HabitsStore.shared.habits.firstIndex(where: ({ $0.name == self.habit.name })) {
                HabitsStore.shared.habits.remove(at: oldHabit )
            }
            
            self.dismiss(animated: true) {
                self.updatingDelegate?.updateCollection()
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
        deleteAlertController.addAction(cancelDeleteAction)
        deleteAlertController.addAction(completeDeleteAction)
        self.present(deleteAlertController, animated: true, completion: nil)
    }
    
}

extension HabitDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habit.trackDates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultcell", for: indexPath)
        cell.textLabel?.text = HabitsStore.shared.trackDateString(forIndex: HabitsStore.shared.dates.count - 1 - indexPath.item)
        if HabitsStore.shared.habit(habit, isTrackedIn: HabitsStore.shared.dates[HabitsStore.shared.dates.count - 1 - indexPath.item]) == true {
            cell.accessoryType = .checkmark
            }
            cell.isUserInteractionEnabled = false
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: HabitDetailsHeaderView.headerViewReuseIdentifier) as? HabitDetailsHeaderView else { return nil }
        return header
       
    }
    
}
extension HabitDetailsViewController: UpdatingCollectionDataDelegate {
    func updateCollection() {
        self.updatingDelegate?.updateCollection()
    }
    
    
}


