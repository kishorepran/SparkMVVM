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


class RangedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var valueLabel : UILabel!
    @IBOutlet weak var slider : UISlider!
    
    let step:Float=5 // Need UISlider to snap to steps by 5
    
    var maximumValue : Int = 0 {
        didSet {
            slider.maximumValue = Float(maximumValue)
        }
    }
    
    var minimumValue : Int = 0 {
        didSet {
            slider.minimumValue = Float(minimumValue)
            valueLabel.text = "\(minimumValue)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    @IBAction func valueDidChange(_ sender:UISlider!) {
        // Use this code below only if you want UISlider to snap to values step by step
        let roundedStepValue = round(sender.value / step) * step
        sender.value = roundedStepValue
        valueLabel.text = "\(Int(roundedStepValue))"
    }
}
