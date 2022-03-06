//
//  WatchNextTableViewCell.swift
//  TED_Clone
//
//  Created by 민선기 on 2022/03/06.
//

import UIKit

class WatchNextTableViewCell: UITableViewCell {

    static let identifier: String = "WatchNextTableViewCell"

    var collectionView: UICollectionView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCollectionView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpCollectionView() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            self.layout()
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier)
        collectionView.register(SubSectionCollectionViewCell.self, forCellWithReuseIdentifier: SubSectionCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        contentView.addSubview(collectionView)
        self.collectionView = collectionView
        
        
        NSLayoutConstraint.activate([

            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
    
    func layout() -> NSCollectionLayoutSection {

            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6), heightDimension: .absolute(180))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 10)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0)
            section.orthogonalScrollingBehavior = .continuous
            
            let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50))
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            section.boundarySupplementaryItems = [sectionHeader]
            
            return section
            
        
    }
}

extension WatchNextTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubSectionCollectionViewCell.identifier, for: indexPath) as? SubSectionCollectionViewCell,
              let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as? SectionHeader
        else {
            return UICollectionViewCell()
        }
        header.title.text = "Watch next"
        cell.video.backgroundColor = .red
        cell.title.text = "SwiftUI is awesome. So we need to learn!"
        
        return cell
    }
}
