//
//  QuestionsViewModel.swift
//  SparkMVVM
//
//  Created by Pran Kishore on 06/08/18.
//  Copyright © 2018 Sample Projects. All rights reserved.
//

import UIKit



class QuestionsViewModel: NSObject {
    
    var localJsonData : Data? {
        guard let jsonPath = Bundle.main.path(forResource: "personality_test", ofType: "json") else { return nil }
        let data = NSData.init(contentsOfFile: jsonPath) as Data?
        return data
    }
    
    var  questionsList : Questionnaire? {
        let decoder = JSONDecoder()
        do {
            return  try decoder.decode(Questionnaire.self, from: localJsonData!)
        } catch {
            print(error)
            return nil
        }
    }
    
    func questions(for category : String) -> [Question]? {
        let questions = questionsList?.questions.filter({ (questiom) -> Bool in
            return questiom.category == category
        })
        return questions
    }
}
