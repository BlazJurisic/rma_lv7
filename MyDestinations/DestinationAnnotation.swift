//
//  DestinationAnnotation.swift
//  MyDestinations
//
//  Created by Student on 04.05.2021..
//  Copyright © 2021 Ivan Barisic. All rights reserved.
//

import UIKit
import MapKit

class DestinationAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    init(with coordinate: CLLocationCoordinate2D, title: String?){
        self.coordinate = coordinate
        self.title = title
    }
    
}
