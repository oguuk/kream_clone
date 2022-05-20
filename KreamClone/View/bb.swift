//
//  CollectionCell.swift
//  KreamClone
//
//  Created by 오국원 on 2022/05/16.
//

import UIKit

class CollectionCell:UICollectionViewCell {
    
    var item: String? {
        didSet {
            self.label.text = item
        }
    }
    
    lazy var label:UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configure() {
        backgroundColor = .blue
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
}
