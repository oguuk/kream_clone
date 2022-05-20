//
//  BannerCollectionViewCell.swift
//  KreamClone
//
//  Created by 오국원 on 2022/05/20.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    //MARK: -Properties
    private let bannerImage:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: -Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bannerImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bannerImage.frame = contentView.bounds
        
    }
    
    //MARK: -Helpers
    public func UIconfigure(with model: UIImage) {
        bannerImage.image = model
    }

}
