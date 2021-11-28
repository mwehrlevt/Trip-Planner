//
//  NewYorkCityActivityList.swift
//  Trip Planner
//
//  Created by Michelle on 11/27/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import SwiftUI

var newYorkCityLandmarkActivities: [NewYorkCityActivity] {
    newYorkCityActivities.filter { activity in
        (activity.category == "Landmark")
    }
}

var newYorkCityCulturalActivities: [NewYorkCityActivity] {
    newYorkCityActivities.filter { activity in
        (activity.category == "Cultural")
    }
}

var newYorkCityParkActivities: [NewYorkCityActivity] {
    newYorkCityActivities.filter { activity in
        (activity.category == "Park")
    }
}

var newYorkCityEntertainmentActivities: [NewYorkCityActivity] {
    newYorkCityActivities.filter { activity in
        (activity.category == "Entertainment")
    }
}

struct NewYorkCityActivityList: View {
    
    // all the categories array
    var NewYorkCityCategoriesData = [
        NewYorkCityCategory(
            title: "Cultural",
            activitiesArray: newYorkCityCulturalActivities
        ),
        NewYorkCityCategory(
            title: "Entertainment",
            activitiesArray: newYorkCityEntertainmentActivities
        ),
        NewYorkCityCategory(
            title: "Landmarks",
            activitiesArray: newYorkCityLandmarkActivities
        ),
        NewYorkCityCategory(
            title: "Parks",
            activitiesArray: newYorkCityParkActivities
        )
    ]

    var body: some View {
        NavigationView {
            List() {
                ForEach(NewYorkCityCategoriesData) { category in
                    Section(header: Text(category.title)) {
                        ForEach(category.activitiesArray) { activity in
                            NavigationLink(destination: NewYorkCityActivityDetail(activity: activity)) {
                                NewYorkCityActivityRow(activity: activity)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("New York City")
        }
    }
}

struct NewYorkCityActivityList_Previews: PreviewProvider {
    static var previews: some View {
        NewYorkCityActivityList()
    }
}
