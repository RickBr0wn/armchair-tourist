//
//  LocationsViewModel.swift
//  armchair-tourist
//
//  Created by Rick Brown on 11/07/2022.
//

import Foundation

class LocationsViewModel: ObservableObject {
  @Published var locations: Array<Location>
  
  init() {
    self.locations = LocationsDataService.locations
  }
}
