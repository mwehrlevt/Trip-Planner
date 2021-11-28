//
//  NewYorkCityActivityRow.swift
//  Trip Planner
//
//  Created by Michelle on 11/27/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import SwiftUI

struct NewYorkCityActivityRow: View {
    var activity: NewYorkCityActivity
    
    var body: some View {
        HStack {
            activity.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(activity.id)
            
            Spacer()
        }
    }
}

struct NewYorkCityActivityRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NewYorkCityActivityRow(activity: newYorkCityActivities[0])
            NewYorkCityActivityRow(activity: newYorkCityActivities[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
