//
//  QuestionsTableViewCell.swift
//  SparkMVVM
//
//  Created by Pran Kishore on 06/08/18.
//  Copyright © 2018 Sample Projects. All rights reserved.
//

import UIKit

class QuestionsTableViewCell: UITableViewCell {

    @IBOutlet weak var questionLabel : UILabel!
    @IBOutlet weak var answerLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
