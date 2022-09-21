//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Artem Poletaev on 20.09.2022.
//

import UIKit
class HabitsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "СЕГОДНЯ"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "addHabit"), style: .plain, target: self, action: #selector(newHabit))
        tabBarItem = UITabBarItem(title: "Привычки", image: UIImage(named: "habits_tab_icon"), tag: 0)
        
    }
    
    @objc func newHabit() {
        let habitsViewController = HabitsViewController()
    //    newHabitVC.myTitle = "Создать"
        self.navigationController?.pushViewController(habitsViewController, animated: true)
       // newHabitVC.updatingDelegate = self
    }
}
