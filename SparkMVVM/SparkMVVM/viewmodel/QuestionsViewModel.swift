//
//  QuestionsViewModel.swift
//  SparkMVVM
//
//  Created by Pran Kishore on 06/08/18.
//  Copyright © 2018 Sample Projects. All rights reserved.
//

import Foundation

class QuestionsViewModel: NSObject {
    
    var localJsonData : Data? {
        guard let jsonPath = Bundle.main.path(forResource: "personality_test", ofType: "json") else { return nil }
        let data = NSData.init(contentsOfFile: jsonPath) as Data?
        return data
    }
    
    var questionSet : [QuestionSet]?
    
    override init() {
        super.init()
        prepareQuestions()
    }
    
    private func prepareQuestions () {
        let decoder = JSONDecoder()
        do {
            let item = try decoder.decode(Questionnaire.self, from: localJsonData!)
            questionSet = formatQuestions(questionnaire: item)
        } catch  {
            print(error)
        }
    }
    
    private func formatQuestions (questionnaire : Questionnaire) -> [QuestionSet] {
        
        var items : [QuestionSet] = []
        let categories = questionnaire.categories.sorted()
        for category in categories {
            let questions = questionnaire.questions.filter { (question) -> Bool in
                return question.category == category
            }
            if !questions.isEmpty {
                let item = QuestionSet.init(category, questions)
                items.append(item)
            }
        }
        return items
    }
}
