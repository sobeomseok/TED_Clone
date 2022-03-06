//
//  ProfileViewController.swift
//  TED_Clone
//
//  Created by 민선기 on 2022/03/01.
//

import UIKit

class ProfileViewController: UIViewController {
    //MARK: - profile Properties
    
    private let tableView: UITableView = {
        let tableview = UITableView(frame: .zero, style: .grouped)
        tableview.backgroundColor = .backgroundColor
        tableview.separatorInset.left = 0
        tableview.separatorColor = UIColor(white: 1, alpha: 0.2)
        tableview.isScrollEnabled = false
        return tableview
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ProfileViewCell.self, forCellReuseIdentifier: ProfileViewCell.identifier)
        tableView.register(ProfilTableviewCellHeader.self, forHeaderFooterViewReuseIdentifier: ProfilTableviewCellHeader.identifier)
        tableView.dataSource = self
        tableView.delegate = self
 
        makeLayout()
        view.backgroundColor = .backgroundColor
    }
    
    
    private func makeLayout() {
        view.addSubview(tableView)
        tableView.frame = view.frame
    }

}



//MARK: - 테이블뷰 데이터 소스
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileViewCell.identifier, for: indexPath) as? ProfileViewCell else { return UITableViewCell() }
        switch indexPath.row {
        case 0:
            cell.NameimageView.image = UIImage(systemName: "heart")
            cell.nameLabel.text = "좋아요"
            cell.accLabel.text = "\(0)"
            return cell
        case 1:
            cell.NameimageView.image = UIImage(systemName: "clock")
            cell.nameLabel.text = "기록"
            cell.accLabel.text = "\(0)"
            return cell
        case 3:
            cell.NameimageView.image = UIImage(systemName: "gearshape")
            cell.accessoryType = .disclosureIndicator
            cell.nameLabel.text = "설정"
            return cell
        default:
            cell.selectionStyle = .none
            return cell
        }
    }
    
    
}


//MARK: - 테이블뷰 델리게이트
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfilTableviewCellHeader.identifier) as? ProfilTableviewCellHeader else { return UIView() }
        return header
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2 {
            return 70
        }
        return 50
    }
}

//MARK: - 커스텀 셀

class ProfileViewCell: UITableViewCell {
    static let identifier = "ProfileCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        cellSetting()
    }

        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    let accLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
     let NameimageView: UIImageView = {
        let image = UIImageView()
        image.tintColor = .darkGray
        return image
    }()

    
    
    func cellSetting() {
        addSubview(NameimageView)
        NameimageView.anchor(left: self.leadingAnchor,paddingLeft: 20,width: 30,height: 30)
        NameimageView.centerY(inView: self)
        
        addSubview(nameLabel)
        nameLabel.anchor(left: NameimageView.trailingAnchor,paddingLeft: 20)
        nameLabel.centerY(inView: self)
        
        addSubview(accLabel)
        accLabel.anchor(right: self.trailingAnchor,paddingRight: 20)
        accLabel.centerY(inView: self)
    }
}


//MARK: - 테이블뷰 셀 헤더
class ProfilTableviewCellHeader: UITableViewHeaderFooterView {
    static let identifier = "header"
    
    
    override init(reuseIdentifier: String?) {
        super .init(reuseIdentifier: reuseIdentifier)
         headerSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    private let labelView: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "귀하"
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.circle")
        image.tintColor = .darkGray
        return image
    }()
    
   private func headerSetting() {
       addSubview(imageView)
       imageView.anchor(top:self.topAnchor,left: self.leadingAnchor,bottom: self.bottomAnchor, paddingTop: -20,paddingLeft: 20,paddingBottom: 30,width: 60,height: 60)
       
       addSubview(labelView)
       labelView.anchor(left: imageView.trailingAnchor,right: self.trailingAnchor,paddingLeft: 20,paddingRight: 20)
       labelView.centerY(inView: imageView)
    }
}
