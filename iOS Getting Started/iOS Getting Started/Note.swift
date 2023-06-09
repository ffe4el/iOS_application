//
//  Note.swift
//  iOS Getting Started
//
//  Created by 김솔아 on 2023/06/09.
//

import Foundation
import SwiftUI
// the data class to represents Notes
class Note : Identifiable, ObservableObject {
    var id : String
var name : String
var description : String?
    var imageName : String?
    @Published var image : Image?

    init(id: String, name: String, description: String? = nil, image: String? = nil ) {
        self.id = id
        self.name = name
        self.description = description
        self.imageName = image
    }
}
