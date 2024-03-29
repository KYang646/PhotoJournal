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
    
    
    func deleteJournal(index: Int) throws -> [Journal] {
        do {
            var allJournals = try getJournal()
            //            let allJournalsAfter = allJournalsBefore.filter { $0.tag != tag}
            allJournals.remove(at: index)
            
            do {
                try persistenceHelper.replace(elements: allJournals)
            }catch{
                print("Not replacing")
            }
            
            return allJournals
            
        }
    }
    
    func editJournal(index: Int, editedJournal: Journal) throws {
           do {
               var allJournals = try getJournal()
          
//               allJournals.remove(at: index)
                allJournals[index] = editedJournal
               
               do {
                   try persistenceHelper.replace(elements: allJournals)
               }catch{
                   print("Not replacing")
               }
               
           }
       }
}
