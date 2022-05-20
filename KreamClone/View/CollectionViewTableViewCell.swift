//
//  CollectionViewTableViewCell.swift
//  KreamClone
//
//  Created by 오국원 on 2022/05/20.
//

import UIKit

private let bannerCollectionViewCell = "BannerCollectionViewCell"

class CollectionViewTableViewCell: UITableViewCell {
    
    //MARK: -Properties
    private var images:[UIImage?] = [UIImage]()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 400)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: bannerCollectionViewCell)
        
        return collectionView
    }()
    
//    private let imagesForSections = []
    //MARK: -Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    //MARK: -Helpers
    public func configure(with section:[UIImage?]) {
        self.images = section
        DispatchQueue.main.async { [weak self] in
            self!.collectionView.reloadData()
        }
    }
}

extension CollectionViewTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bannerCollectionViewCell, for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell()}
        cell.UIconfigure(with: (images[indexPath.row] ?? UIImage(named: "white"))!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
}
