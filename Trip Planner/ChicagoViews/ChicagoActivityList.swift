//
//  ChicagoActivityList.swift
//  Trip Planner
//
//  Created by Michelle on 11/27/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import SwiftUI

var chicagoFoodActivities: [ChicagoActivity] {
    chicagoActivities.filter { activity in
        (activity.category == "Food")
    }
}

var chicagoTourActivities: [ChicagoActivity] {
    chicagoActivities.filter { activity in
        (activity.category == "Tour")
    }
}

var chicagoCulturalActivities: [ChicagoActivity] {
    chicagoActivities.filter { activity in
        (activity.category == "Cultural")
    }
}

var chicagoParkActivities: [ChicagoActivity] {
    chicagoActivities.filter { activity in
        (activity.category == "Park")
    }
}

struct ChicagoActivityList: View {
    
    // all the categories array
    var ChicagoCategoriesData = [
        ChicagoCategory(
            title: "Cultural",
            activitiesArray: chicagoCulturalActivities
        ),
        ChicagoCategory(
            title: "Food",
            activitiesArray: chicagoFoodActivities
        ),
        ChicagoCategory(
            title: "Parks",
            activitiesArray: chicagoParkActivities
        ),
        ChicagoCategory(
            title: "Tours",
            activitiesArray: chicagoTourActivities
        )
    ]

    var body: some View {
        NavigationView {
            List() {
                ForEach(ChicagoCategoriesData) { category in
                    Section(header: Text(category.title)) {
                        ForEach(category.activitiesArray) { activity in
                            NavigationLink(destination: ChicagoActivityDetail(activity: activity)) {
                                ChicagoActivityRow(activity: activity)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Chicago Activities")
        }
    }
}

struct ChicagoActivityList_Previews: PreviewProvider {
    static var previews: some View {
        ChicagoActivityList()
    }
}

