//
//  Extension.swift
//  KreamClone
//
//  Created by 오국원 on 2022/05/20.
//

import UIKit

extension UITabBar {
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 10
        return sizeThatFits
    }
}
