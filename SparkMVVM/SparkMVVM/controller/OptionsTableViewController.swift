//
//  OptionsTableViewController.swift
//  SparkMVVM
//
//  Created by Pran Kishore on 07/08/18.
//  Copyright © 2018 Sample Projects. All rights reserved.
//

import UIKit

class OptionsTableViewController: UITableViewController {

    var viewModel : OptionsViewModel!
    var selectedIndex : IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        title = "Options"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = indexPath.section == 0 ? "single_choice" : "number_range"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        // Configure the cell...
        if let element = cell as? RangedTableViewCell {
            element.maximumValue = (viewModel.question.question_type.condition?.positiveQuestion.question_type.range.to) ?? 0
            element.minimumValue = (viewModel.question.question_type.condition?.positiveQuestion.question_type.range.from) ?? 0
        } else {
            let option = viewModel.question.question_type.options[indexPath.row]
            cell.textLabel?.text = option
            cell.accessoryType = viewModel.question.userResponse == option ? .checkmark : .none
        }
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: Perform action based on question type remove hardcoded section logic.
        if indexPath.section > 0 {return}
        let option = viewModel.question.question_type.options[indexPath.row]
        viewModel.question.userResponse = option
        //Check if we have a condition and we need to update our table view.
        let needsUpdate = viewModel.evaluate(response: option)
        if needsUpdate {
            tableView.reloadData()
        } else {
            updateSelection(for: indexPath)
        }
        selectedIndex = indexPath
    }
    
    func updateSelection(for indexPath: IndexPath) {
        var reloadIndex = [indexPath]
        if let lastIndex = selectedIndex , lastIndex.compare(indexPath) != .orderedSame {
            reloadIndex.append(lastIndex)
        }
        tableView.reloadRows(at: reloadIndex, with: .automatic)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
