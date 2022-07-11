//
//  Location.swift
//  armchair-tourist
//
//  Created by Rick Brown on 11/07/2022.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
  let name: String
  let cityName: String
  let coordinates: CLLocationCoordinate2D
  let description: String
  let imageNames: Array<String>
  let link: String
  
  var id: String {
    name + cityName
  }
  
  static func == (lhs: Location, rhs: Location) -> Bool {
    lhs.id == rhs.id
  }
}
