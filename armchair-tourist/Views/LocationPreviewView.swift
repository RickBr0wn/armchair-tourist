//
//  LocationPreviewView.swift
//  armchair-tourist
//
//  Created by Rick Brown on 11/07/2022.
//

import SwiftUI

struct LocationPreviewView: View {
  @EnvironmentObject private var vm: LocationsViewModel
  
  let location: Location
  
  var body: some View {
    HStack(alignment: .bottom, spacing: 0.0) {
      VStack(alignment: .leading, spacing: 16.0) {
        imageSection
        titleSection
      }
      
      VStack(spacing: 8.0) {
        learnMoreButton
        nextButton
      }
    }
    .padding(20)
    .background(
      RoundedRectangle(cornerRadius: 10.0)
      .fill(.ultraThinMaterial)
      .offset(y: 65.0)
    )
    .cornerRadius(10.0)
  }
}

extension LocationPreviewView {
  private var imageSection: some View {
    ZStack {
      if let imageName = location.imageNames.first {
        Image(imageName)
          .resizable()
          .scaledToFill()
          .frame(width: 100.0, height: 100.0)
          .cornerRadius(10.0)
      }
    }
    .padding(6)
    .background(.white)
    .cornerRadius(10.0)
  }
  
  private var titleSection: some View {
    VStack(alignment: .leading) {
      Text(location.name)
        .font(.title2)
        .fontWeight(.bold)
      
      Text(location.cityName)
        .font(.subheadline)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  private var learnMoreButton: some View {
    Button(action: {}) {
      Text("Learn more")
        .font(.headline)
        .frame(width: 125.0, height: 35.0)
    }
    .buttonStyle(.borderedProminent)
  }
   
  private var nextButton: some View {
    Button(action: { vm.nextButtonPressed() }) {
      Text("Next")
        .font(.headline)
        .frame(width: 125.0, height: 35.0)
    }
    .buttonStyle(.bordered)
  }
}

struct LocationPreviewView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      Color.green.ignoresSafeArea()
      
      LocationPreviewView(location: LocationsDataService.locations.first!)
        .padding()
    }
    .environmentObject(LocationsViewModel())
  }
}
