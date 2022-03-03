//
//  ViewController.swift
//  TED_Clone
//
//  Created by 민선기 on 2022/03/01.
//

import UIKit

struct Section {
    let type: String
    let video: [Item]
}

struct Item {
    let video: UIColor
    let title: String
}

class HomeViewController: UIViewController {
    
    let mock: [Section] = [
        Section(type: "", video: [Item(video: .systemPink, title: "")]),
        Section(type: "New on TED", video: [Item(video: .red, title: "My secret to creating real magic")]),
        Section(type: "Newest", video: [
            Item(video: .yellow, title: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "),
            Item(video: .green, title: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "),
            Item(video: .blue, title: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "),
            Item(video: .systemMint, title: "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged"),
            Item(video: .systemPink, title: "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged"),
        ]),
        Section(type: "Trending", video: [
            Item(video: .yellow, title: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "),
            Item(video: .green, title: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "),
            Item(video: .blue, title: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "),
            Item(video: .systemMint, title: "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged"),
            Item(video: .systemPink, title: "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged"),
        ]),
        ]
        
    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationController?.navigationBar.isHidden = true

        
        setUpCollectionView()
    }

    private func setUpCollectionView() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            self.layout(for: sectionIndex)
        }
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = .black
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier)
        collectionView.register(FirstSectionCollectionViewCell.self, forCellWithReuseIdentifier: FirstSectionCollectionViewCell.identifier)
        collectionView.register(SubSectionCollectionViewCell.self, forCellWithReuseIdentifier: SubSectionCollectionViewCell.identifier)
        collectionView.register(AppTitleCollectionViewCell.self, forCellWithReuseIdentifier: AppTitleCollectionViewCell.identifier)
        view.addSubview(collectionView)
        self.collectionView = collectionView
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return mock.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1

        default:
            return mock[section].video.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as? SectionHeader else {
            return UICollectionViewCell()
        }

        let item = mock[indexPath.section].video[indexPath.row]
        
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppTitleCollectionViewCell.identifier, for: indexPath) as? AppTitleCollectionViewCell else { return UICollectionViewCell() }

            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstSectionCollectionViewCell.identifier, for: indexPath) as? FirstSectionCollectionViewCell else { return UICollectionViewCell() }
            
            cell.video.backgroundColor = item.video
            cell.title.text = item.title
            
            header.title.text = mock[indexPath.section].type
            return cell
            
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubSectionCollectionViewCell.identifier, for: indexPath) as? SubSectionCollectionViewCell else { return UICollectionViewCell() }
            
            cell.video.backgroundColor = item.video
            cell.title.text = item.title
            
            header.title.text = mock[indexPath.section].type
            return cell
        }

    }
}

extension HomeViewController {
    func layout(for section: Int) -> NSCollectionLayoutSection {
        switch section {
        case 0:
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .estimated(60))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
            
            let section = NSCollectionLayoutSection(group: group)
            
            return section
            
        case 1:
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(240))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0)
            
            let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(60))
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            section.boundarySupplementaryItems = [sectionHeader]
            
            return section
            
        default:
            
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6), heightDimension: .estimated(180))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 10)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0)
            section.orthogonalScrollingBehavior = .continuous
            //section.interGroupSpacing = 15
            
            let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50))
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            section.boundarySupplementaryItems = [sectionHeader]
            
            return section
            
        }
    }
}
