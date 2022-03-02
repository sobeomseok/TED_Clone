//
//  PodcastViewController.swift
//  TED_Clone
//
//  Created by 민선기 on 2022/03/01.
//

import UIKit

class PodcastViewController: UICollectionViewController {

    
    
    
    //MARK: - Properties
 
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    




//MARK: - Helper Functions

func configureUI() {
    //백그라운드 컬러를 테드앱과 똑같은 색으로 맞췄습니다.
    collectionView.backgroundColor = .backgroundColor
    
    //컬렉션뷰 관련 코드입니다.
    collectionView.register(PodCastCollectionViewCell.self, forCellWithReuseIdentifier: PodCastCollectionViewCell.identifier)
    collectionView.register(CollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionReusableView.identifier)
    
    //네비게이션 바 관련 코드입니다.
    navigationController?.navigationBar.isHidden = true
    
}






 //MARK: - 컬렉션뷰 데이터소스, 델리게이트

    //컬렉션뷰 셀의 갯수입니다.
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    //컬렉션뷰 셀 생성입니다.
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PodCastCollectionViewCell.identifier, for: indexPath) as? PodCastCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
   //컬렉션뷰 헤더 생성입니다.
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionReusableView.identifier, for: indexPath) as? CollectionReusableView else { return UICollectionReusableView() }
        return headerView
    }
    
    

}




//MARK: - 컬렉션뷰 셀 레이아웃
extension PodcastViewController: UICollectionViewDelegateFlowLayout {
    //컬렉션뷰셀의 너비와 높이 조정 메서드입니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2 - 35
        return CGSize(width: width, height: width)
    }
    
    //헤더의 너비와 높이 조정 메서드입니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 60)
    }
    
    
    //컬렉션뷰 셀의 섹션의 상하 좌우 여백 조정 메서드입니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 50, right: 20)
    }
    
    //컬렉션뷰 셀 위 아래 여백 조정 메서드입니다.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }

    
}






//MARK: - 셀 커스텀
class PodCastCollectionViewCell: UICollectionViewCell {
    
    //indentifier의 실수를 방지하기 위해 변수로 만듭것입니다.
    static let identifier = "podCastCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cellSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private let imageView: UIImageView = {
       let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "PodcastImage1")
       return img
    }()
    
    private let labelView: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.text = "1212.12.12"
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    
    private func cellSetting() {
        addSubview(imageView)
        imageView.anchor(top: self.topAnchor, left: self.leadingAnchor , bottom: self.bottomAnchor, right: self.trailingAnchor)
        
        addSubview(labelView)
        labelView.anchor(top: imageView.bottomAnchor, paddingTop: 10)
    }
}



//MARK: - 헤더 커스텀

class CollectionReusableView: UICollectionReusableView {
    
    static let identifier = "header"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        headerSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private let labelView: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "TED 팟 캐스트"
        label.font = .boldSystemFont(ofSize: 23)
        return label
    }()
    
   private func headerSetting() {
       addSubview(labelView)
       labelView.anchor(top: self.topAnchor, left: self.leadingAnchor, bottom: self.bottomAnchor, right: self.trailingAnchor,paddingLeft: 20,paddingBottom: 20)
    }
}
