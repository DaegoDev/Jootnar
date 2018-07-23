//
//  MockWorkouts.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/4/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

struct MockWorkouts {
    static let weigthLiftingCategory: WorkoutCategory = RawWorkoutCategory(id: 0, name: "Weigth Lifting")
    static let calisthenicCategory: WorkoutCategory = RawWorkoutCategory(id: 0, name: "Calisthenic")
    static let crossfitCategory: WorkoutCategory = RawWorkoutCategory(id: 0, name: "Crossfit")

    static let pullUpSection: ExerciseSection = RawExerciseSection(id: 0, order: 0, rounds: 10, roundType: .repetitions ,exercise: MockExercises.pullUp)
    static let chinUpSection: ExerciseSection = RawExerciseSection(id: 1, order: 1, rounds: 10, roundType: .repetitions ,exercise: MockExercises.chinUp)
    static let muscleUpSection: ExerciseSection = RawExerciseSection(id: 2, order: 2, rounds: 6, roundType: .repetitions ,exercise: MockExercises.muscleUp)
    
    static let crunchSection: ExerciseSection = RawExerciseSection(id: 3, order: 0, rounds: 15, roundType: .repetitions ,exercise: MockExercises.crunch)
    static let plankSection: ExerciseSection = RawExerciseSection(id: 4, order: 1, rounds: 45, roundType: .seconds ,exercise: MockExercises.plank)

    static let backWorkoutSection: WorkoutSection = RawWorkoutSection(id: 1, name: "Back Workout", order: 0, rounds: 4, exerciseSections: [pullUpSection, chinUpSection, muscleUpSection])
    static let abdominalsWorkoutSection: WorkoutSection = RawWorkoutSection(id: 2, name: "Abdominal Workout", order: 1, rounds: 4, exerciseSections: [crunchSection, plankSection])
    
    static let bonampaComment: Comment = RawComment(id: 0, content: "", createdAt: Date())
    static let daegoComment: Comment = RawComment(id: 1, content: "Worst workout i ever tried.", createdAt: Date())
    static let jpohComment: Comment = RawComment(id: 2, content: "It was ok, pretty average", createdAt: Date())

    static let bonampaRating: Rating = RawRating(id: 0, rate: 5, comment: bonampaComment, user: MockUsers.bonampa)
    static let daegoRating: Rating = RawRating(id: 0, rate: 1, comment: daegoComment, user: MockUsers.daego)
    static let jpohRating: Rating = RawRating(id: 0, rate: 3, comment: jpohComment, user: MockUsers.jpoh)
    
    static let backWorkout: Workout = RawWorkout(
        id: 0,
        title: "Back Workout for Volume",
        description: "",
        thumbnail: "https://cdn.pixabay.com/photo/2014/09/25/23/36/man-461195_960_720.jpg",
        createdAt: Date(),
        user: MockUsers.bonampa,
        workoutCategory: calisthenicCategory,
        workoutSections: [backWorkoutSection],
        ratings: [bonampaRating, daegoRating, jpohRating]
    )
    
    static let backAndAbdominalsWorkout: Workout = RawWorkout(
        id: 1,
        title: "Back and Abdominals Workout for Volume",
        description: """
        Try out this amazing workout!!.

        I got the best results with this routine, I assure you will love it.
        """,
        thumbnail: "https://cdn.pixabay.com/photo/2016/11/29/06/15/adult-1867743_960_720.jpg",
        createdAt: Date(),
        user: MockUsers.jpoh,
        workoutCategory: calisthenicCategory,
        workoutSections: [backWorkoutSection, abdominalsWorkoutSection],
        ratings: [daegoRating, jpohRating]
    )
}
