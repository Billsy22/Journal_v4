//
//  Entry.swift
//  Journal_v4
//
//  Created by Taylor Bills on 1/25/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

import Foundation

class Entry: Equatable, Codable {
    
    // MARK:    Properties
    
    var title: String
    var body: String
    var timeStamp = Date()
    
    // MARK:    Initializer
    init(title: String, body: String) {
        self.title = title
        self.body = body
    }
    
    // MARK:    Equatable Protocol
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.title == rhs.title &&
        lhs.body == rhs.body &&
        lhs.timeStamp == rhs.timeStamp
    }
}
