//
//  AppTitleCollectionViewCell.swift
//  TED_Clone
//
//  Created by 민선기 on 2022/03/03.
//

import UIKit

class AppTitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "AppTitleCollectionViewCell"
    
    let title: UILabel = {
       let label = UILabel()
        label.textColor = .red
        //label.font = .boldSystemFont(ofSize: 40)
        label.font = .systemFont(ofSize: 40, weight: .black)
        label.text = "TED"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpTitle()
        //backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError("fatal error in AppTitleCollectionViewCell")
    }
    
    private func setUpTitle() {
        addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
