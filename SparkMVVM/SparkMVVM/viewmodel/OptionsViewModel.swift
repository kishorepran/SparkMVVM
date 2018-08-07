//
//  OptionsViewModel.swift
//  SparkMVVM
//
//  Created by Pran Kishore on 07/08/18.
//  Copyright © 2018 Sample Projects. All rights reserved.
//

import Foundation

class OptionsViewModel: NSObject {
    
    var question : Question
    
    init(_ question : Question) {
        self.question = question
        super.init()
    }
    
    func numberOfRows(in section : Int) -> Int {
        switch section {
        case 0:
            return question.question_type.options.count
        case 1:
            return question.question_type.options.count
        default:
            return 0
        }
    }
    
    func numberOfSections() -> Int {
        return question.question_type.type == .single_choice ? 1 : 2
    }
}
