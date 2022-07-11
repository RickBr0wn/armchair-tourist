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
  
  @Published var showLocationsList: Bool = false
  
  init() {
    let locations = LocationsDataService.locations
    let firstLocation = locations.first!
    
    self.locations = locations
    self.mapLocation = firstLocation
    self.updateMapRegion(location: firstLocation)
  }
  
  private func updateMapRegion(location: Location) -> Void { 
    withAnimation(.easeInOut) {
      self.mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
    }
  }
  
  func toggleLocationsList() -> Void {
    withAnimation(.easeInOut) {
      self.showLocationsList.toggle()
    }
  }
  
  func showNextLocation(location: Location) -> Void {
    withAnimation(.easeInOut) {
      self.mapLocation = location
      self.showLocationsList = false
    }
  }
  
  func nextButtonPressed() -> Void {
    guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else { return }
    
    let nextIndex = currentIndex + 1
    
    guard locations.indices.contains(nextIndex) else {
      guard let firstLocation = locations.first else { return }
      self.showNextLocation(location: firstLocation)
      return
    }
    
    let nextLocation = locations[nextIndex]
    self.showNextLocation(location: nextLocation)
  }
}
