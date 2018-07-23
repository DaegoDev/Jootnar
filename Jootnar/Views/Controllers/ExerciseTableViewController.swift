//
//  ExerciseTableViewController.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/3/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ExerciseTableViewController: UITableViewController {

    final let cellIdentifier = "ExerciseTableViewCell"
    var exercisesViewModel: ExercisesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exercisesViewModel = ExercisesViewModel(dependencies: ExercisesViewModel.Dependencies())
        exercisesViewModel.onExercisesDidUpdate = onExercisesDidUpdate
        exercisesViewModel.onExerciseDidSelect = onExerciseDidSelect
        exercisesViewModel.loadExercises()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ExerciseDetailPageViewController {
            destinationVC.exercisesViewModel = exercisesViewModel
        }
    }
}

// MARK: - TableView Delegate Methods.
extension ExerciseTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercisesViewModel.exercises?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? ExerciseTableViewCell else {
            fatalError("The dequeued cell is not an instance of WorkoutTableViewCell.")
        }
        
        self.setupCell(cell, exercise: exercisesViewModel.exercises![indexPath.row])
        
        return cell
    }
    
    func setupCell(_ cell: ExerciseTableViewCell, exercise: Exercise) {
        cell.name.text = exercise.name
        cell.difficulty.text = "\(exercise.difficulty) out of 5"
        
        if let thumbnailURL = try? exercise.thumbnail.asURL() {
            cell.thumbnail.af_setImage(withURL: thumbnailURL)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let exercise = exercisesViewModel.exercises?[indexPath.row] else { return }
        exercisesViewModel.selectExercise(exercise)
    }
}

// MARK: - Exercises View Model callbacks
extension ExerciseTableViewController {
    func onExercisesDidUpdate() {
        self.tableView.reloadData()
    }
    
    func onExerciseDidSelect() {
        
    }
}
