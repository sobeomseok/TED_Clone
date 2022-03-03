//
//  HomeCollectionViewCell.swift
//  TED_Clone
//
//  Created by 민선기 on 2022/03/02.
//

import UIKit

class SubSectionCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "SubSectionCollectionViewCell"
    
    let video: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 8
        return view
    }()
    
    let title: UILabel = {
       let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .bold)
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
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }
}
