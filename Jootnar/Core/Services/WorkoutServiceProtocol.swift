//
//  WorkoutServiceProtocol.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 6/29/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

protocol WorkoutServiceProtocol {
    func getWorkouts(completion: @escaping ([Workout]) -> Void)
}
