//
//  WorkoutDetailRatingTableViewController.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/9/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import UIKit

class WorkoutDetailRatingTableViewController: UITableViewController {
    let ratingTableViewCell = "RatingTableViewCell"
    var workoutsViewModel: WorkoutsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutsViewModel?.selectedWorkout?.ratings.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ratingTableViewCell, for: indexPath) as? RatingTableViewCell,
            let rating = workoutsViewModel?.selectedWorkout?.ratings[indexPath.row] else {
            fatalError("The dequeued cell is not an instance of WorkoutTableViewCell.")
        }
        
        let calendar = Calendar.current
        let year = calendar.component(.year, from: rating.comment.createdAt)
        let month = calendar.component(.month, from: rating.comment.createdAt)
        let day = calendar.component(.day, from: rating.comment.createdAt)
        
        cell.usernameLabel.text = rating.user.username
        cell.ratinControl.rating = rating.rate
        cell.commentLabel.text = rating.comment.content
        cell.dateLabel.text = "\(month)/\(day)/\(year)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }    
}
