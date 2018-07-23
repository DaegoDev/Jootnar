//
//  Comment.swift
//  CoordinatorExample
//
//  Created by Juan Pablo Ospina Herrera on 6/29/18.
//  Copyright © 2018 Juan Pablo Ospina Herrera. All rights reserved.
//

import Foundation

protocol Comment {
    var id: Int { get set }
    var content: String { get set }
    var createdAt: Date { get set }
}

struct RawComment: Comment {
    var id: Int
    var content: String
    var createdAt: Date
}
