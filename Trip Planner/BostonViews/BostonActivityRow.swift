//
//  BostonActivityRow.swift
//  Trip Planner
//
//  Created by Michelle on 11/27/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import SwiftUI

struct BostonActivityRow: View {
    var activity: BostonActivity
    
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

struct BostonActivityRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BostonActivityRow(activity: bostonActivities[0])
            BostonActivityRow(activity: bostonActivities[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
