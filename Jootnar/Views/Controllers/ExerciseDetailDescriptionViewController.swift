//
//  ExerciseDetailDescriptionViewController.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/6/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import UIKit

class ExerciseDetailDescriptionViewController: UIViewController {

    @IBOutlet weak var descriptionTextView: UITextView!
    
    var exercisesViewModel: ExercisesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.descriptionTextView.text = exercisesViewModel?.selectedExercise?.description
    }
}
