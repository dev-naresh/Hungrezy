//
//  MapView.swift
//  Hungrezy
//
//  Created by diwaan-pt5584 on 07/04/23.
//

import Cocoa
import MapKit

class MapView: NSView {
    lazy var map: MKMapView = {
        var map = MKMapView()
        let location = CLLocationCoordinate2D(latitude: 12.828949, longitude: 80.050194)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Zoho Corporation"
        map.addAnnotation(annotation)
        
        map.translatesAutoresizingMaskIntoConstraints = false
        addSubview(map)
        return map
    }()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        
        
        NSLayoutConstraint.activate([
            map.topAnchor.constraint(equalTo: topAnchor),
            map.leadingAnchor.constraint(equalTo: leadingAnchor),
            map.bottomAnchor.constraint(equalTo: bottomAnchor),
            map.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            map.heightAnchor.constraint(equalToConstant: 300),
            map.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
