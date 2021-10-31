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
            Text(activity.id)
        }
    }
}

struct ActivityRow_Previews: PreviewProvider {
    static var previews: some View {
        ActivityRow(activity: activities[1])
    }
}
