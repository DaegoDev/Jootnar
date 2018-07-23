//
//  ViewController.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 6/28/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import UIKit

class ExerciseDetailOverviewViewController: UIViewController {
    @IBOutlet weak var overviewTable: UITableView!
    @IBOutlet weak var infoContainer: UIView!
    
    let goalCellIdentifier = "GoalTableViewCell"
    let exerciseValueCellIdentifier = "ExerciseValueTableViewCell"
    var exercisesViewModel: ExercisesViewModel?
    
    var exerciseValues: [String : [String]]?
    var exerciseGoals: [(String, Int)]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overviewTable?.dataSource = self
        exerciseValues = exercisesViewModel?.filteredExerciseValues()
        exerciseGoals = exercisesViewModel?.exerciseGoals()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let VC = segue.destination as? ExerciseInfoTableViewController,
            let exercise = exercisesViewModel?.selectedExercise {
            
            let calendar = Calendar.current
            let year = calendar.component(.year, from: exercise.createdAt)
            let month = calendar.component(.month, from: exercise.createdAt)
            let day = calendar.component(.day, from: exercise.createdAt)
            
            VC.dateString = "\(month)/\(day)/\(year)"
            VC.ownerString = exercise.user.username
            VC.difficultyString = "\(exercise.difficulty) out of 5"
        }
    }
}

extension ExerciseDetailOverviewViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return (exerciseValues?.count ?? 0) + (exerciseGoals != nil ? 1 : 0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let exerciseGoals = exerciseGoals, section == 0 {
            return exerciseGoals.count
        }
        
        if let exerciseValues = exerciseValues {
            let exerciseValuesKeys = Array(exerciseValues.keys)
            
            if exerciseGoals != nil && section != 0 {
                return exerciseValues[exerciseValuesKeys[section - 1]]?.count ?? 0
            } else {
                return exerciseValues[exerciseValuesKeys[section]]?.count ?? 0
            }
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if exerciseGoals != nil, section == 0 {
            return "Goals"
        }
        
        if let exerciseValues = exerciseValues {
            let exerciseValuesKeys = Array(exerciseValues.keys)
            
            if exerciseGoals != nil && section != 0 {
                return exerciseValuesKeys[section - 1]
            } else {
                return exerciseValuesKeys[section]
            }
        }
        
        return "Not Defined"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let exerciseGoals = exerciseGoals,
            let cell = tableView.dequeueReusableCell(withIdentifier: goalCellIdentifier),
            indexPath.section == 0 {
            
            cell.textLabel?.text = exerciseGoals[indexPath.row].0
            cell.detailTextLabel?.text = "\(exerciseGoals[indexPath.row].1) Repetitions"
            return cell
        }
        
        if let exerciseValues = exerciseValues,
            let cell = tableView.dequeueReusableCell(withIdentifier: exerciseValueCellIdentifier) {
            
            let exerciseValuesKeys = Array(exerciseValues.keys)
            
            if exerciseGoals != nil && indexPath.section != 0 {
                cell.textLabel?.text = exerciseValues[exerciseValuesKeys[indexPath.section - 1]]?[indexPath.row]
            } else {
                cell.textLabel?.text = exerciseValues[exerciseValuesKeys[indexPath.section]]?[indexPath.row]
            }
            
            return cell
        }

        
        return UITableViewCell()
    }
}
