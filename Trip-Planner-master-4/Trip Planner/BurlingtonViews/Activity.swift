//
//  Activity.swift
//  Trip Planner
//
//  Created by Michelle on 10/31/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation

struct Activity: Hashable, Codable, Identifiable {
    var id: String
    var category: String
    var cost: String
    var location: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    
    // used to interact with map framework
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}

struct Category: Identifiable {
    var id = UUID()
    var title: String
    var activitiesArray: [Activity]
}

var CategoriesData = [
    Category(
        title: "Food",
        activitiesArray: [
        ]
    )
]
