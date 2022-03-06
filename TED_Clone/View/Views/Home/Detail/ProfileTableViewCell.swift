//
//  ProfileTableViewCell.swift
//  TED_Clone
//
//  Created by 민선기 on 2022/03/05.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    static let identifier: String = "ProfileTableViewCell"
    
    /// 발표자 이미지 뷰
    private let speakerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPink
         return imageView
    }()
    
    /// 발표자 이름
    private let speakerName: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.text = "Christina Tosi"
         return label
    }()
    
    /// 발표자 직업
    private let speakerJob: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = "Baker"
         return label
    }()
    
    /// 발표자 정보
    private let speakerInfo: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "Christina Tosi is the award-winning chef and owner of Milk Bar."
         return label
    }()
    
    private let speakerTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "TEDWomen 2021"
         return label
    }()
    
    private let separator: UILabel = {
       let label = UILabel()
        label.text = "|"
        label.textColor = .white
        return label
    }()
    
    private let titleDate: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "December 2021"
         return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpConstraint()
        setUpSpeakerImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraint() {
        /// 이름, 직업을 담는 스택뷰
        let innerStackView1 = UIStackView(arrangedSubviews: [speakerName, speakerJob])
        innerStackView1.axis = .vertical
        innerStackView1.distribution = .fillEqually
        
        /// 이미지뷰와 스택뷰(이름, 직업)
        let innerStackView2 = UIStackView(arrangedSubviews: [speakerImageView, innerStackView1])
        innerStackView2.axis = .horizontal
        innerStackView2.spacing = 8
        
        /// 날짜, 연도 부분
        let innerStackView3 = UIStackView(arrangedSubviews: [speakerTitle, separator, titleDate])
        innerStackView3.axis = .horizontal
        innerStackView3.spacing = 4
        
        let outerStackView = UIStackView(arrangedSubviews: [innerStackView2, speakerInfo, innerStackView3])
        outerStackView.spacing = 14
        outerStackView.axis = .vertical
        outerStackView.alignment = .leading
        addSubview(outerStackView)
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        speakerImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            speakerImageView.widthAnchor.constraint(equalToConstant: 50),
            speakerImageView.heightAnchor.constraint(equalToConstant: 50),
            
            outerStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            outerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            outerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            outerStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    private func setUpSpeakerImageView() {
        speakerImageView.layer.cornerRadius = 25
        speakerImageView.clipsToBounds = false
    }
}
