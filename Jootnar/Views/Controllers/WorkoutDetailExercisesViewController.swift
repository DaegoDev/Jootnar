//
//  WorkoutDetailExercisesViewController.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/10/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import UIKit

class WorkoutDetailExercisesViewController: UIViewController {
    @IBOutlet weak var exercisesTableView: UITableView!
    
    let workoutDetailExercises = "WorkoutDetailExerciseTableViewCell"
    var workoutsViewModel: WorkoutsViewModel?
    var exercisesViewModel: ExercisesViewModel?
    var headers: [String]?
    var exercises: [[[String : String ]]]?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.exercisesTableView.dataSource = self
        self.exercisesTableView.delegate = self
        
        if let viewModel = workoutsViewModel, let workout = viewModel.selectedWorkout {
            headers = viewModel.getWorkoutSectionHeaders(for: workout)
            exercises = viewModel.getExercises(of: workout)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let exerciseDetailVC = segue.destination as? ExerciseDetailPageViewController {
            exerciseDetailVC.exercisesViewModel = exercisesViewModel
        }
    }
}

extension WorkoutDetailExercisesViewController: UITableViewDataSource {
    
    func numberOfSections(in tablewView: UITableView) -> Int {
        return exercises?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises?[section].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers?[section] ?? ""
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: workoutDetailExercises) as? WorkoutDetailExerciseTableViewCell else {
            fatalError("The dequeued cell is not an instance of WorkoutDetailExerciseTableViewCell.")
        }
        
        if let exercise = exercises?[indexPath.section][indexPath.row] {
            cell.nameLabel.text = exercise["name"]
            
            if let rounds = exercise["rounds"], let roundType = exercise["roundType"] {
                cell.repetitionsLabel.text = "\(rounds) \(roundType)"
            }
            
            if let thumbnailURL = try! exercise["thumbnail"]?.asURL() {
                cell.thumbnail.af_setImage(withURL: thumbnailURL)
            }
        }
        
        cell.accessoryType = .none
        
        return cell
    }
}

extension WorkoutDetailExercisesViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        guard let workout = workoutsViewModel?.selectedWorkout,
            let exercise = workoutsViewModel?.findExercise(in: workout, section: indexPath.section, order: indexPath.row) else {
                return indexPath
        }
        
        let exercisesDependencies = ExercisesViewModel.Dependencies(locator: UseCaseLocator(repository: ExerciseRepository(), service: ExerciseService()))
        exercisesViewModel = ExercisesViewModel(dependencies: exercisesDependencies)
        exercisesViewModel?.selectedExercise = exercise
        
        return indexPath
    }
}
