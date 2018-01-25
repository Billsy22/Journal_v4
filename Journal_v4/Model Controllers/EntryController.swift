//
//  EntryController.swift
//  Journal_v4
//
//  Created by Taylor Bills on 1/25/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

import Foundation

class EntryController {
    
    // MARK:    Properties
    
    static var shared = EntryController()
    var entries: [Entry] = []
    
    // MARK:    Crud Functions
    // Create
    
    // Add entry to journal
    func addEntryWith(title: String, body: String) {
        let entry = Entry(title: title, body: body)
        entries.append(entry)
    }
    
    // Read(Persistence)
    
    // Update
    
    // Update existing entry
    func updateExistingEntry(entry: Entry, title: String, body: String) {
        entry.title = title
        entry.body = body
    }
    
    // Delete
    
    // Delete Entry
    func removeEntry(entry: Entry) {
        guard let index = entries.index(of: entry) else { return }
        entries.remove(at: index)
    }
}
