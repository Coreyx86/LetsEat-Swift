//
//  MapViewController.swift
//  LetsEat
//
//  Created by corey on 10/28/20.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let manager = MapDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
    }
    
    func initialize() {
        manager.fetch {
            (annotations) in addMap(annotations)
        }
        
        mapView.delegate = self
    }
    
    func addMap(_ annotations: [RestaurantItem]) {
        mapView.setRegion(manager.currentRegion(latDelta: 0.5, longDelta: 0.5), animated: true)
        mapView.addAnnotations(manager.annotations)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation:MKAnnotation) -> MKAnnotationView? {
        let identifier = "custompin"
        
        guard !annotation.isKind(of: MKUserLocation.self) else {
            return nil
        }
        
        var annotationView: MKAnnotationView?
        
        if let customAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier){
            annotationView = customAnnotationView
            annotationView?.annotation = annotation
        } else {
            let av = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            av.rightCalloutAccessoryView = UIButton(type:.detailDisclosure)
            annotationView = av
        }
        
        if let annotationView = annotationView {
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "custom-annotation")
        }
        
        return annotationView
    }

}
