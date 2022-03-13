//
//  SearchViewController.swift
//  TED_Clone
//
//  Created by 민선기 on 2022/03/01.
//

import UIKit

class SearchViewController: UIViewController {

    //MARK: - Properties
    private let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "검색"
        search.searchTextField.textColor = .white
        search.tintColor = .lightGray
        search.searchTextField.leftView?.tintColor = .lightGray
        return search
    }()
    
    private let searchView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let playerLabel: UILabel = {
       let label = UILabel()
        label.text = "모든 동영상"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let listButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.up.arrow.down"), for: .normal)
        button.tintColor = .darkGray
        
        return button
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        
        view.backgroundColor = .backgroundColor
        
        navigationItem.titleView = searchBar
        
        makeLayout()
    }
    
    //MARK: - Helper Function
    private func makeLayout() {
        view.addSubview(searchView)
        searchView.anchor(top:view.safeAreaLayoutGuide.topAnchor,left: view.leadingAnchor,right: view.trailingAnchor,height: 60)
        
        searchView.addSubview(playerLabel)
        playerLabel.centerY(inView: searchView)
        playerLabel.anchor(left: searchView.leadingAnchor,paddingLeft: 20)
        
        searchView.addSubview(listButton)
        listButton.centerY(inView: searchView)
        listButton.anchor(right: searchView.trailingAnchor,paddingRight: 20)
        
        view.addSubview(tableView)
        tableView.anchor(top: searchView.bottomAnchor, left: view.leadingAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor,right: view.trailingAnchor)
        
    }
    
    
    
    
    
    
    
}


//MARK: - 서치바 델리게이트
extension SearchViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.placeholder = ""
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
}



//MARK: - 테이블뷰 데이터 소스
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else { return UITableViewCell()}
        return cell
    }
    
    
    
}

//MARK: - 테이블뷰 델리게이트
extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}



//MARK: - 테이블뷰 셀 커스텀

class SearchTableViewCell: UITableViewCell {
    
    static let identifier = "searchCell"
    
    private let thumbnailImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .systemBlue
        return image
    }()
    
    private let teacherNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Bas and Water"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    
    private let lectureLabel: UILabel = {
        let label = UILabel()
        label.text = "What seaweed and cowburps have to do with climate action"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setLayout() {
        addSubview(thumbnailImage)
        thumbnailImage.centerY(inView: self)
        thumbnailImage.anchor(left: self.leadingAnchor, paddingLeft: 20,width: 160,height: 90)
        
        addSubview(teacherNameLabel)
        teacherNameLabel.anchor(top: thumbnailImage.topAnchor,left: thumbnailImage.trailingAnchor,right: self.trailingAnchor,paddingTop:5 ,paddingLeft: 20,paddingRight: 20)
        
        addSubview(lectureLabel)
        lectureLabel.anchor(left: thumbnailImage.trailingAnchor,bottom: thumbnailImage.bottomAnchor,right: self.trailingAnchor,paddingLeft: 20,paddingBottom: 5,paddingRight: 20)
    }
    
    
    
}

