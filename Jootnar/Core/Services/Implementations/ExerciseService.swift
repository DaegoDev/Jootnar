//
//  ExerciseService.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/4/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

class ExerciseService: Service, ExerciseServiceProtocol {
    func getExercises(completion: @escaping ([Exercise]) -> Void) {
        completion([])
    }
}
