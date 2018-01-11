//
//  QuizTypeTableViewCell.swift
//  quiz4kids
//
//  Created by whiteship on 12/30/17.
//  Copyright © 2017 whiteship. All rights reserved.
//

import UIKit

class QuizTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statisticsLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
