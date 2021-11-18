//
//  ActivityRow.swift
//  Trip Planner
//
//  Created by Michelle on 10/31/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import SwiftUI

struct ActivityRow: View {
    var activity: Activity
    
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

struct ActivityRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ActivityRow(activity: activities[0])
            ActivityRow(activity: activities[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
