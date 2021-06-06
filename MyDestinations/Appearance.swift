//
//  Appearance.swift
//  MyDestinations
//
//  Created by Student on 04.05.2021..
//  Copyright © 2021 Ivan Barisic. All rights reserved.
//

import UIKit

protocol Appearance {
    var font: UIFont {get set}
    var textColor: UIColor {get set}
    var backgroundColor: UIColor {get set}
}
struct TitleAppearance: Appearance {
    var font: UIFont = UIFont.systemFont(ofSize: 16)
    var textColor: UIColor = UIColor.systemRed
    var backgroundColor: UIColor = UIColor.systemYellow
}
extension UILabel {
    func setAppearance(appearance: Appearance) {
        self.font = appearance.font
        self.textColor = appearance.textColor
        self.backgroundColor = appearance.backgroundColor
    }
}
