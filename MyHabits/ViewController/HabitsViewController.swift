//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Artem Poletaev on 20.09.2022.
//

import UIKit

protocol UpdatingCollectionDataDelegate: AnyObject {
    func updateCollection()
}
protocol MakeACallFromEditToDetail {
    func makeACall()
}


class HabitsViewController: UIViewController {
    
    private var habitDetailsViewController: HabitDetailsViewController?
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        layout.minimumLineSpacing = 12
        layout.scrollDirection = .vertical
        return layout
    }()
    
    public lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: HabitCollectionViewCell.identifier)
        collectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: ProgressCollectionViewCell.identifier)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "defaultcell")
        collectionView.backgroundColor = .systemGray6
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "СЕГОДНЯ"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "addHabit"), style: .plain, target: self, action: #selector(newHabit))
        tabBarItem = UITabBarItem(title: "Привычки", image: UIImage(named: "habits_tab_icon"), tag: 0)
        setupView()
    }
    
    func setupView() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func newHabit() {
        let newHabitVC = HabitViewController()
        newHabitVC.myTitle = "Создать"
        self.navigationController?.pushViewController(newHabitVC, animated: true)
        newHabitVC.updatingDelegate = self
    }

}

extension HabitsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 1 : HabitsStore.shared.habits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let progressCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgressCollectionViewCell.identifier, for: indexPath) as? ProgressCollectionViewCell else { return collectionView.dequeueReusableCell(withReuseIdentifier: "defaultcell", for: indexPath)}
        progressCell.progressLb.text = "\(Int(HabitsStore.shared.todayProgress * 100))%"
        progressCell.progressView.setProgress(HabitsStore.shared.todayProgress, animated: true)
        progressCell.layer.cornerRadius = 8
        
        guard let habitCell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitCollectionViewCell.identifier, for: indexPath) as? HabitCollectionViewCell else { return collectionView.dequeueReusableCell(withReuseIdentifier: "defaultcell", for: indexPath)}
        
        guard HabitsStore.shared.habits.count > indexPath.row else { return collectionView.dequeueReusableCell(withReuseIdentifier: "defaultcell", for: indexPath) }
        
        let habit = HabitsStore.shared.habits[indexPath.item]
        habitCell.updatingDelegate = self
        habitCell.habit = habit
        habitCell.layer.cornerRadius = 8
        if habitCell.habit?.isAlreadyTakenToday == true {
            habitCell.checkMark.backgroundColor = habit.color
            habitCell.checkMark.image = UIImage(systemName: "checkmark")
            habitCell.checkMark.tintColor = .white
        } else {
            habitCell.checkMark.backgroundColor = .white
        }
        return indexPath.section == 0 ? progressCell : habitCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section != 0 {
            let habit = HabitsStore.shared.habits[indexPath.item]
            habitDetailsViewController = HabitDetailsViewController(habit: habit)
            
            if habitDetailsViewController != nil {
                navigationController?.pushViewController(habitDetailsViewController!, animated: true)
                habitDetailsViewController!.updatingDelegate = self
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - layout.sectionInset.left - layout.sectionInset.right
        return indexPath.section == 0 ? CGSize(width: width, height: 60) : CGSize(width: width, height: 130)
    }
}

extension HabitsViewController: UpdatingCollectionDataDelegate {
    func updateCollection() {
        collectionView.reloadData()
    }
}



