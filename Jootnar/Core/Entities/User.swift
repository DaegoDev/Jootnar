//
//  User.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 6/29/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

protocol User {
    var id: Int { get set } // TODO: borrame
    var username: String { get set }
    var avatar: String { get set }
}

struct RawUser: User {
    var id: Int
    var username: String
    var avatar: String   
}
