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
    
    // MARK:    Initializer
    
    init() {
        self.entries = loadFromPersistentStorage()
    }
    
    // MARK:    Crud Functions
    // Create
    
    // Time Stamp format
    func stampTheTime() -> String {
        let currentDate = Date()
        let dateInTheStates = DateFormatter()
        dateInTheStates.dateFormat = "MM/dd/YYYY"
        dateInTheStates.locale = Locale(identifier: "en_US")
        let finalDate = dateInTheStates.string(from: currentDate)
        return finalDate
    }
    
    // Add entry to journal
    func addEntryWith(title: String, body: String, timeStamp: String) {
        let entry = Entry(title: title, body: body, timeStamp: stampTheTime())
        entries.append(entry)
        saveToPersistence()
    }
    
    // Read(Persistence)
    
    // Save location
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        let fileName = "entries.json"
        let url = documentDirectory.appendingPathComponent(fileName)
        return url
    }
    
    // Save data
    func saveToPersistence() {
        let jsonEncoder = JSONEncoder()
        do {
            let data = try jsonEncoder.encode(entries)
            try data.write(to: fileURL())
        } catch let error {
            print("Error saving to disk: \(error), \(error.localizedDescription)")
        }
    }
    
    // Load data
    func loadFromPersistentStorage() -> [Entry] {
        let jsonDecoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let entries = try jsonDecoder.decode([Entry].self, from: data)
            return entries
        } catch let error {
            print("Error loading to disk \(error), \(error.localizedDescription)")
            return []
        }
    }
    
    // Update
    
    // Update existing entry
    func updateExistingEntry(entry: Entry, title: String, body: String, timeStamp: String) {
        entry.title = title
        entry.body = body
        entry.timeStamp = stampTheTime()
        saveToPersistence()
    }
    
    // Delete
    
    // Delete Entry
    func removeEntry(entry: Entry) {
        guard let index = entries.index(of: entry) else { return }
        entries.remove(at: index)
        saveToPersistence()
    }
}
