//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Artem Poletaev on 20.09.2022.
//

import UIKit

class InfoViewController: UIViewController{
    let myTitle = "Информация"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem = UITabBarItem(title: self.myTitle, image: UIImage(named: "info.circle.fill"), tag: 1)
        title = self.myTitle
        view.backgroundColor = .white
    }
}
