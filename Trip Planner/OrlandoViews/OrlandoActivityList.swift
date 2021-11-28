//
//  OrlandoActivityList.swift
//  Trip Planner
//
//  Created by Michelle on 11/27/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import SwiftUI

var orlandoDisneyActivities: [OrlandoActivity] {
    orlandoActivities.filter { activity in
        (activity.category == "Disney Park")
    }
}

struct OrlandoActivityList: View {
    
    // all the categories array
    var OrlandoCategoriesData = [
        OrlandoCategory(
            title: "Disney Parks",
            activitiesArray: orlandoDisneyActivities
        )
    ]

    var body: some View {
        NavigationView {
            List() {
                ForEach(OrlandoCategoriesData) { category in
                    Section(header: Text(category.title)) {
                        ForEach(category.activitiesArray) { activity in
                            NavigationLink(destination: OrlandoActivityDetail(activity: activity)) {
                                OrlandoActivityRow(activity: activity)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Orlando Activities")
        }
    }
}

struct OrlandoActivityList_Previews: PreviewProvider {
    static var previews: some View {
        OrlandoActivityList()
    }
}

