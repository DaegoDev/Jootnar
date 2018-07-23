//
//  Following.swift
//  CoordinatorExample
//
//  Created by Juan Pablo Ospina Herrera on 6/29/18.
//  Copyright © 2018 Juan Pablo Ospina Herrera. All rights reserved.
//

import Foundation

protocol Following {
    var user: User { get set }
    var followers: [User] { get set }
    var following: [User] { get set }
}

struct RawFollowing: Following {
    var user: User
    var followers: [User]
    var following: [User]
}
