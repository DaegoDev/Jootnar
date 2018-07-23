//
//  Multimedia.swift
//  Jootnar
//
//  Created by Diego Alejandro Alvarez Gallego on 6/29/18.
//  Copyright © 2018 Diego Alejandro Alvarez Gallego. All rights reserved.
//

import Foundation

enum MultimediaType: String {
    case image
    case video
}

protocol Multimedia {
    var id: Int { get set }
    var type: MultimediaType { get set }
    var path: String { get set }
}

struct RawMultimedia: Multimedia {
    var id: Int
    var type: MultimediaType
    var path: String
}
