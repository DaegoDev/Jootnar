//
//  UserExercise.swift
//  CoordinatorExample
//
//  Created by Juan Pablo Ospina Herrera on 6/29/18.
//  Copyright © 2018 Juan Pablo Ospina Herrera. All rights reserved.
//

import Foundation

protocol UserExercise {
    var id: Int { get set }
    var exercises: [Exercise] { get set }
    var user: User { get set }
}

struct RawUserExercise: UserExercise {
    var id: Int
    var exercises: [Exercise]
    var user: User
}
