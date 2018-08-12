//
//  SparkMVVMTests.swift
//  SparkMVVMTests
//
//  Created by Pran Kishore on 06/08/18.
//  Copyright © 2018 Sample Projects. All rights reserved.
//

import XCTest
@testable import SparkMVVM

class SparkMVVMTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testViewModels() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        //Init view model
        let viewModel = QuestionsViewModel()
        guard let questionSet = viewModel.questionSet else {
            XCTFail("Could not parse questions / No questions")
            return
        }
        
        XCTAssert(questionSet.count > 2, "Must have 2 categories to test all logic this is now fetched from local JSON response")
        
        let first = questionSet[0]
        let second = questionSet[1]
        
        XCTAssert(first.category <= second.category, "Categories are sorted")
        
        guard let question = first.questions.first else {
            XCTFail("Must have atleast 1 question for a cateogry")
            return
        }
        
        let optionsViewModel = OptionsViewModel.init(question)
        
        XCTAssert(optionsViewModel.numberOfSections() == 1, "For the 1st question we have only section")
        XCTAssert(optionsViewModel.numberOfRows(in: 0) == 3, "For the 1st question we have only 3 options")
        
        
        let option = optionsViewModel.question.question_type.options[0]
        optionsViewModel.question.userResponse = option
        
        XCTAssert(question.userResponse == option, "The response that the user has selected is displayed")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
