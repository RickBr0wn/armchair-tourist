//
//  LocationsListView.swift
//  armchair-tourist
//
//  Created by Rick Brown on 11/07/2022.
//

import SwiftUI

struct LocationsListView: View {
  @EnvironmentObject private var vm: LocationsViewModel
  
  var body: some View {
    List {
      ForEach(vm.locations) { location in
        Button(action: { vm.showNextLocation(location: location) }) {
          listRowView(location: location)
        }
        .padding(.vertical, 4)
        .listRowBackground(Color.clear)
      }
    }
    .listStyle(PlainListStyle())
  }
}

extension LocationsListView {
  private func listRowView(location: Location) -> some View {
    HStack {
      if let imageName = location.imageNames.first {
        Image(imageName)
          .resizable()
          .scaledToFill()
          .frame(width: 45.0, height: 45.0)
          .cornerRadius(10.0)
      }
      
      VStack(alignment: .leading) {
        Text(location.name)
          .font(.headline)
        
        Text(location.cityName)
          .font(.subheadline)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    }
  }
}

struct LocationsListView_Previews: PreviewProvider {
  static var previews: some View {
    LocationsListView()
      .environmentObject(LocationsViewModel())
  }
}
