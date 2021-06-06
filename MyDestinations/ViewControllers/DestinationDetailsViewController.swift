//
//  DestinationDetailsViewController.swift
//  MyDestinations
//
//  Created by Student on 04.05.2021..
//  Copyright © 2021 Ivan Barisic. All rights reserved.
//

import UIKit
import MapKit
import SDWebImage
class DestinationDetailsViewController: UIViewController {
    
    @IBOutlet weak var destinationMapView: MKMapView!
    @IBOutlet weak var destinationTitleLabel: UILabel!
    @IBOutlet weak var destinationDescriptionLabel: UILabel!
    @IBOutlet weak var destinationIDLabel: UILabel!
    @IBOutlet weak var destinationImageView: UIImageView!
    
    var destination: Destination?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        destinationTitleLabel.text = destination?.title
        destinationDescriptionLabel.text = destination?.description
        destinationIDLabel.text = destination?.id
        let url = URL(string: destination?.url ?? "")
        destinationImageView.sd_setImage(with: url, completed: nil)
        
        let location = CLLocationCoordinate2D(latitude: destination?.latitude ?? 45.555556, longitude: destination?.longitude ?? 18.694444)
        let pin = MKPointAnnotation(__coordinate: location, title: destination?.title, subtitle: "")
        let coordinateRegion = MKCoordinateRegion(center: pin.coordinate, latitudinalMeters: 800, longitudinalMeters: 800)
        destinationMapView.setRegion(coordinateRegion, animated: true)
        destinationMapView.addAnnotation(pin)
    }
}
