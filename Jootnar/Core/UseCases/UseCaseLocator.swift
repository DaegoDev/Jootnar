//
//  UseCaseLocator.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 6/29/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

class UseCaseLocator {
    
    let repository: Repository
    let service: Service
    
    required init(repository: Repository, service: Service) {
        self.repository = repository
        self.service = service
    }
    
    var listWorkouts: ListWorkoutsProtocol {
        return ListWorkouts(repository: repository, service: service)
    }
    
    var listExercises: ListExercisesProtocol {
        return ListExercises(repository: repository, service: service)
    }
    
    var listPosts: ListPostsProtocol {
        return ListPosts(repository: repository, service: service)
    }
    
    var getProfile: GetProfileProtocol {
        return GetProfile(repository: repository, service: service)
    }
}
