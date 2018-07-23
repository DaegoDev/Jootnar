//
//  ListExercises.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/4/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

class ListExercises: UseCaseImplementation, ListExercisesProtocol {
    func listExercises(completion: @escaping ([Exercise]) -> Void) {
        guard let exerciseRepository = repository as? ExerciseRepositoryProtocol else {
            completion([])
            return
        }
        
        exerciseRepository.getExercises { exercises in
            completion(exercises)
        }
    }   
}
