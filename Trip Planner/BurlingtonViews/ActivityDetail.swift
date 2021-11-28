//
//  ActivityDetail.swift
//  Trip Planner
//
//  Created by Michelle on 10/31/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import SwiftUI

struct ActivityDetail: View {
    var activity: Activity
    let cityName = "Burlington"
    
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
            }
        }
    }
}

struct ActivityDetail_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetail(activity: activities[0])
    }
}
