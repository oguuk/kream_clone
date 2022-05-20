//
//  HomeHeaderUIView.swift
//  KreamClone
//
//  Created by 오국원 on 2022/05/20.
//

import UIKit

class HomeHeaderUIView: UIView {
    
    //MARK: -Properties
    private let homeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        let image = UIImage(named: "kream")?.withRenderingMode(.alwaysOriginal)
        imageView.image = image

        return imageView
    }()
    
    //MARK: -Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(homeImageView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        homeImageView.frame = bounds
    }
    
    //MARK: -Helpers
}
