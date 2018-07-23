//
//  UserRepositoryProtocol.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/13/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

protocol UserRepositoryProtocol {
    func getProfile(completion: @escaping (User) -> Void) 
}
