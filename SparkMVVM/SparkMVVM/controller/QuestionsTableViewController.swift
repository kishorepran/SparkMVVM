//
//  QuestionsTableViewController.swift
//  SparkMVVM
//
//  Created by Pran Kishore on 06/08/18.
//  Copyright © 2018 Sample Projects. All rights reserved.
//

import UIKit

class QuestionsTableViewController: UITableViewController {

    let viewModel = QuestionsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Questions"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.questionSet?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let item = viewModel.questionSet?[section] else { return 0 }
        return item.questions.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let item = viewModel.questionSet?[section] else { return "N/A" }
        return item.category
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "questionsTableViewCell", for: indexPath) as! QuestionsTableViewCell
        // Configure the cell...
        let item = viewModel.questionSet?[indexPath.section]
        let question = item?.questions[indexPath.row]
        cell.questionLabel.text = question?.question
        cell.answerLabel.text = question?.userResponse
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = viewModel.questionSet?[indexPath.section] {
            let question = item.questions[indexPath.row]
            performSegue(withIdentifier: "question-option", sender: question)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let destinationVC = segue.destination as? OptionsTableViewController , let item  = sender as? Question  {
            destinationVC.viewModel = OptionsViewModel.init(item)
        }
    }
    
}
