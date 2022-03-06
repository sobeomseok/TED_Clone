//
//  FirstSectionCollectionViewCell.swift
//  TED_Clone
//
//  Created by 민선기 on 2022/03/03.
//

import UIKit

class FirstSectionCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "FirstSectionCollectionViewCell"
    
    let video: UIView = {
       let view = UIView()
        return view
    }()
    
    let title: UILabel = {
       let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpVideo()
        setUpTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpVideo() {
        contentView.addSubview(video)
        video.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            video.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            video.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            video.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
        ])
    }
    
    private func setUpTitle() {
        contentView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: video.bottomAnchor, constant: 8),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }
}
