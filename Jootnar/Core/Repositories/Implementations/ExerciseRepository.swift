//
//  ExerciseRepository.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/4/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

class ExerciseRepository: Repository, ExerciseRepositoryProtocol {
    func getExercises(completion: @escaping ([Exercise]) -> Void) {
        let mockExercises: [Exercise] = [
            MockExercises.chinUp,
            MockExercises.crunch,
            MockExercises.muscleUp,
            MockExercises.plank,
            MockExercises.pullUp
        ]
        completion(mockExercises)
    }
}
