//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Dan Patey on 6/28/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
    
    var mapView: MKMapView!
    var locationManager : CLLocationManager!
    
    override func loadView() {
        // Create a map view
        mapView = MKMapView()
        // Set it as *the* view of this view controller
        view = mapView
        
        // Set up different types of maps
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        let segmentedControl = UISegmentedControl(items: [standardString, satelliteString, hybridString])
        
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), forControlEvents: .ValueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
        
        // Set up zoom button
        let zoomInString = NSLocalizedString("Zoom In", comment: "Zoom in to current location")
        let zoomInFastString = NSLocalizedString("Zoom In Fast", comment: "Zoom in quickly to the current location")
        let zoomControl = UISegmentedControl(items: [zoomInString, zoomInFastString])
        
        zoomControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        zoomControl.selectedSegmentIndex = 0
        zoomControl.addTarget(self, action: #selector(MapViewController.zoomToUser(_:)), forControlEvents: .ValueChanged)
        zoomControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(zoomControl)
        
        let topZoomConstraint = zoomControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 36)
        let leadingZoomConstraint = zoomControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingZoomConstraint = zoomControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        topZoomConstraint.active = true
        leadingZoomConstraint.active = true
        trailingZoomConstraint.active = true
    }
    
    func mapTypeChanged(segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            break
        }
    }
    
    func zoomToUser(zoomControl: UISegmentedControl) {
        switch zoomControl.selectedSegmentIndex {
        case 0:
            locationManager = CLLocationManager()
            locationManager.requestWhenInUseAuthorization()
            mapView.showsUserLocation = true
            mapView.setUserTrackingMode(.Follow, animated: true)
        case 1:
            locationManager = CLLocationManager()
            locationManager.requestWhenInUseAuthorization()
            mapView.showsUserLocation = true
            mapView.setUserTrackingMode(.Follow, animated: false)
        default:
            break
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}