//

//  iOS_Getting_StartedApp.swift
//  iOS Getting Started
//
//  Created by 김솔아 on 2023/06/09.
//

import SwiftUI

import UIKit
import Amplify

@main
struct iOS_Getting_StartedApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    init() {
        _=Backend.initialize()
    }
}




