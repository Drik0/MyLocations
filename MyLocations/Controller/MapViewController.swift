//
//  MapViewController.swift
//  MyLocations
//
//  Created by Gerson Costa on 24/06/2019.
//  Copyright © 2019 Gerson Costa. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var managedObjectContext: NSManagedObjectContext!
    var locations = [Location]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateLocations()
    }
    
    func updateLocations() {
        mapView.removeAnnotations(locations)
        
        let entity = Location.entity()
        let fetchRequest = NSFetchRequest<Location>()
        
        locations = try! managedObjectContext.fetch(fetchRequest)
        mapView.addAnnotations(locations)
    }
    
    @IBAction func showUser() {
        let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func showLocations() {
        
    }
    
}

extension MapViewController: MKMapViewDelegate {
    
}
