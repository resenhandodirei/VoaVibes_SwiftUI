//
//  InteractiveMapView.swift
//  VoaVibe
//
//  Created by Larissa Martins Correa on 21/11/24.
//

import SwiftUI
import MapKit

struct InteractiveMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522), // Paris
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    )
    
    @State private var locations: [Destination] = [
        Destination(name: "Torre Eiffel", coordinate: CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.2945)),
        Destination(name: "Museu do Louvre", coordinate: CLLocationCoordinate2D(latitude: 48.8606, longitude: 2.3376)),
        Destination(name: "Catedral de Notre-Dame", coordinate: CLLocationCoordinate2D(latitude: 48.8529, longitude: 2.3500))
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Mapa Interativo")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.azul)
                
                Map(coordinateRegion: $region, annotationItems: locations) { location in
                    MapMarker(coordinate: location.coordinate, tint: .amareloEnergizante)
                }
                .overlay(
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button(action: recenterMap) {
                                Image(systemName: "location.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .padding()
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .shadow(radius: 5)
                            }
                            .padding()
                        }
                    }
                )
            }
//            .navigationTitle("Mapa Interativo")
        }
    }
    
    private func recenterMap() {
        region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522), // Recentrando em Paris
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    }
}

struct Destination: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct InteractiveMapView_Previews: PreviewProvider {
    static var previews: some View {
        InteractiveMapView()
    }
}
