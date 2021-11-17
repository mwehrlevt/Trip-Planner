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
    
    //let persistenceController = PersistenceController.shared
    let persistenceController: PersistenceController
    
    // used for form storage
    @Environment(\.managedObjectContext) private var viewContent
    
    @State private var activityDate = Date()
    
    var body: some View {
        /*ScrollView {
            VStack {
                VStack(alignment: .leading) {
                    Text(activity.id).padding()
                        .font(.title)
                        .foregroundColor(.primary)
                }
                activity.image
                    .resizable()
                    //.scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    //.frame(width: 250)
                
                /*VStack(alignment: .leading) {
                    Text(activity.id)
                        .font(.title)
                        .foregroundColor(.primary)
                }*/
                HStack {
                    Text(activity.category).padding()
                    Spacer()
                    Text(activity.cost).padding()
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text(activity.location)
                
                VStack {
                    Form {
                        DatePicker("Activity Date", selection: $activityDate, in: Date()...)
                            //.datePickerStyle(WheelDatePickerStyle())
                            //.padding()
                            //.frame(width:150, height: 100, alignment: .center)
                        Button(action: {print("Added Activity")},
                            label: {Text("Add Activity")
                            })
                    }
                }.edgesIgnoringSafeArea(.bottom)
                
            }
            //.padding()
        }*/

        Form {
            VStack {
                VStack(alignment: .leading) {
                    Text(activity.id).padding()
                        .font(.title)
                        .foregroundColor(.primary)
                }
                activity.image
                    .resizable()
                    //.scaledToFit()
                    .aspectRatio(contentMode: .fill)
                    //.frame(width: 250)
                
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
                //.datePickerStyle(WheelDatePickerStyle())
                //.padding()
                //.frame(width:150, height: 100, alignment: .center)
            /*Button(action: {print("Added Activity")},
                label: {Text("Add Activity")
                })*/
            Button("Add Activity") {
                print("Added activity")
                self.persistenceController.save(activityName: self.activity.id)
            }
        }
    }
}

struct ActivityDetail_Previews: PreviewProvider {
    static var previews: some View {
        //ActivityDetail(activity: activities[0])
        ActivityDetail(activity: activities[0], persistenceController: PersistenceController())
    }
}
