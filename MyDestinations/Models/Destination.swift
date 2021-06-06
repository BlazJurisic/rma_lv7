//
//  Destination.swift
//  MyDestinations
//
//  Created by Ivan Barisic on 21/05/2020.
//  Copyright © 2020 Ivan Barisic. All rights reserved.
//

import UIKit

class Destination: Codable {
    
    // MARK: - Static variables
    static let userDefaultsKey = "DestinationKey"

    // MARK: - Variables
    let id: String
    var title: String
    var description: String
    let latitude: Double?
    let longitude: Double?
    let url : String?
    // MARK: - Init
    init(title: String, description: String, latitude: Double?, longitude: Double?, url: String?) {
        self.id = UUID().uuidString
        self.title = title
        self.description = description
        self.latitude = latitude
        self.longitude = longitude
        self.url = url
    }
    
}
