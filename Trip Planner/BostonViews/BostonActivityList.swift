//
//  BostonActivityList.swift
//  Trip Planner
//
//  Created by Michelle on 11/27/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import SwiftUI

var bostonFoodActivities: [BostonActivity] {
    bostonActivities.filter { activity in
        (activity.category == "Food")
    }
}

var bostonTourActivities: [BostonActivity] {
    bostonActivities.filter { activity in
        (activity.category == "Tour")
    }
}

var bostonCulturalActivities: [BostonActivity] {
    bostonActivities.filter { activity in
        (activity.category == "Cultural")
    }
}

var bostonParkActivities: [BostonActivity] {
    bostonActivities.filter { activity in
        (activity.category == "Park")
    }
}

var bostonEntertainmentActivities: [BostonActivity] {
    bostonActivities.filter { activity in
        (activity.category == "Entertainment")
    }
}

struct BostonActivityList: View {
    
    // all the categories array
    var BostonCategoriesData = [
        BostonCategory(
            title: "Cultural",
            activitiesArray: bostonCulturalActivities
        ),
        BostonCategory(
            title: "Entertainment",
            activitiesArray: bostonEntertainmentActivities
        ),
        BostonCategory(
            title: "Food",
            activitiesArray: bostonFoodActivities
        ),
        BostonCategory(
            title: "Parks",
            activitiesArray: bostonParkActivities
        ),
        BostonCategory(
            title: "Tours",
            activitiesArray: bostonTourActivities
        )
    ]

    var body: some View {
        NavigationView {
            List() {
                ForEach(BostonCategoriesData) { category in
                    Section(header: Text(category.title)) {
                        ForEach(category.activitiesArray) { activity in
                            NavigationLink(destination: BostonActivityDetail(activity: activity)) {
                                BostonActivityRow(activity: activity)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Boston Activities")
        }
    }
}

struct BostonActivityList_Previews: PreviewProvider {
    static var previews: some View {
        BostonActivityList()
    }
}
