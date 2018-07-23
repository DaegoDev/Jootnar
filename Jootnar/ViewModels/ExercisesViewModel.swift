//
//  ExercisesViewModel.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/4/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

class ExercisesViewModel {
    var dependencies: Dependencies
    var exercises: [Exercise]?
    var selectedExercise: Exercise?
    
    var onExercisesDidUpdate: (() -> Void)? = nil
    var onExerciseDidSelect: (() -> Void)? = nil
    
    struct Dependencies {
        let locator: UseCaseLocator
        let listExercisesUseCase: ListExercisesProtocol
        
        init(locator: UseCaseLocator = UseCaseLocator(repository: ExerciseRepository(), service: ExerciseService())) {
            self.locator = locator
            self.listExercisesUseCase = locator.listExercises
        }
    }
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func loadExercises() {
        self.dependencies.listExercisesUseCase.listExercises { [weak self] exercises in
            self?.exercises = exercises
            self?.onExercisesDidUpdate?()
        }
    }
    
    func selectExercise(_ exercise: Exercise) {
        selectedExercise = exercise
        onExerciseDidSelect?()
    }
    
    func filteredExerciseValues() -> [String: [String]]? {
        var filteredValues = [String: [String]]()
        
        guard let attributes = selectedExercise?.exerciseAttributes else {
            return nil
        }
        
        for exerciseAttribute in attributes {
            if var valuesArray = filteredValues[exerciseAttribute.exerciseProperty.rawValue] {
                valuesArray.append(exerciseAttribute.name)
            } else {
                filteredValues[exerciseAttribute.exerciseProperty.rawValue] = [exerciseAttribute.name]
            }
        }
        
        return filteredValues
    }
    
    func exerciseGoals() -> [(name: String, repetitions: Int)]? {
        var exerciseGoals : [(String, Int)] = []
        guard let goals = selectedExercise?.exerciseGoals else {
            return nil
        }
        for exerciseGoal in goals {
            exerciseGoals.append((exerciseGoal.goal, exerciseGoal.suggestedRepetitions))
        }
        return exerciseGoals
    }
}
