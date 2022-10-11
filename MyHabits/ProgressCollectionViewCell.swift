//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Artem Poletaev on 02.10.2022.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProgressCollectionViewCell"
    
    private lazy var nameLb: UILabel = {
        let nameLb = UILabel()
        nameLb.font = .systemFont(ofSize: 13, weight: .light)
        nameLb.text = "Все получится!"
        nameLb.textColor = .black
        nameLb.translatesAutoresizingMaskIntoConstraints = false
        return nameLb
    }()
    
    public lazy var progressLb: UILabel = {
        let progressLb = UILabel()
        progressLb.font = .systemFont(ofSize: 13, weight: .light)
        progressLb.text = "\(Int(HabitsStore.shared.todayProgress * 100))%"
        progressLb.textColor = .black
        progressLb.textAlignment = .right
        progressLb.translatesAutoresizingMaskIntoConstraints = false
        return progressLb
    }()
    
    public lazy var progressView: UIProgressView = {
       let progressView = UIProgressView()
        progressView.setProgress(HabitsStore.shared.todayProgress, animated: true)
        progressView.progressTintColor = UIColor.purple
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
        
    }
    
    func setupView() {
        contentView.addSubview(nameLb)
        contentView.addSubview(progressLb)
        contentView.addSubview(progressView)
        
        NSLayoutConstraint.activate([
            nameLb.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            nameLb.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            nameLb.heightAnchor.constraint(equalToConstant: 18),
            
            progressLb.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            progressLb.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            progressView.topAnchor.constraint(equalTo: nameLb.bottomAnchor, constant: 10),
            progressView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            progressView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            progressView.heightAnchor.constraint(equalToConstant: 7)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
