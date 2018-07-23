//
//  MockExercises.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/3/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

struct MockExercises {
    static let volumeGoal: ExerciseGoal = RawExerciseGoal(id: 0, goal: "Volume", suggestedRepetitions: 12)
    static let definitionGoal: ExerciseGoal = RawExerciseGoal(id: 1, goal: "Definition", suggestedRepetitions: 16)
    static let strengthGoal: ExerciseGoal = RawExerciseGoal(id: 2, goal: "Strength", suggestedRepetitions: 6)
    
    static let chestAttribute: ExerciseAttribute = RawExerciseAttribute(id: 0, name: "Chest", exerciseProperty: .muscle)
    static let latsAttribute: ExerciseAttribute = RawExerciseAttribute(id: 1, name: "Lats", exerciseProperty: .muscle)
    static let abdominalsAttribute: ExerciseAttribute = RawExerciseAttribute(id: 2, name: "Abdominals", exerciseProperty: .muscle)
    static let dumbbellAttribute: ExerciseAttribute = RawExerciseAttribute(id: 3, name: "Dumbbell", exerciseProperty: .equipment)
    static let barbellAttribute: ExerciseAttribute = RawExerciseAttribute(id: 4, name: "Barbell", exerciseProperty: .equipment)
    static let bodyOnlyAttribute: ExerciseAttribute = RawExerciseAttribute(id: 5, name: "Body only", exerciseProperty: .equipment)
    static let cardioAttribute: ExerciseAttribute = RawExerciseAttribute(id: 6, name: "Cardio", exerciseProperty: .type)
    static let weightLiftingAttribute: ExerciseAttribute = RawExerciseAttribute(id: 7, name: "Weight Lifting", exerciseProperty: .type)
    static let calisthenicsAttribute: ExerciseAttribute = RawExerciseAttribute(id: 8, name: "Calisthenic", exerciseProperty: .type)
    

    static let pullUp: Exercise = RawExercise(
        id: 0,
        name: "Pull Up",
        description: "",
        createdAt: Date(),
        difficulty: 3,
        thumbnail: "https://cdn.pixabay.com/photo/2017/06/07/00/35/fitness-2378954_960_720.jpg",
        user: MockUsers.daego,
        multimedia: [],
        exerciseGoals: [volumeGoal, definitionGoal, strengthGoal],
        exerciseAttributes: [latsAttribute, bodyOnlyAttribute, calisthenicsAttribute]
    )
    
    static let chinUp: Exercise = RawExercise(
        id: 1,
        name: "Chin Up",
        description: "",
        createdAt: Date(),
        difficulty: 2,
        thumbnail: "https://cdn.pixabay.com/photo/2016/11/29/22/01/white-male-1871427_960_720.jpg",
        user: MockUsers.daego,
        multimedia: [],
        exerciseGoals: [volumeGoal, definitionGoal, strengthGoal],
        exerciseAttributes: [latsAttribute, bodyOnlyAttribute, calisthenicsAttribute]
    )
    
    static let muscleUp: Exercise = RawExercise(
        id: 2,
        name: "Muscle Up",
        description: """
        Grip the rings using a false grip, with the base of your palms on top of the rings. Initiate a pull up by pulling the elbows down to your side, flexing the elbows.

        As you reach the top position of the pull-up, pull the rings to your armpits as you roll your shoulders forward, allowing your elbows to move straight back behind you. This puts you into the proper position to continue into the dip portion of the movement.

        Maintaining control and stability, extend through the elbow to complete the motion.

        Use care when lowering yourself to the ground.
        """,
        createdAt: Date(),
        difficulty: 5,
        thumbnail: "https://cdn.pixabay.com/photo/2017/08/10/23/36/street-workout-2628919_960_720.jpg",
        user: MockUsers.daego,
        multimedia: [],
        exerciseGoals: [volumeGoal, definitionGoal, strengthGoal],
        exerciseAttributes: [latsAttribute, bodyOnlyAttribute, calisthenicsAttribute]
    )
    
    static let crunch: Exercise = RawExercise(
        id: 3,
        name: "Crunch",
        description: "",
        createdAt: Date(),
        difficulty: 5,
        thumbnail: "https://cdn.pixabay.com/photo/2016/02/18/16/44/weight-loss-1207555_960_720.jpg",
        user: MockUsers.bonampa,
        multimedia: [],
        exerciseGoals: [volumeGoal, definitionGoal, strengthGoal],
        exerciseAttributes: [abdominalsAttribute, bodyOnlyAttribute, calisthenicsAttribute]
    )
    
    static let plank: Exercise = RawExercise(
        id: 4,
        name: "Plank",
        description: "",
        createdAt: Date(),
        difficulty: 5,
        thumbnail: "https://cdn.pixabay.com/photo/2017/02/10/09/38/plank-2054729_960_720.jpg",
        user: MockUsers.jpoh,
        multimedia: [],
        exerciseGoals: [volumeGoal, definitionGoal, strengthGoal],
        exerciseAttributes: [abdominalsAttribute, bodyOnlyAttribute, calisthenicsAttribute]
    )    
}
