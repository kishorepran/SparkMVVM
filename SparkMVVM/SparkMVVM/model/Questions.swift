//
//  Questions.swift
//  SparkMVVM
//
//  Created by Pran Kishore on 06/08/18.
//  Copyright © 2018 Sample Projects. All rights reserved.
//

import Foundation

// MARK: - Model for parsing JSON Response


//Type of User Options for Question
enum QuestionType : String , Codable {
    case single_choice
    case single_choice_conditional
    case number_range
}

//Numerical range for a user to select.
struct NumberRange: Codable {
    let  from : Int
    let  to : Int
}

//Options for a question that a user can select ONLY Single choice is allowed.
class SingleChoiceOption: Codable {
    let  options : [String]
    let  type : QuestionType
    let  condition : Condition?
    
    init(options: [String] , type : QuestionType , condition : Condition? ) {
        self.options = options
        self.type = type
        self.condition = condition
    }
}

//Options for a question that involves a range
struct RangeOption: Codable {
    let  range : NumberRange
    let  type : QuestionType
}

//A Condition for a question. Evaluation for statisfaction
class Condition: Codable {
    
    let  predicate : [String: [String]]
    let  positiveQuestion : RangedQuestion
    
    enum CodingKeys: String, CodingKey {
        case predicate
        case positiveQuestion = "if_positive"
    }
    
    init(predicate: [String: [String]] , positiveQuestion : RangedQuestion ) {
        self.predicate = predicate
        self.positiveQuestion = positiveQuestion
    }
    
    var isPositive = false
}

//Framework for an item to qualify as a question
protocol Question : Codable {
    //The actual question
    var  question : String {get}
    var  category : String {get}
    var userResponse : String {get set}
}

//A question involving range of options
class RangedQuestion: Question {

    let  question : String
    let  category : String
    let  question_type : RangeOption
    
    init(question: String , category : String , question_type : RangeOption ) {
        self.question = question
        self.category = category
        self.question_type = question_type
    }
    
    enum CodingKeys: String, CodingKey {
        case question
        case category
        case question_type
    }
    
    var userResponse = "N/A"
}

//A simple single choice question
class SingleChoiceQuestion: Question {
    
    let  question : String
    let  category : String
    let  question_type : SingleChoiceOption
    
    enum CodingKeys: String, CodingKey {
        case question
        case category
        case question_type
    }
    
    var userResponse = "N/A"
}

class Questionnaire: Codable {
    
    let  categories : [String]
    let  questions : [SingleChoiceQuestion]
    
    init(categories: [String] , questions : [SingleChoiceQuestion] ) {
        self.categories = categories
        self.questions = questions
    }
}

// MARK: - Model for displaying in UI
class QuestionSet: Codable {
    
    let  category : String
    let  questions : [SingleChoiceQuestion]
    
    init(_ category: String ,_ questions : [SingleChoiceQuestion] ) {
        self.category = category
        self.questions = questions
    }
}
