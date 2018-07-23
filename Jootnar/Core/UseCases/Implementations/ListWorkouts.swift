//
//  ListWorkouts.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 6/29/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

class ListWorkouts: UseCaseImplementation, ListWorkoutsProtocol {
    func listWorkouts(completion: @escaping ([Workout]) -> Void) {
        guard let workoutRepository = repository as? WorkoutRepositoryProtocol else {
            completion([])
            return
        }
        
        workoutRepository.getWorkouts { workouts in
            completion(workouts)            
        }
    }
}
