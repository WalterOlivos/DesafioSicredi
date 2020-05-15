//
//  EventModel.swift
//  DesafioIOS
//
//  Created by Walter Oliveira on 15/05/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import Foundation

struct EventModel {
    let id: String
    let title: String
    let description: String
    let date: Date
    let price: Double
    let image: URL
}

extension EventModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case description = "description"
        case date = "date"
        case price = "price"
        case image = "image"
    }
}
