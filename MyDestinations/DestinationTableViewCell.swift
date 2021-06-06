//
//  DestinationTableViewCell.swift
//  MyDestinations
//
//  Created by Student on 04.05.2021..
//  Copyright © 2021 Ivan Barisic. All rights reserved.
//

import UIKit
import SDWebImage

class DestinationTableViewCell: UITableViewCell {

    @IBOutlet weak var destinationImageView: UIImageView!
    @IBOutlet weak var destinationTitleLabel: UILabel!
    @IBOutlet weak var destinationSubtitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        destinationTitleLabel.setAppearance(appearance: TitleAppearance())
        destinationSubtitleLabel.setAppearance(appearance: TitleAppearance())
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func config(with title: String, subtitle: String, imageUrl: String?){
        destinationTitleLabel.text = title
        destinationSubtitleLabel.text = subtitle
        let url = URL(string: imageUrl ?? "")
        destinationImageView.sd_setImage(with: url, completed: nil)
    }
}
