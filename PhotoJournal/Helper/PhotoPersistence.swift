//
//  PhotoPersistence.swift
//  PhotoJournal
//
//  Created by Kimball Yang on 10/6/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import Foundation

struct PhotoPersistenceManager {
    private init() {}
    static let manager = PhotoPersistenceManager()
    
    private let persistenceHelper = PersistenceHelper<Journal>(fileName: "photoJournal.plist")
    
    func saveJournal(journal: Journal) throws {
        try persistenceHelper.save(newElement: journal)
    }

    func getJournal() throws -> [Journal] {
        return try persistenceHelper.getObjects()
    }
    
    
    func deleteJournal(withID: Int) throws {
        do {
            let allJournalsBefore = try getJournal()
            let allJournalsAfter = allJournalsBefore.filter { $0.id != withID}
            try persistenceHelper.replace(elements: allJournalsAfter)
        }
    }
}
