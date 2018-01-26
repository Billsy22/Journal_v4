//
//  EntryDetailViewController.swift
//  Journal_v4
//
//  Created by Taylor Bills on 1/25/18.
//  Copyright © 2018 Taylor Bills. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    // MARK:    Properties
    
    var entry: Entry?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!
    @IBOutlet weak var clearButton: UIButton!
    
    // MARK:    Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK:    Actions
    
    // Clear Button
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextField.text = ""
    }
    
    // Save Button
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty else { return }
        guard let body = bodyTextField.text, !body.isEmpty else { return }
        if let entry = entry {
            EntryController.shared.updateExistingEntry(entry: entry, title: title, body: body, timeStamp: EntryController.shared.stampTheTime())
        } else {
            EntryController.shared.addEntryWith(title: title, body: body, timeStamp: EntryController.shared.stampTheTime())
        }
        navigationController?.popViewController(animated: true)
    }
    
    // MARK:    Update Views
    
    func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextField.text = entry.body
    }
}
