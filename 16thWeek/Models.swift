//
//  Models.swift
//  16thWeek
//
//  Created by Mustafa Berkay Kaya on 30.01.2022.
//

import Foundation

enum Gender {
    case male, female, unspecfied
}

struct Note {
    var title: String
    var note: String?
    var authorName: String?
    var authorGender: Gender
    var authorAdress: String?
    
    init(title: String,
         note: String? = nil,
         authorName: String? = nil,
         authorAdress: String? = nil,
         authorGender: Gender = .unspecfied
         ) {
        self.title = title
        self.note = note
        self.authorName = authorName
        self.authorGender = authorGender
        self.authorAdress = authorAdress
    }
}
