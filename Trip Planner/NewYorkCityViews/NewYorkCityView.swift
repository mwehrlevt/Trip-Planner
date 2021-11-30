//
//  NewYorkCityView.swift
//  Trip Planner
//
//  Created by Michelle on 11/27/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import SwiftUI
import UIKit

struct NewYorkCityView: View {
    var body: some View {
        NewYorkCityActivityList()
    }
}

struct NewYorkCityView_Previews: PreviewProvider {
    static var previews: some View {
        NewYorkCityView()
    }
}

class NewYorkCityViewController: UIHostingController<NewYorkCityView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: NewYorkCityView());
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


