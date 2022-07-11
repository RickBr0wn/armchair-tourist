//
//  armchair_touristApp.swift
//  armchair-tourist
//
//  Created by Rick Brown on 11/07/2022.
//

import SwiftUI

@main
struct armchair_touristApp: App {
  @StateObject private var vm = LocationsViewModel()
  
  var body: some Scene {
    WindowGroup {
      LocationsView()
        .environmentObject(vm)
    }
  }
}
