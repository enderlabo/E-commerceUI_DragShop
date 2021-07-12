//
//  MapView.swift
//  EcommerceUI-DrapShop
//
//  Created by Laborit on 08/07/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    //struc of map, init values
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: -1.824383, longitude: -60.870912)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    //Data about map locations
    let locations: [Location] = Bundle.main.decode(K.Maps.mapData)
    
    var body: some View {
        //MARK: - Basic Map
//        Map(coordinateRegion: $region)
        //MARK: - Advanced Map
        
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            //**Old Style**
            //MapPin(coordinate: item.location, tint: .accentColor)
            //**New Style**
           // MapMarker(coordinate: item.location, tint: .accentColor)
            
            //**Custom Annotation (it could be interactive)**
//            MapAnnotation(coordinate: item.location){
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            }//Annotation
            
            //**Custom Advanced Annotation ( it could be interactive)**
            MapAnnotation(coordinate: item.location){
                MapAnnotationView(location: item)
            }
        })//Map
        .overlay(
            HStack(alignment: .center, spacing: 12){
                
                VStack(alignment: .leading, spacing: 3){
                    HStack{
                        Text(K.Maps.lat)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }//Hstack
                    Divider()
                    HStack{
                        Text(K.Maps.long)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }//Hstack
                }//Vstack
            }//Hstack
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color(.black)
                            .cornerRadius(8)
                            .opacity(0.6)
            )
            .padding(), alignment: .top
            
            
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
