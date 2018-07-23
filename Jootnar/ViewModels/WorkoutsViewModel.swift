//
//  WorkoutsViewModel.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 6/29/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

class WorkoutsViewModel {
    var dependencies: Dependencies
    var workouts: [Workout]?
    var selectedWorkout: Workout?
    
    var onWorkoutsDidUpdate: (() -> Void)? = nil
    var onWorkoutDidSelect: (() -> Void)? = nil


    struct Dependencies {
        var locator: UseCaseLocator
        var listWorkoutsUseCase: ListWorkoutsProtocol
        
        init(locator: UseCaseLocator = UseCaseLocator(repository: WorkoutRepository(), service: WorkoutService())) {
            self.locator = locator
            self.listWorkoutsUseCase = self.locator.listWorkouts
        }
    }
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func loadWorkouts() {
        dependencies.listWorkoutsUseCase.listWorkouts { [weak self] workouts in
            self?.workouts = workouts
            self?.onWorkoutsDidUpdate?()
        }
    }
    
    func selectWorkout(_ workout: Workout) {
        self.selectedWorkout = workout
        self.onWorkoutDidSelect?()
    }
    
    func getExercises(of workout: Workout ) -> [[[String : String]]]? {
        var exercises = [[[String : String]]]()
        
        guard let workoutSections = workout.workoutSections else {
            return nil
        }
        
        for workoutSection in workoutSections {
            var workoutSectionList = [[String : String]]()
            for exerciseSection in workoutSection.exerciseSections {
                let exercise = [
                    "name": exerciseSection.exercise.name,
                    "rounds": "\(exerciseSection.rounds)",
                    "roundType": exerciseSection.roundType.rawValue,
                    "thumbnail": exerciseSection.exercise.thumbnail
                ]
                workoutSectionList.insert(exercise, at: exerciseSection.order)
            }
            exercises.insert(workoutSectionList, at: workoutSection.order)
        }
        
        return exercises
    }
    
    func getWorkoutSectionHeaders(for workout: Workout) -> [String]? {
        var headers = [String]()
        
        guard let workoutSections = workout.workoutSections else {
            return nil
        }
        
        for workoutSection in workoutSections {
            headers.insert("\(workoutSection.name) \(workoutSection.rounds) Series", at: workoutSection.order)
        }
        
        return headers
    }
    
    func findExercise(in workout: Workout, section: Int, order: Int) -> Exercise? {
        
        guard let workoutSections = workout.workoutSections else {
            return nil
        }
        
        for workoutSection in workoutSections {
            if workoutSection.order == section {
                for exerciseSection in workoutSection.exerciseSections {
                    if exerciseSection.order == order {
                        return exerciseSection.exercise
                    }
                }
            }
        }
        
        return nil
    }
}
