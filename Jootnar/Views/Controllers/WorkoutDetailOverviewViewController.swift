//
//  RatingTableViewController.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/9/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import UIKit

class WorkoutDetailOverviewViewController: UIViewController {
    @IBOutlet weak var workoutTitleLabel: UILabel!
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratinControl: RatingControl!
    
    var workoutsViewModel: WorkoutsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {        
        guard let workout = workoutsViewModel?.selectedWorkout else {
            return
        }
        
        let calendar = Calendar.current
        let year = calendar.component(.year, from: workout.createdAt)
        let month = calendar.component(.month, from: workout.createdAt)
        let day = calendar.component(.day, from: workout.createdAt)
        
        workoutTitleLabel.text = workout.title
        dateLabel.text = "\(month)/\(day)/\(year)"
        ownerLabel.text = workout.user.username
        descriptionLabel.text = workout.description
        ratinControl.rating = workout.ratings.first?.rate ?? 0
        
        if let thumbnailURL = try? workout.thumbnail.asURL() {
            thumbnailImage.af_setImage(withURL: thumbnailURL)
        }
    }
}

