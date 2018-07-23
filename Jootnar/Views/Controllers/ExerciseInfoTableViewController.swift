//
//  ExerciseInfoTableViewController.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/5/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import UIKit

class ExerciseInfoTableViewController: UITableViewController {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    
    var dateString: String?
    var ownerString: String?
    var difficultyString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = dateString
        ownerLabel.text = ownerString
        difficultyLabel.text = difficultyString
        self.tableView.alwaysBounceVertical = false
    }
}
