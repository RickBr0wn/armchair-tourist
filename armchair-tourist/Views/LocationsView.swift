//
//  LocationsView.swift
//  armchair-tourist
//
//  Created by Rick Brown on 11/07/2022.
//

import SwiftUI

struct LocationsView: View {
  @EnvironmentObject private var vm: LocationsViewModel
  
  var body: some View {
    List {
      ForEach(vm.locations) { Text($0.name) }
    }
  }
}

struct LocationsView_Previews: PreviewProvider {
  static var previews: some View {
    LocationsView()
      .environmentObject(LocationsViewModel())
  }
}
