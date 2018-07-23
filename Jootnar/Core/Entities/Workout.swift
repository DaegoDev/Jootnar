//
//  Workout.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 6/29/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

// MARK: - ENUMS

enum RoundType: String {
    case repetitions = "Repetitions"
    case seconds = "Seconds"
    case minutes = "Minutes"
}

// MARK: - PROTOCOLS
protocol Workout {
    var id: Int { get set }
    var title: String { get set }
    var description: String { get set }
    var thumbnail: String { get set }
    var createdAt: Date { get set }
    var user: User { get set }
    var workoutCategory: WorkoutCategory? { get set }
    var workoutSections: [WorkoutSection]? { get set }
    var ratings: [Rating] { get set }
}

protocol WorkoutCategory {
    var id: Int { get set }
    var name: String { get set }
}

protocol WorkoutSection {
    var id: Int { get set }
    var name: String { get set }
    var order: Int { get set }
    var rounds: Int { get set }
    var exerciseSections: [ExerciseSection] { get set }
}

protocol ExerciseSection {
    var id: Int { get set }
    var order: Int { get set }
    var rounds: Int { get set }
    var roundType: RoundType { get set }
    var exercise: Exercise { get set }
}

// MARK: - IMPLEMENTATIONS
struct RawWorkout: Workout {
    var id: Int
    var title: String
    var description: String
    var thumbnail: String
    var createdAt: Date
    var user: User
    var workoutCategory: WorkoutCategory?
    var workoutSections: [WorkoutSection]?
    var ratings: [Rating]
}

struct RawWorkoutCategory: WorkoutCategory {
    var id: Int
    var name: String
}

struct RawWorkoutSection: WorkoutSection {
    var id: Int
    var name: String
    var order: Int
    var rounds: Int
    var exerciseSections: [ExerciseSection]
}

struct RawExerciseSection: ExerciseSection {
    var id: Int
    var order: Int
    var rounds: Int
    var roundType: RoundType
    var exercise: Exercise
}
