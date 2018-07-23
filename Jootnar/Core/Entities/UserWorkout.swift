//
//  UserWorkout.swift
//  CoordinatorExample
//
//  Created by Juan Pablo Ospina Herrera on 6/29/18.
//  Copyright © 2018 Juan Pablo Ospina Herrera. All rights reserved.
//

import Foundation

protocol UserWorkout {
    var id: Int { get set }
    var workouts: [Workout] { get set }
    var user: User { get set }
}

struct RawUserWorkout: UserWorkout {
    var id: Int
    var workouts: [Workout]
    var user: User
}
