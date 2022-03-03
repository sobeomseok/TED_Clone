//
//  SectionHeader.swift
//  TED_Clone
//
//  Created by 민선기 on 2022/03/03.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    static let identifier: String = "SectionHeader"
    
    let title: UILabel = {
       let label = UILabel()
        //label.backgroundColor = .darkGray
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpTitle()
        //backgroundColor = .systemMint
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpTitle() {
        addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
}
