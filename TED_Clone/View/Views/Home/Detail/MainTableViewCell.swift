//
//  MainTableViewCell.swift
//  TED_Clone
//
//  Created by 민선기 on 2022/03/04.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    static let identifier: String = "MainTableViewCell"
    
    /// 비디오
    private let video: UIView = {
        // 나중에 뷰 -> 비디오 수정
        let video = UIView()
        video.backgroundColor = .systemMint
        video.translatesAutoresizingMaskIntoConstraints = false
        return video
    }()
    
    /// 제목
    private let title: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .heavy)
        label.numberOfLines = 2
        label.textColor = .white
        label.text = "My secret to creating real magic"
        return label
    }()
    
    /// 발표자
    private let speaker: UILabel = {
       let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14)
        label.text = "Christina Tosi"
        return label
    }()
    
    private let separator: UILabel = {
       let label = UILabel()
        label.textColor = .gray
        label.text = "|"
        return label
    }()
    
    /// 동영상 본 횟수
    private let viewer: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14)
        label.text = "88,678 views"
         return label
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton()
        button.tintColor = .gray
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        button.tintColor = .gray
        return button
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setUpConstraint()
        setUpButtonImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    /// 아이콘, 버튼 내 이미지 등 UIImage의 크기를 조절 하는 함수
    /// - Parameters:
    ///     - with: 이미지 systemName
    ///     - pointSize: 이미지 크기
    /// - Returns: UIImage?
    private func imagePointSize(with imageName: String, pointSize: CGFloat) -> UIImage? {
        let config = UIImage.SymbolConfiguration(pointSize: pointSize)
        let image = UIImage(systemName: imageName, withConfiguration: config)
        return image
    }
    
    private func setUpButtonImage() {
        likeButton.setImage(imagePointSize(with: "heart", pointSize: 28), for: .normal)
        shareButton.setImage(imagePointSize(with: "heart", pointSize: 28), for: .normal)
    }
    
    /// 셀 컨텐츠에 대한 레이아웃 설정
    private func setUpConstraint() {
        let innerStackView1 = UIStackView(arrangedSubviews: [speaker, separator, viewer])
        innerStackView1.axis = .horizontal
        innerStackView1.spacing = 4

        
        let innerStackView2 = UIStackView(arrangedSubviews: [likeButton, shareButton])
        innerStackView2.axis = .horizontal
        innerStackView2.spacing = 12
        //innerStackView2.backgroundColor = .red
        
        let outerStackView = UIStackView(arrangedSubviews: [title, innerStackView1, innerStackView2])
        outerStackView.spacing = 12
        outerStackView.axis = .vertical
        outerStackView.alignment = .leading
        addSubViews(outerStackView, video)
        
        innerStackView2.translatesAutoresizingMaskIntoConstraints = false
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            video.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            video.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            video.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            video.heightAnchor.constraint(equalToConstant: 240),
        
            innerStackView2.heightAnchor.constraint(equalToConstant: 80),
            
            outerStackView.topAnchor.constraint(equalTo: video.bottomAnchor, constant: 16),
            outerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            outerStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            outerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
        
    }
}
