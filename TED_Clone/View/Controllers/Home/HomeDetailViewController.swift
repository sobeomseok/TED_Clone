//
//  HomeDetailViewController.swift
//  TED_Clone
//
//  Created by 민선기 on 2022/03/03.
//

import UIKit

class HomeDetailViewController: UIViewController {
    
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .none
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        tableView.register(DetailsTableViewCell.self, forCellReuseIdentifier: DetailsTableViewCell.identifier)
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
        tableView.register(WatchNextTableViewCell.self, forCellReuseIdentifier: WatchNextTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.backgroundColor
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.topItem?.title = "Home"
        
        setUpTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    
    private func setUpTableView() {
        view.addSubViews(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension HomeDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else {
                return UITableViewCell()
            }
            
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailsTableViewCell.identifier, for: indexPath) as? DetailsTableViewCell else {
                return UITableViewCell()
            }
            
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell else {
                return UITableViewCell()
            }
            
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            
            return cell
            
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WatchNextTableViewCell.identifier, for: indexPath) as? WatchNextTableViewCell else {
                return UITableViewCell()
            }
            
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 {
            return 240.0
        }
        return UITableView.automaticDimension
    }
}
