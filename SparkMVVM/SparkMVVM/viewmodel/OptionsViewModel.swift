//
//  OptionsViewModel.swift
//  SparkMVVM
//
//  Created by Pran Kishore on 07/08/18.
//  Copyright © 2018 Sample Projects. All rights reserved.
//

import Foundation

class OptionsViewModel: NSObject {
    
    var question : SingleChoiceQuestion
    
    init(_ question : SingleChoiceQuestion) {
        self.question = question
        super.init()
    }
    
    func numberOfRows(in section : Int) -> Int {
        return numberOfRows(for: question.question_type.type, section)
    }
    
    func numberOfSections() -> Int {
        if let condition = question.question_type.condition , condition.isPositive == true {
            return 2
        } else {
            return 1
        }
    }
    
    private func numberOfRows(for question_type : QuestionType , _ section : Int ) -> Int {
        switch question_type {
        case .single_choice_conditional:
            if let conditon = question.question_type.condition , conditon.isPositive == true , section == 1 {
                //Now in case of conditional question we have ranged based question ONLY so hardcoding to 1
                //TODO: Move to a question type where in case of condition we might have multiple choice question as well.
                return 1
            }
            fallthrough
        case .single_choice:
            return question.question_type.options.count
        default:
            return 0
        }
    }
    
    func evaluate(response : String) -> Bool {
        //Check if we have a condition to evaluate.
        guard let condition = question.question_type.condition else { return false}
        //TODO: Move to a predicate type where we could potentially get "Contains" "less than" etc.
        if let check = condition.predicate["exactEquals"] , let expectation = check.last , expectation == response {
            condition.isPositive = true
        } else {
            condition.isPositive = false
        }
        return true
    }
    
}
