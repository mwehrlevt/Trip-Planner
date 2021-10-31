//
//  ActivityList.swift
//  Trip Planner
//
//  Created by Michelle on 10/31/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import SwiftUI

struct ActivityList: View {
    var body: some View {
        NavigationView {
            List(activities) { activity in
                NavigationLink(destination: ActivityDetail(activity: activity)) {
                    ActivityRow(activity: activity)
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
