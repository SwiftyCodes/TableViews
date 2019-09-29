//
//  DataModel.swift
//  TableViews
//
//  Created by Anurag Kashyap on 29/09/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import Foundation

class DataModel {
    var headerName : String?
    var typesArray = [String]()
    var isExpandable = false
    
    init(headerName: String, typesArray: [String], isExpandable: Bool) {
        self.headerName = headerName
        self.typesArray = typesArray
        self.isExpandable = isExpandable
    }
}
