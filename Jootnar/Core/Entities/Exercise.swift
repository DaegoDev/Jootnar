//
//  Exercise.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 6/29/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

// MARK: - ENUMS
enum ExerciseProperty: String {
    case equipment = "Equipment"
    case muscle = "Muscle"
    case type = "Type"
}

// MARK: - PROTOCOLS
protocol Exercise {
    var id: Int { get set }
    var name: String { get set }
    var description: String { get set }
    var createdAt: Date { get set }
    var difficulty: Int { get set }
    var thumbnail: String { get set }
    var user: User { get set }
    var multimedia: [Multimedia] { get set }
    var exerciseGoals: [ExerciseGoal] { get set }
    var exerciseAttributes: [ExerciseAttribute] { get set }
}

protocol ExerciseAttribute {
    var id: Int { get set }
    var name: String { get set }
    var exerciseProperty: ExerciseProperty { get set }
}

protocol ExerciseGoal {
    var id: Int { get set }
    var goal: String { get set }
    var suggestedRepetitions: Int { get set }
}

// MARK: - IMPLEMENTATIONS
struct RawExercise: Exercise {
    var id: Int
    var name: String
    var description: String
    var createdAt: Date
    var difficulty: Int
    var thumbnail: String
    var user: User
    var multimedia: [Multimedia]
    var exerciseGoals: [ExerciseGoal]
    var exerciseAttributes: [ExerciseAttribute]
}

struct RawExerciseAttribute: ExerciseAttribute {
    var id: Int
    var name: String
    var exerciseProperty: ExerciseProperty
}

struct RawExerciseGoal: ExerciseGoal {
    var id: Int
    var goal: String
    var suggestedRepetitions: Int
}
