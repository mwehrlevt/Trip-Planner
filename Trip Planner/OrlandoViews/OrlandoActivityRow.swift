//
//  OrlandoActivityRow.swift
//  Trip Planner
//
//  Created by Michelle on 11/27/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import SwiftUI

struct OrlandoActivityRow: View {
    var activity: OrlandoActivity
    
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

struct OrlandoActivityRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OrlandoActivityRow(activity: orlandoActivities[0])
            OrlandoActivityRow(activity: orlandoActivities[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
