//
//  Questions.swift
//  SparkMVVM
//
//  Created by Pran Kishore on 06/08/18.
//  Copyright © 2018 Sample Projects. All rights reserved.
//

import Foundation

// MARK: - Model for parsing JSON Response
//Type of User responses for product
enum QuestionType : String , Codable {
    case single_choice
    case single_choice_conditional
}

struct QuestionDetail: Codable {
    //Options for a question that a user can select
    let  options : [String]
    let  type : QuestionType
}

class Question: Codable {
    
    //The actual question
    let  question : String
    let  category : String
    let  question_type : QuestionDetail
    
    enum CodingKeys: String, CodingKey {
        case question
        case category
        case question_type
    }
    
    var userResponse = "N/A"
}

class Questionnaire: Codable {
    
    let  categories : [String]
    let  questions : [Question]
    
    init(categories: [String] , questions : [Question] ) {
        self.categories = categories
        self.questions = questions
    }
}

// MARK: - Model for displaying in UI

class QuestionSet: Codable {
    
    let  category : String
    let  questions : [Question]
    
    init(_ category: String ,_ questions : [Question] ) {
        self.category = category
        self.questions = questions
    }
}
