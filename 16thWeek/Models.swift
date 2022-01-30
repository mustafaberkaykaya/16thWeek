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
    let title: String
    let note: String
    let authorName: String?
    let authorGender: Gender
    let authorAdress: String?
}
