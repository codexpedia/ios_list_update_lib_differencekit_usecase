//
//  FoodTableViewController.swift
//  ios_list_update_lib_differencekit_usecase
//
//  Created by Peng on 1/30/19.
//  Copyright © 2019 codexpedia. All rights reserved.
//

import UIKit
import DifferenceKit

class FoodTableViewController: UITableViewController {
    var data = [FoodSection]()
    var inputData: [FoodSection] {
        get {
            return data
        }
        set {
            //whenever the inputData gets assigned a newValue, this block of code will be executed and it will update the table view with the new set of data.
            let changeset = StagedChangeset(source: data, target: newValue)
            tableView.reload(using: changeset, with: .fade) { data in
                self.data = data
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputData = DataFactory.createSampleData()
    }

    @IBAction func refresh(_ sender: UIBarButtonItem) {
        inputData = DataFactory.createSampleData()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].elements.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section].elements[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].model.rawValue
    }
}
