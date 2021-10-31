//
//  BurlingtonView.swift
//  Trip Planner
//
//  Created by Michelle on 10/31/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import SwiftUI
import UIKit

struct BurlingtonView: View {
    var body: some View {
        ActivityList()
    }
}

struct BurlingtonView_Previews: PreviewProvider {
    static var previews: some View {
        BurlingtonView()
    }
}

class BurlingtonViewController: UIHostingController<BurlingtonView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: BurlingtonView());
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
