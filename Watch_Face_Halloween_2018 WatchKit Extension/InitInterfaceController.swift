//
//  InitInterfaceController.swift
//  Watch_Face_Halloween_2018 WatchKit Extension
//
//  Created by Пятин Дмитрий on 23.05.2020.
//  Copyright © 2020 Michal Tynior. All rights reserved.
//

import WatchKit
import Foundation


class InitInterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        presentController(withName: "mainScene", context: nil)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
