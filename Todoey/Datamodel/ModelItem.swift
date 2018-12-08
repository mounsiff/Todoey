//
//  ModelItem.swift
//  Todoey
//
//  Created by moncef bousria on 05/12/2018.
//  Copyright © 2018 moncef bousria. All rights reserved.
//

import Foundation


class ModelItem : Encodable, Decodable {
    
    
    var title: String = ""
    var done: Bool = false
    
}
