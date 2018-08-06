//
//  Questions.swift
//  SparkMVVM
//
//  Created by Pran Kishore on 06/08/18.
//  Copyright © 2018 Sample Projects. All rights reserved.
//

//User responses for product

//User responses for product
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
    
}

class Questionnaire: Codable {
    
    let  categories : [String]
    let  questions : [Question]
    
    enum CodingKeys: String, CodingKey {
        case categories
        case questions
    }
    
    
    init(categories: [String] , questions : [Question] ) {
        self.categories = categories
        self.questions = questions
    }
}
