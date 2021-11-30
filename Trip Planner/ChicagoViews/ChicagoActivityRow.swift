//
//  ChicagoActivityRow.swift
//  Trip Planner
//
//  Created by Michelle on 11/27/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import SwiftUI

struct ChicagoActivityRow: View {
    var activity: ChicagoActivity
    
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

struct ChicagoActivityRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChicagoActivityRow(activity: chicagoActivities[0])
            ChicagoActivityRow(activity: chicagoActivities[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
