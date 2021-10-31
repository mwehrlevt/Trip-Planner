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
    
    var body: some View {
        ScrollView {
            VStack {
                activity.image
                    .resizable()
                    .scaledToFit()
                    //.frame(width: 50, height: 50)
                
                VStack(alignment: .leading) {
                    Text(activity.id)
                        .font(.title)
                        .foregroundColor(.primary)
                }
                HStack {
                    Text(activity.category)
                    Spacer()
                    Text(activity.cost)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text(activity.location)
            }
            .padding()
        }
    }
}

struct ActivityDetail_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetail(activity: activities[0])
    }
}
