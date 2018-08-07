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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let option = viewModel.question.question_type.options[indexPath.row]
        cell.textLabel?.text = option
        cell.accessoryType = viewModel.question.userResponse == option ? .checkmark : .none
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let option = viewModel.question.question_type.options[indexPath.row]
        viewModel.question.userResponse = option
        tableView.reloadRows(at: [indexPath], with: .automatic)
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
