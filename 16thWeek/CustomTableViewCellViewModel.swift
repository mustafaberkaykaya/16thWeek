//
//  CustomTableViewCellViewModel.swift
//  16thWeek
//
//  Created by Mustafa Berkay Kaya on 30.01.2022.
//

import Foundation

struct CustomTableViewCellViewModel {
    var title: String
    
    init(with model: Note) {
        title = model.title
    }
}
