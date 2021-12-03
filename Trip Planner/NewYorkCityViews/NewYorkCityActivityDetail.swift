//
//  NewYorkCityActivityDetail.swift
//  Trip Planner
//
//  Created by Michelle on 11/27/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import SwiftUI

struct NewYorkCityActivityDetail: View {
    var activity: NewYorkCityActivity
    let cityName = "New York City"
    
    @State private var activityDate = Date()
    
    var body: some View {
        Form {
            VStack {
                VStack(alignment: .leading) {
                    Text(activity.id).padding()
                        .font(.title)
                        .foregroundColor(.primary)
                }
                activity.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                HStack {
                    Text(activity.category).padding()
                    Spacer()
                    Text(activity.cost).padding()
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text(activity.location)
            }
            DatePicker("Activity Date", selection: $activityDate, in: Date()...)
            Button("Add Activity") {
                print("Added activity")
                schedule.createEvent(name: self.activity.id, city: self.cityName, date: self.activityDate, cost: self.activity.cost)
            }
        }
    }
}

struct NewYorkCityActivityDetail_Previews: PreviewProvider {
    static var previews: some View {
        NewYorkCityActivityDetail(activity: newYorkCityActivities[0])
    }
}
