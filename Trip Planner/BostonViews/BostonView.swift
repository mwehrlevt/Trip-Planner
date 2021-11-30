//
//  BostonView.swift
//  Trip Planner
//
//  Created by Michelle on 11/27/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import SwiftUI
import UIKit

struct BostonView: View {
    var body: some View {
        BostonActivityList()
    }
}

struct BostonView_Previews: PreviewProvider {
    static var previews: some View {
        BostonView()
    }
}

class BostonViewController: UIHostingController<BostonView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: BostonView());
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
