//
//  ListPostsProtocol.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 7/11/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

protocol ListPostsProtocol {
    func listPosts(completion: @escaping ([Post]) -> Void)
    func listPosts(for user: User, completion: @escaping ([Post]) -> Void)
}
