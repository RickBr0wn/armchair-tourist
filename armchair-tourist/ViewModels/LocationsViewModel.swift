//
//  LocationsViewModel.swift
//  armchair-tourist
//
//  Created by Rick Brown on 11/07/2022.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
  @Published var locations: Array<Location>
  
  @Published var mapLocation: Location {
    didSet {
      updateMapRegion(location: mapLocation)
    }
  }
  
  @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
  
  let mapSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
  
  init() {
    let locations = LocationsDataService.locations
    let firstLocation = locations.first!
    
    self.locations = locations
    self.mapLocation = firstLocation
    self.updateMapRegion(location: firstLocation)
  }
  
  private func updateMapRegion(location: Location) -> Void { 
    withAnimation(.easeInOut) {
      mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
    }
  }
}
