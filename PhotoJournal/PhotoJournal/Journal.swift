//
//  Journal.swift
//  PhotoJournal
//
//  Created by Kimball Yang on 10/6/19.
//  Copyright © 2019 Kimball Yang. All rights reserved.
//

import Foundation

struct Journal: Codable {
    let imageData: Data
    let caption: String
    let timestamp: String
    
    public var dateFormattedString: String {
        let isDateFormatter = ISO8601DateFormatter()
        var formattedDate = timestamp
        if let date = isDateFormatter.date(from: timestamp) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM d, yyyy hh:mm a"
            formattedDate = dateFormatter.string(from: date)
        }
        return formattedDate
    }
    
    public var date: Date{
        let isoFormatter = ISO8601DateFormatter()
        var formattedDate = Date()
        if let date = isoFormatter.date(from: timestamp){
            formattedDate = date
        }
        return formattedDate
    }
}
