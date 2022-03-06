//
//  DetailsTableViewCell.swift
//  TED_Clone
//
//  Created by 민선기 on 2022/03/04.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    static let identifier: String = "DetailsTableViewCell"
    
    /// DETAILS 텍스트
    private let detailsTitle: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.text = "DETAILS"
         return label
    }()
    
    /// DETAILS 텍스트 밑에 구분선
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    /// 비디오에 대한 설명
    private let detailsDescription: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.text = "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."
        let attributedString = NSMutableAttributedString(string: label.text ?? "")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        label.attributedText = attributedString
         return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraint() {
        let innerStackView = UIStackView(arrangedSubviews: [detailsTitle, separator])
        innerStackView.axis = .vertical
        innerStackView.spacing = 6
        
        let outerStackView = UIStackView(arrangedSubviews: [innerStackView, detailsDescription])
        outerStackView.axis = .vertical
        outerStackView.spacing = 16
        outerStackView.alignment = .leading
        
        addSubview(outerStackView)
        separator.translatesAutoresizingMaskIntoConstraints = false
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            outerStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            outerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            outerStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14),
            outerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            separator.heightAnchor.constraint(equalToConstant: 1.5)
        ])
    }
}
