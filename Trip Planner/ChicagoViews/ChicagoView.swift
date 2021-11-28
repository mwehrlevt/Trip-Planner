//
//  ChicagoView.swift
//  Trip Planner
//
//  Created by Michelle on 11/27/21.
//  Copyright © 2021 mwehrle. All rights reserved.
//

import SwiftUI
import UIKit

struct ChicagoView: View {
    var body: some View {
        ChicagoActivityList()
    }
}

struct ChicagoView_Previews: PreviewProvider {
    static var previews: some View {
        ChicagoView()
    }
}

class ChicagoViewController: UIHostingController<ChicagoView> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: ChicagoView());
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

