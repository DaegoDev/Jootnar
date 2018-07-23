//
//  WorkoutsViewController.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 6/29/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class WorkoutsViewController: UITableViewController {
    let cellIdentifier = "WorkoutTableViewCell"
    var workoutsViewModel: WorkoutsViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workoutsViewModel = WorkoutsViewModel(dependencies: WorkoutsViewModel.Dependencies())
        workoutsViewModel.onWorkoutsDidUpdate = onWorkoutsDidUpdate
        
        workoutsViewModel.loadWorkouts()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? WorkoutDetailPageViewController {
            destinationVC.workoutsViewModel = workoutsViewModel
        }
    }
}

// MARK: - TableView Delegate Methods.
extension WorkoutsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutsViewModel.workouts?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? WorkoutTableViewCell else {
            fatalError("The dequeued cell is not an instance of WorkoutTableViewCell.")
        }
        
        setupCell(cell, workout: workoutsViewModel.workouts![indexPath.row])
        
        return cell
    }
    
    func setupCell(_ cell: WorkoutTableViewCell, workout: Workout) {
        cell.title.text = workout.title
        cell.ratingControl.rating = workout.ratings[0].rate
        
        if let thumbnailURL = try? workout.thumbnail.asURL() {
            cell.thumbnail.af_setImage(withURL: thumbnailURL)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let workout = workoutsViewModel.workouts?[indexPath.row] else { return }
        workoutsViewModel.selectWorkout(workout)
    }
}

// MARK - Workouts View Model callbacks
extension WorkoutsViewController {
    func onWorkoutsDidUpdate() {
        self.tableView.reloadData()
    }
}
