//
//  ActivityList.swift
//  Trip Planner
//
//  Created by Michelle on 10/31/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import SwiftUI

var foodActivities: [Activity] {
    activities.filter { activity in
        (activity.category == "Food")
    }
}

var culturalActivities: [Activity] {
    activities.filter { activity in
        (activity.category == "Cultural")
    }
}

var landmarkActivities: [Activity] {
    activities.filter { activity in
        (activity.category == "Landmark")
    }
}

var natureActivities: [Activity] {
    activities.filter { activity in
        (activity.category == "Nature")
    }
}

var entertainmentActivities: [Activity] {
    activities.filter { activity in
        (activity.category == "Entertainment")
    }
}

struct ActivityList: View {
    
    // all the categories array
    var CategoriesData = [
        Category(
            title: "Food",
            activitiesArray: foodActivities
        ),
        Category(
            title: "Cultural",
            activitiesArray: culturalActivities
        ),
        Category(
            title: "Landmarks",
            activitiesArray: landmarkActivities
        ),
        Category(
            title: "Nature",
            activitiesArray: natureActivities
        ),
        Category(
            title: "Entertainment",
            activitiesArray: entertainmentActivities
        )
    ]

    var body: some View {
        NavigationView {
            List() {
                ForEach(CategoriesData) { category in
                    Section(header: Text(category.title)) {
                        ForEach(category.activitiesArray) { activity in
                            NavigationLink(destination: ActivityDetail(activity: activity)) {
                                ActivityRow(activity: activity)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Burlington Activities")
        }
    }
}

struct ActivityList_Previews: PreviewProvider {
    static var previews: some View {
        ActivityList()
    }
}
