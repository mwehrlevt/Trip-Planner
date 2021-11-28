//
//  OrlandoView.swift
//  Trip Planner
//
//  Created by Michelle on 11/27/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import SwiftUI
import UIKit

struct OrlandoView: View {
    var body: some View {
        OrlandoActivityList()
    }
}

struct OrlandoView_Previews: PreviewProvider {
    static var previews: some View {
        OrlandoView()
    }
}

class OrlandoViewController: UIHostingController<OrlandoView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: OrlandoView());
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
