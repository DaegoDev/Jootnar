//
//  UseCaseImplementation.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 6/29/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

class UseCaseImplementation {
    let repository: Repository
    let service: Service
    
    required init(repository: Repository, service: Service) {
        self.repository = repository
        self.service = service
    }
}
